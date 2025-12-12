-- Script para limpar todas as estatísticas e histórico de estudos
-- Execute este SQL no painel do Supabase (SQL Editor)
-- ⚠️ ATENÇÃO: Isso vai apagar TODOS os dados de estudos e estatísticas!

-- 1. Limpar todas as respostas
DELETE FROM answers;

-- 2. Limpar todas as sessões de estudo
DELETE FROM study_sessions;

-- 3. Resetar todas as estatísticas para zero
UPDATE category_statistics
SET 
  total_questions_answered = 0,
  correct_answers = 0,
  wrong_answers = 0,
  last_study_date = NULL,
  updated_at = NOW();

-- 4. Mostrar resultado
SELECT 
  c.name as categoria,
  cs.total_questions_answered as total_respondidas,
  cs.correct_answers as acertos,
  cs.wrong_answers as erros,
  '✅ Estatísticas resetadas' as status
FROM category_statistics cs
JOIN categories c ON c.id = cs.category_id
ORDER BY c.name;
