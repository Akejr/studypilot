# Instruções: Sistema de Ofensiva e PWA

## 🔥 Sistema de Ofensiva (Streak)

### 1. Configurar o Banco de Dados
Execute o script `CREATE_STREAK_SYSTEM.sql` no Supabase SQL Editor.

Este script vai:
- ✅ Criar a tabela `user_streak`
- ✅ Criar função para atualizar streak automaticamente
- ✅ Criar trigger que dispara quando uma sessão é completada
- ✅ Inicializar o registro de streak

### 2. Como Funciona
- **Primeiro estudo**: Streak começa em 1 dia
- **Estudou ontem e hoje**: Streak aumenta +1
- **Pulou um dia**: Streak reseta para 1
- **Recorde**: Sempre salva o maior streak alcançado

### 3. Regras
- Só conta 1 estudo por dia (mesmo que faça vários)
- Precisa completar a sessão (responder todas as perguntas)
- Atualiza automaticamente ao finalizar o estudo

### 4. Visualização
O card de streak aparece no topo da página principal mostrando:
- 🔥 Ofensiva atual (dias consecutivos)
- 🏆 Maior ofensiva (recorde pessoal)
- 💬 Mensagem motivacional

---

## 📱 PWA (Progressive Web App)

### 1. O que foi configurado
- ✅ Manifest.json com metadados do app
- ✅ Service Worker para funcionar offline
- ✅ Meta tags para iOS
- ✅ Ícones e splash screens

### 2. Criar os Ícones
Você precisa criar 2 ícones:
- `client/public/icon-192.png` (192x192px)
- `client/public/icon-512.png` (512x512px)

**Recomendação de design:**
- Fundo azul (#3b82f6)
- Ícone de avião branco
- Estilo minimalista

**Ferramentas:**
- https://www.pwabuilder.com/imageGenerator
- Canva, Figma, ou qualquer editor de imagens

### 3. Como Instalar no iPhone

#### Passo 1: Acessar o site
1. Abra o Safari no iPhone
2. Acesse http://localhost:3005 (ou seu domínio)

#### Passo 2: Adicionar à Tela Inicial
1. Toque no botão de compartilhar (quadrado com seta para cima)
2. Role para baixo e toque em "Adicionar à Tela de Início"
3. Edite o nome se quiser
4. Toque em "Adicionar"

#### Passo 3: Usar como App
1. O ícone aparecerá na tela inicial
2. Toque para abrir como app nativo
3. Funciona em tela cheia, sem barra do Safari
4. Funciona offline (após primeira visita)

### 4. Recursos do PWA
- ✅ **Instalável**: Adiciona à tela inicial
- ✅ **Offline**: Funciona sem internet (cache)
- ✅ **Tela cheia**: Sem barra do navegador
- ✅ **Rápido**: Carrega instantaneamente
- ✅ **Nativo**: Parece um app nativo

### 5. Testar o PWA
1. Abra o Chrome DevTools (F12)
2. Vá para a aba "Application"
3. Verifique:
   - Manifest
   - Service Workers
   - Cache Storage

---

## 🚀 Próximos Passos

### Para usar em produção:
1. **Deploy do site** em um servidor HTTPS (obrigatório para PWA)
2. **Criar os ícones** conforme instruções acima
3. **Testar no iPhone** seguindo os passos de instalação
4. **Executar o script** `CREATE_STREAK_SYSTEM.sql` no Supabase

### Melhorias futuras (opcional):
- Notificações push para lembrar de estudar
- Modo escuro
- Compartilhar progresso nas redes sociais
- Badges de conquistas
- Gráficos de progresso ao longo do tempo

---

## 📊 Resumo das Alterações

### Arquivos Criados:
1. `CREATE_STREAK_SYSTEM.sql` - Script do banco de dados
2. `client/src/components/StreakCard.tsx` - Componente visual
3. `client/public/manifest.json` - Configuração do PWA
4. `client/public/sw.js` - Service Worker
5. `CREATE_PWA_ICONS.md` - Instruções para ícones
6. Este arquivo de instruções

### Arquivos Modificados:
1. `client/src/hooks/useSupabaseData.ts` - Adicionado carregamento de streak
2. `client/src/pages/Categories.tsx` - Adicionado StreakCard
3. `client/index.html` - Adicionado meta tags e manifest

### Funcionalidades Adicionadas:
- ✅ Sistema de ofensiva (streak) com contagem de dias
- ✅ PWA completo para instalação no iPhone
- ✅ Funcionamento offline
- ✅ Ícone na tela inicial
- ✅ Experiência de app nativo

---

## ✅ Checklist Final

- [ ] Executar `CREATE_STREAK_SYSTEM.sql` no Supabase
- [ ] Criar ícones (icon-192.png e icon-512.png)
- [ ] Testar streak (fazer estudo hoje e amanhã)
- [ ] Testar PWA no iPhone
- [ ] Verificar se funciona offline
- [ ] Celebrar! 🎉
