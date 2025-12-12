-- Script para remover perguntas duplicadas de Navegação
-- Execute este SQL no painel do Supabase (SQL Editor)

DO $BODY$
DECLARE
    nav_category_id UUID;
BEGIN
    -- Buscar o ID da categoria de Navegação
    SELECT id INTO nav_category_id FROM categories WHERE name = 'Navegação (NAV)';
    
    -- Deletar perguntas duplicadas, mantendo apenas a primeira ocorrência de cada pergunta
    -- Isso usa uma subconsulta para identificar duplicatas baseadas no texto da pergunta
    DELETE FROM questions
    WHERE id IN (
        SELECT id
        FROM (
            SELECT id,
                   ROW_NUMBER() OVER (PARTITION BY text ORDER BY created_at) AS rn
            FROM questions
            WHERE category_id = nav_category_id
        ) t
        WHERE t.rn > 1
    );
    
    -- Mostrar quantas perguntas restaram
    RAISE NOTICE 'Limpeza concluída. Total de perguntas de Navegação: %', 
        (SELECT COUNT(*) FROM questions WHERE category_id = nav_category_id);
    
END $BODY$;
