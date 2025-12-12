-- Script para criar sistema de ofensiva (streak)
-- Execute este SQL no painel do Supabase (SQL Editor)

-- Criar tabela de streak do usuário
CREATE TABLE IF NOT EXISTS user_streak (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_study_date DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Inserir registro inicial (como não temos sistema de usuários, usamos um registro global)
INSERT INTO user_streak (current_streak, longest_streak, last_study_date)
VALUES (0, 0, NULL)
ON CONFLICT DO NOTHING;

-- Função para atualizar streak quando uma sessão é completada
CREATE OR REPLACE FUNCTION update_user_streak()
RETURNS TRIGGER AS $BODY$
DECLARE
  streak_record RECORD;
  today DATE;
  yesterday DATE;
BEGIN
  today := CURRENT_DATE;
  yesterday := today - INTERVAL '1 day';
  
  -- Buscar registro de streak
  SELECT * INTO streak_record FROM user_streak LIMIT 1;
  
  -- Se não houver registro, criar um
  IF NOT FOUND THEN
    INSERT INTO user_streak (current_streak, longest_streak, last_study_date)
    VALUES (1, 1, today);
    RETURN NEW;
  END IF;
  
  -- Se já estudou hoje, não fazer nada
  IF streak_record.last_study_date = today THEN
    RETURN NEW;
  END IF;
  
  -- Se estudou ontem, incrementar streak
  IF streak_record.last_study_date = yesterday THEN
    UPDATE user_streak
    SET 
      current_streak = streak_record.current_streak + 1,
      longest_streak = GREATEST(streak_record.longest_streak, streak_record.current_streak + 1),
      last_study_date = today,
      updated_at = NOW()
    WHERE id = streak_record.id;
  -- Se não estudou ontem, resetar streak para 1
  ELSE
    UPDATE user_streak
    SET 
      current_streak = 1,
      longest_streak = GREATEST(streak_record.longest_streak, 1),
      last_study_date = today,
      updated_at = NOW()
    WHERE id = streak_record.id;
  END IF;
  
  RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

-- Criar trigger para atualizar streak quando uma sessão é completada
DROP TRIGGER IF EXISTS trigger_update_user_streak ON study_sessions;
CREATE TRIGGER trigger_update_user_streak
AFTER UPDATE OF completed_at ON study_sessions
FOR EACH ROW
WHEN (NEW.completed_at IS NOT NULL AND OLD.completed_at IS NULL)
EXECUTE FUNCTION update_user_streak();

-- Mostrar resultado
SELECT 
  current_streak as "Ofensiva Atual",
  longest_streak as "Maior Ofensiva",
  last_study_date as "Último Estudo",
  '✅ Sistema de ofensiva criado!' as status
FROM user_streak
LIMIT 1;
