# Configuração do Supabase para PilotStudy

## Passo 1: Criar Projeto no Supabase

1. Acesse [supabase.com](https://supabase.com)
2. Faça login ou crie uma conta
3. Clique em "New Project"
4. Escolha sua organização
5. Dê um nome ao projeto (ex: "pilotstudy")
6. Crie uma senha forte para o banco de dados
7. Escolha uma região próxima (ex: South America - São Paulo)
8. Clique em "Create new project"

## Passo 2: Configurar o Banco de Dados

1. Aguarde o projeto ser criado (pode levar alguns minutos)
2. No painel do Supabase, vá para "SQL Editor"
3. Clique em "New query"
4. Copie todo o conteúdo do arquivo `supabase-setup.sql`
5. Cole no editor SQL
6. Clique em "Run" para executar o script
7. Verifique se todas as tabelas foram criadas sem erros

## Passo 3: Obter as Chaves de API

1. No painel do Supabase, vá para "Settings" > "API"
2. Copie a "Project URL"
3. Copie a "anon public" key
4. **NÃO compartilhe a service_role key - ela é secreta!**

## Passo 4: Configurar as Variáveis de Ambiente

1. Abra o arquivo `.env` na raiz do projeto
2. Substitua as variáveis pelos valores do seu projeto:

```env
VITE_USE_BACKEND=false
VITE_SUPABASE_URL=https://seu-projeto-id.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon-aqui
```

## Passo 5: Testar a Conexão

1. Salve o arquivo `.env`
2. Execute o projeto:
   ```bash
   npm run dev
   ```
3. Acesse http://localhost:3006 (ou a porta que aparecer)
4. Você deve ver a categoria "Navegação (NAV)" com 15 perguntas
5. Teste clicar em "Estudar" - deve funcionar perfeitamente!

## Verificação

Se tudo estiver funcionando:
- ✅ Categorias carregam automaticamente
- ✅ Botão "Estudar" abre a tela de estudo
- ✅ Perguntas aparecem uma por vez
- ✅ Navegação entre perguntas funciona
- ✅ Resultados são salvos no Supabase

## Vantagens do Supabase

- ✅ **Confiável**: Banco PostgreSQL gerenciado
- ✅ **Rápido**: Sem necessidade de backend próprio
- ✅ **Escalável**: Suporta milhares de usuários
- ✅ **Gratuito**: Plano gratuito generoso
- ✅ **Real-time**: Atualizações em tempo real (se necessário)
- ✅ **Seguro**: Autenticação e autorização integradas

## Próximos Passos

Após configurar o Supabase, você pode:
1. Adicionar mais categorias e perguntas
2. Implementar estatísticas de desempenho
3. Adicionar sistema de usuários (se necessário)
4. Implementar backup automático
5. Configurar domínio personalizado