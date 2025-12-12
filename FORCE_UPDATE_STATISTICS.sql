-- Script para forçar atualização das estatísticas
-- Execute este SQL no painel do Supabase (SQL Editor)

-- Primeiro, vamos garantir que a tabela existe
CREATE TABLE IF NOT EXISTS category_statistics (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  total_questions_answered INTEGER DEFAULT 0,
  correct_answers INTEGER DEFAULT 0,
  wrong_answers INTEGER DEFAULT 0,
  last_study_date TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(category_id)
);

-- Criar índice se não existir
CREATE INDEX IF NOT EXISTS idx_category_statistics_category_id ON category_statistics(category_id);

-- Limpar estatísticas antigas (se houver)
TRUNCATE category_statistics;

-- Recalcular estatísticas baseado nas respostas existentes
INSERT INTO category_statistics (
  category_id,
  total_questions_answered,
  correct_answers,
  wrong_answers,
  last_study_date,
  created_at,
  updated_at
)
SELECT 
  ss.category_id,
  COUNT(a.id) as total_questions_answered,
  SUM(CASE WHEN a.is_correct THEN 1 ELSE 0 END) as correct_answers,
  SUM(CASE WHEN NOT a.is_correct THEN 1 ELSE 0 END) as wrong_answers,
  MAX(ss.completed_at) as last_study_date,
  NOW() as created_at,
  NOW() as updated_at
FROM study_sessions ss
JOIN answers a ON a.session_id = ss.id
WHERE ss.completed_at IS NOT NULL
GROUP BY ss.category_id
ON CONFLICT (category_id) 
DO UPDATE SET
  total_questions_answered = EXCLUDED.total_questions_answered,
  correct_answers = EXCLUDED.correct_answers,
  wrong_answers = EXCLUDED.wrong_answers,
  last_study_date = EXCLUDED.last_study_date,
  updated_at = NOW();

-- Inicializar estatísticas para categorias sem dados (com 0)
INSERT INTO category_statistics (category_id, total_questions_answered, correct_answers, wrong_answers)
SELECT 
  c.id,
  0,
  0,
  0
FROM categories c
WHERE NOT EXISTS (
  SELECT 1 FROM category_statistics cs WHERE cs.category_id = c.id
)
ON CONFLICT (category_id) DO NOTHING;

-- Mostrar resultado
SELECT 
  c.name as categoria,
  cs.total_questions_answered as total_respondidas,
  cs.correct_answers as acertos,
  cs.wrong_answers as erros,
  CASE 
    WHEN cs.total_questions_answered > 0 
    THEN ROUND((cs.correct_answers::numeric / cs.total_questions_answered::numeric) * 100, 2)
    ELSE 0 
  END as porcentagem_acerto
FROM category_statistics cs
JOIN categories c ON c.id = cs.category_id
ORDER BY c.name;
