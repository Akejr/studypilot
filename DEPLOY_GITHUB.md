# Como Fazer Deploy no GitHub

## 📋 Pré-requisitos
- Git instalado no seu computador
- Conta no GitHub
- Repositório criado: https://github.com/Akejr/studypilot

## 🚀 Passo a Passo

### 1. Inicializar Git (se ainda não foi feito)
```bash
git init
```

### 2. Adicionar o repositório remoto
```bash
git remote add origin https://github.com/Akejr/studypilot.git
```

### 3. Verificar arquivos a serem commitados
```bash
git status
```

### 4. Adicionar todos os arquivos
```bash
git add .
```

### 5. Fazer o commit
```bash
git commit -m "Initial commit: PilotStudy app with streak system and PWA"
```

### 6. Enviar para o GitHub
```bash
git push -u origin main
```

**Nota:** Se o branch principal for `master` em vez de `main`, use:
```bash
git push -u origin master
```

### 7. Se der erro de autenticação
Você precisará configurar suas credenciais do GitHub:

**Opção 1: HTTPS com Token**
1. Vá para GitHub → Settings → Developer settings → Personal access tokens
2. Gere um novo token com permissões de `repo`
3. Use o token como senha quando o Git pedir

**Opção 2: SSH**
1. Configure uma chave SSH: https://docs.github.com/pt/authentication/connecting-to-github-with-ssh
2. Mude a URL do remote:
```bash
git remote set-url origin git@github.com:Akejr/studypilot.git
```

---

## 📦 Arquivos Importantes para Incluir

Certifique-se de que estes arquivos estão no repositório:

### Código Principal
- ✅ `client/` - Todo o código frontend
- ✅ `shared/` - Código compartilhado
- ✅ `package.json` - Dependências
- ✅ `vite.config.ts` - Configuração do Vite
- ✅ `tsconfig.json` - Configuração TypeScript

### Scripts SQL
- ✅ `ADD_CATEGORIES.sql`
- ✅ `ADD_NAVIGATION_QUESTIONS.sql`
- ✅ `ADD_REGULATIONS_QUESTIONS.sql`
- ✅ `ADD_REGULATIONS_ANNEXES_QUESTIONS.sql`
- ✅ `CREATE_STREAK_SYSTEM.sql`
- ✅ `FORCE_UPDATE_STATISTICS.sql`
- ✅ `RESET_STATISTICS.sql`
- ✅ `FIX_DUPLICATE_NAVIGATION_QUESTIONS.sql`
- ✅ `CHECK_DATABASE_SETUP.sql`

### Documentação
- ✅ `README.md` (criar se não existir)
- ✅ `INSTRUCOES_SUPABASE.md`
- ✅ `INSTRUCOES_PWA_E_STREAK.md`
- ✅ `CREATE_PWA_ICONS.md`

### Arquivos PWA
- ✅ `client/public/manifest.json`
- ✅ `client/public/sw.js`
- ✅ `client/index.html`

### Arquivos a NÃO incluir (.gitignore)
- ❌ `node_modules/`
- ❌ `.env` (credenciais sensíveis)
- ❌ `.env.local`
- ❌ `dist/`
- ❌ `.vscode/` (opcional)

---

## 📝 Criar/Atualizar .gitignore

Certifique-se de que seu `.gitignore` contém:

```
# Dependencies
node_modules/

# Build output
dist/
build/

# Environment variables
.env
.env.local
.env.production

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
```

---

## 📖 Criar README.md

Crie um arquivo `README.md` na raiz do projeto:

```markdown
# PilotStudy 🛩️

Aplicativo de estudo para pilotos com questões de aviação civil.

## 🚀 Funcionalidades

- ✅ Sistema de estudos com questões aleatórias
- ✅ 5 categorias de estudo (Navegação, Regulamentos, Meteorologia, etc.)
- ✅ Estatísticas de desempenho por categoria
- ✅ Sistema de ofensiva (streak) para motivação
- ✅ Tela de resultados com explicações detalhadas
- ✅ PWA - Funciona como app nativo no iPhone
- ✅ Funciona offline

## 🛠️ Tecnologias

- React + TypeScript
- Vite
- Supabase (Backend)
- TailwindCSS
- Shadcn/ui

## 📦 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/Akejr/studypilot.git
cd studypilot
```

2. Instale as dependências:
```bash
npm install
```

3. Configure o Supabase:
   - Crie um projeto no Supabase
   - Execute os scripts SQL na pasta raiz
   - Configure as variáveis de ambiente

4. Crie o arquivo `.env`:
```
VITE_SUPABASE_URL=sua_url_aqui
VITE_SUPABASE_ANON_KEY=sua_chave_aqui
```

5. Execute o projeto:
```bash
npm run dev
```

## 📱 Instalar como PWA no iPhone

1. Abra o Safari e acesse o site
2. Toque no botão de compartilhar
3. Selecione "Adicionar à Tela de Início"
4. Pronto! Use como app nativo

## 📚 Documentação

- [Instruções Supabase](INSTRUCOES_SUPABASE.md)
- [Instruções PWA e Streak](INSTRUCOES_PWA_E_STREAK.md)
- [Criar Ícones PWA](CREATE_PWA_ICONS.md)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## 📄 Licença

MIT
```

---

## ✅ Checklist Final

Antes de fazer o push:

- [ ] Verificar se `.gitignore` está correto
- [ ] Remover arquivos sensíveis (.env)
- [ ] Criar README.md
- [ ] Testar se o projeto funciona localmente
- [ ] Fazer commit de todas as alterações
- [ ] Push para o GitHub

---

## 🌐 Deploy em Produção (Opcional)

Depois de subir no GitHub, você pode fazer deploy em:

### Vercel (Recomendado)
1. Acesse https://vercel.com
2. Conecte seu repositório GitHub
3. Configure as variáveis de ambiente
4. Deploy automático!

### Netlify
1. Acesse https://netlify.com
2. Conecte seu repositório GitHub
3. Configure build: `npm run build`
4. Configure publish directory: `dist`
5. Adicione variáveis de ambiente
6. Deploy!

### GitHub Pages
Não recomendado para este projeto (precisa de variáveis de ambiente)

---

## 🎉 Pronto!

Seu projeto estará disponível em:
https://github.com/Akejr/studypilot

E se fizer deploy:
https://studypilot.vercel.app (ou seu domínio)
```
