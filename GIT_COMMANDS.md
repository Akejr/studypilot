# Comandos Git para Upload

Execute estes comandos no terminal (CMD ou PowerShell) na pasta do projeto:

## 1️⃣ Verificar status
```bash
git status
```

## 2️⃣ Adicionar todos os arquivos
```bash
git add .
```

## 3️⃣ Fazer commit
```bash
git commit -m "Initial commit: PilotStudy app completo com streak e PWA"
```

## 4️⃣ Adicionar repositório remoto (se ainda não foi feito)
```bash
git remote add origin https://github.com/Akejr/studypilot.git
```

## 5️⃣ Verificar se o remote foi adicionado
```bash
git remote -v
```

## 6️⃣ Fazer push para o GitHub
```bash
git push -u origin main
```

**Se der erro dizendo que o branch é `master` em vez de `main`:**
```bash
git branch -M main
git push -u origin main
```

## 🔐 Se pedir autenticação

### Opção 1: Token de Acesso Pessoal
1. Vá para GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Clique em "Generate new token (classic)"
3. Dê um nome (ex: "PilotStudy")
4. Marque a opção `repo` (acesso completo aos repositórios)
5. Clique em "Generate token"
6. **COPIE O TOKEN** (você não verá ele novamente!)
7. Quando o Git pedir senha, cole o token

### Opção 2: GitHub CLI
```bash
# Instalar GitHub CLI
winget install GitHub.cli

# Fazer login
gh auth login

# Seguir as instruções na tela
```

## 📝 Comandos Úteis

### Ver histórico de commits
```bash
git log --oneline
```

### Ver diferenças
```bash
git diff
```

### Desfazer último commit (mantém as alterações)
```bash
git reset --soft HEAD~1
```

### Atualizar do GitHub
```bash
git pull origin main
```

### Criar nova branch
```bash
git checkout -b nome-da-branch
```

### Mudar de branch
```bash
git checkout main
```

## ✅ Checklist

- [ ] `git status` - Verificar arquivos
- [ ] `git add .` - Adicionar todos
- [ ] `git commit -m "mensagem"` - Fazer commit
- [ ] `git remote add origin URL` - Adicionar remote
- [ ] `git push -u origin main` - Enviar para GitHub
- [ ] Verificar no GitHub se os arquivos apareceram

## 🎉 Pronto!

Seu código estará em: https://github.com/Akejr/studypilot
