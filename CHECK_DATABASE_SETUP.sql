-- Script para verificar se o banco de dados está configurado corretamente
-- Execute este SQL no painel do Supabase (SQL Editor)

-- 1. Verificar se a tabela category_statistics existe
SELECT 
    CASE 
        WHEN EXISTS (
            SELECT FROM information_schema.tables 
            WHERE table_schema = 'public' 
            AND table_name = 'category_statistics'
        ) 
        THEN '✅ Tabela category_statistics existe'
        ELSE '❌ Tabela category_statistics NÃO existe - Execute ADD_CATEGORIES.sql'
    END as status_tabela;

-- 2. Verificar se o trigger existe
SELECT 
    CASE 
        WHEN EXISTS (
            SELECT FROM information_schema.triggers 
            WHERE trigger_name = 'trigger_update_category_statistics'
        ) 
        THEN '✅ Trigger trigger_update_category_statistics existe'
        ELSE '❌ Trigger NÃO existe - Execute ADD_CATEGORIES.sql'
    END as status_trigger;

-- 3. Verificar quantas categorias existem
SELECT 
    COUNT(*) as total_categorias,
    '✅ Categorias encontradas' as status
FROM categories;

-- 4. Listar todas as categorias
SELECT 
    id,
    name,
    (SELECT COUNT(*) FROM questions WHERE category_id = c.id) as total_perguntas
FROM categories c
ORDER BY created_at;

-- 5. Verificar se há estatísticas inicializadas
SELECT 
    CASE 
        WHEN EXISTS (SELECT FROM category_statistics) 
        THEN CONCAT('✅ ', (SELECT COUNT(*) FROM category_statistics)::text, ' estatísticas inicializadas')
        ELSE '❌ Nenhuma estatística inicializada - Execute ADD_CATEGORIES.sql'
    END as status_estatisticas;

-- 6. Mostrar estatísticas atuais (se existirem)
SELECT 
    c.name as categoria,
    cs.total_questions_answered as total_respondidas,
    cs.correct_answers as acertos,
    cs.wrong_answers as erros,
    CASE 
        WHEN cs.total_questions_answered > 0 
        THEN ROUND((cs.correct_answers::numeric / cs.total_questions_answered::numeric) * 100, 2)
        ELSE 0 
    END as porcentagem
FROM category_statistics cs
JOIN categories c ON c.id = cs.category_id
ORDER BY c.name;

-- 7. Verificar sessões de estudo completadas
SELECT 
    COUNT(*) as sessoes_completadas,
    CASE 
        WHEN COUNT(*) > 0 
        THEN '✅ Há sessões completadas'
        ELSE '⚠️ Nenhuma sessão completada ainda'
    END as status
FROM study_sessions
WHERE completed_at IS NOT NULL;

-- 8. Verificar respostas salvas
SELECT 
    COUNT(*) as total_respostas,
    SUM(CASE WHEN is_correct THEN 1 ELSE 0 END) as respostas_corretas,
    SUM(CASE WHEN NOT is_correct THEN 1 ELSE 0 END) as respostas_erradas,
    CASE 
        WHEN COUNT(*) > 0 
        THEN '✅ Há respostas salvas'
        ELSE '⚠️ Nenhuma resposta salva ainda'
    END as status
FROM answers;
