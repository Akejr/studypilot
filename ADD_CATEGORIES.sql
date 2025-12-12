-- Script para adicionar novas categorias
-- Execute este SQL no painel do Supabase (SQL Editor)

-- Adicionar novas categorias
INSERT INTO categories (name, description) VALUES 
('Meteorologia (MT)', 'Questões sobre meteorologia aeronáutica, fenômenos atmosféricos, previsão do tempo, cartas meteorológicas e interpretação de informações meteorológicas'),
('Aerodinâmica e Teoria do Voo (TV)', 'Questões sobre princípios de aerodinâmica, forças atuantes no voo, estabilidade, controle, performance de aeronaves e teoria do voo'),
('Regulamentos de Tráfego Aéreo (RG)', 'Questões sobre regras de tráfego aéreo, procedimentos operacionais, comunicações, fraseologia aeronáutica e regulamentação da aviação civil'),
('Aeronave e Motores - Conhecimentos Técnicos (CT)', 'Questões sobre sistemas de aeronaves, motores, instrumentos, manutenção, componentes estruturais e sistemas de propulsão')
ON CONFLICT (name) DO NOTHING;

-- Criar tabela de estatísticas por categoria para cada usuário
-- Como não temos sistema de usuários ainda, vamos criar uma tabela global de estatísticas
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

-- Criar índices para melhor performance
CREATE INDEX IF NOT EXISTS idx_category_statistics_category_id ON category_statistics(category_id);
CREATE INDEX IF NOT EXISTS idx_answers_session_id ON answers(session_id);
CREATE INDEX IF NOT EXISTS idx_answers_question_id ON answers(question_id);
CREATE INDEX IF NOT EXISTS idx_study_sessions_category_id ON study_sessions(category_id);

-- Função para atualizar estatísticas automaticamente
CREATE OR REPLACE FUNCTION update_category_statistics()
RETURNS TRIGGER AS $$
BEGIN
  -- Atualizar ou inserir estatísticas da categoria
  INSERT INTO category_statistics (
    category_id,
    total_questions_answered,
    correct_answers,
    wrong_answers,
    last_study_date
  )
  SELECT 
    ss.category_id,
    COUNT(a.id) as total_questions_answered,
    SUM(CASE WHEN a.is_correct THEN 1 ELSE 0 END) as correct_answers,
    SUM(CASE WHEN NOT a.is_correct THEN 1 ELSE 0 END) as wrong_answers,
    MAX(ss.completed_at) as last_study_date
  FROM study_sessions ss
  JOIN answers a ON a.session_id = ss.id
  WHERE ss.category_id = (
    SELECT category_id FROM study_sessions WHERE id = NEW.session_id
  )
  AND ss.completed_at IS NOT NULL
  GROUP BY ss.category_id
  ON CONFLICT (category_id) 
  DO UPDATE SET
    total_questions_answered = EXCLUDED.total_questions_answered,
    correct_answers = EXCLUDED.correct_answers,
    wrong_answers = EXCLUDED.wrong_answers,
    last_study_date = EXCLUDED.last_study_date,
    updated_at = NOW();
    
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criar trigger para atualizar estatísticas quando respostas são inseridas
DROP TRIGGER IF EXISTS trigger_update_category_statistics ON answers;
CREATE TRIGGER trigger_update_category_statistics
AFTER INSERT ON answers
FOR EACH ROW
EXECUTE FUNCTION update_category_statistics();

-- Inicializar estatísticas para categorias existentes
INSERT INTO category_statistics (category_id, total_questions_answered, correct_answers, wrong_answers)
SELECT 
  c.id,
  0,
  0,
  0
FROM categories c
ON CONFLICT (category_id) DO NOTHING;
