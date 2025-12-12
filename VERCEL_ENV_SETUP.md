# Configuração de Variáveis de Ambiente na Vercel

## Problema
O site está em branco porque as variáveis de ambiente do Supabase não estão configuradas na Vercel.

## Solução

### Passo 1: Acessar o Painel da Vercel
1. Acesse https://vercel.com
2. Entre no seu projeto **studypilot**
3. Clique em **Settings** (Configurações)
4. No menu lateral, clique em **Environment Variables**

### Passo 2: Adicionar as Variáveis
Adicione as seguintes variáveis de ambiente:

#### Variável 1: VITE_SUPABASE_URL
- **Name:** `VITE_SUPABASE_URL`
- **Value:** `https://zwpvzatqopddrexxxsiv.supabase.co`
- **Environment:** Marque todas (Production, Preview, Development)

#### Variável 2: VITE_SUPABASE_ANON_KEY
- **Name:** `VITE_SUPABASE_ANON_KEY`
- **Value:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3cHZ6YXRxb3BkZHJleHh4c2l2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU0OTI0MjMsImV4cCI6MjA4MTA2ODQyM30.KViiMetC0BZAxHatECEOZcDProLGF1iGS_KkmsU2nEQ`
- **Environment:** Marque todas (Production, Preview, Development)

### Passo 3: Fazer Redeploy
Após adicionar as variáveis:
1. Vá em **Deployments**
2. Clique nos 3 pontinhos do último deploy
3. Clique em **Redeploy**
4. Confirme o redeploy

## Resultado Esperado
Após o redeploy, o site deve carregar normalmente com todas as funcionalidades do Supabase funcionando.

## Observações Importantes
- ⚠️ **NUNCA** commite o arquivo `.env` no Git (ele já está no .gitignore)
- ✅ As variáveis `VITE_*` são públicas e podem ser expostas no frontend
- ✅ A chave `VITE_SUPABASE_ANON_KEY` é segura para uso público (tem permissões limitadas)
- ❌ A chave `SUPABASE_SERVICE_ROLE_KEY` NÃO deve ser adicionada (é apenas para backend)

## Outros Problemas no Console

### Ícones PWA Faltando
Os erros sobre `icon-192.png` e `icon-512.png` são normais - você ainda não criou os ícones.
Veja o arquivo `CREATE_PWA_ICONS.md` para instruções de como criar.

### Service Worker
O erro do Service Worker com `chrome-extension` é normal e não afeta o funcionamento.
