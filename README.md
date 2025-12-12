# PilotStudy 🛩️

Aplicativo de estudo para pilotos com questões de aviação civil brasileira.

![PilotStudy](https://img.shields.io/badge/Status-Active-success)
![React](https://img.shields.io/badge/React-18-blue)
![TypeScript](https://img.shields.io/badge/TypeScript-5-blue)
![Supabase](https://img.shields.io/badge/Supabase-Backend-green)

## 🚀 Funcionalidades

- ✅ **Sistema de Estudos** - Questões aleatórias com 4 alternativas
- ✅ **5 Categorias** - Navegação, Regulamentos, Meteorologia, Aerodinâmica, Aeronave e Motores
- ✅ **Estatísticas** - Acompanhe seu desempenho por categoria
- ✅ **Sistema de Ofensiva** - Mantenha sua sequência de dias estudando
- ✅ **Resultados Detalhados** - Veja explicações das questões erradas
- ✅ **PWA** - Funciona como app nativo no iPhone/Android
- ✅ **Offline** - Estude mesmo sem internet

## 📊 Banco de Questões

- **Navegação (NAV)**: 35 questões sobre coordenadas, planejamento de voo e navegação aérea
- **Regulamentos (RG)**: 45 questões sobre ICAO/OACI, Convenção de Chicago e Anexos
- **Meteorologia (MT)**: Em breve
- **Aerodinâmica (TV)**: Em breve
- **Aeronave e Motores (CT)**: Em breve

## 🛠️ Tecnologias

- **Frontend**: React 18 + TypeScript + Vite
- **Styling**: TailwindCSS + Shadcn/ui
- **Backend**: Supabase (PostgreSQL)
- **PWA**: Service Worker + Manifest
- **Routing**: Wouter

## 📦 Instalação

### 1. Clone o repositório
```bash
git clone https://github.com/Akejr/studypilot.git
cd studypilot
```

### 2. Instale as dependências
```bash
npm install
```

### 3. Configure o Supabase

#### 3.1. Crie um projeto no Supabase
- Acesse https://supabase.com
- Crie um novo projeto
- Anote a URL e a chave anônima

#### 3.2. Execute os scripts SQL
Execute os scripts na seguinte ordem no SQL Editor do Supabase:

1. `EXECUTE_NO_SUPABASE.sql` - Cria as tabelas básicas
2. `ADD_CATEGORIES.sql` - Adiciona categorias e sistema de estatísticas
3. `ADD_NAVIGATION_QUESTIONS.sql` - 20 questões de navegação
4. `FIX_DUPLICATE_NAVIGATION_QUESTIONS.sql` - Remove duplicatas (se necessário)
5. `ADD_REGULATIONS_QUESTIONS.sql` - 20 questões de regulamentos
6. `ADD_REGULATIONS_ANNEXES_QUESTIONS.sql` - 25 questões sobre anexos
7. `CREATE_STREAK_SYSTEM.sql` - Sistema de ofensiva
8. `FORCE_UPDATE_STATISTICS.sql` - Atualiza estatísticas

### 4. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anonima-aqui
```

### 5. Execute o projeto
```bash
npm run dev
```

Acesse http://localhost:3005

## 📱 Instalar como PWA

### iPhone (Safari)
1. Abra o Safari e acesse o site
2. Toque no botão de compartilhar (quadrado com seta)
3. Role para baixo e toque em "Adicionar à Tela de Início"
4. Toque em "Adicionar"
5. Pronto! O ícone aparecerá na tela inicial

### Android (Chrome)
1. Abra o Chrome e acesse o site
2. Toque no menu (3 pontos)
3. Selecione "Adicionar à tela inicial"
4. Toque em "Adicionar"

## 🎨 Criar Ícones do PWA

Você precisa criar 2 ícones e colocá-los em `client/public/`:
- `icon-192.png` (192x192px)
- `icon-512.png` (512x512px)

**Recomendação de design:**
- Fundo azul (#3b82f6)
- Ícone de avião branco
- Estilo minimalista

**Ferramentas:**
- https://www.pwabuilder.com/imageGenerator
- Canva, Figma, ou qualquer editor de imagens

## 📚 Documentação

- [Instruções Supabase](INSTRUCOES_SUPABASE.md) - Configuração completa do banco
- [Instruções PWA e Streak](INSTRUCOES_PWA_E_STREAK.md) - Sistema de ofensiva e PWA
- [Criar Ícones PWA](CREATE_PWA_ICONS.md) - Como criar os ícones
- [Deploy GitHub](DEPLOY_GITHUB.md) - Como fazer upload para o GitHub

## 🚀 Deploy em Produção

### Vercel (Recomendado)
1. Acesse https://vercel.com
2. Conecte seu repositório GitHub
3. Configure as variáveis de ambiente (VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY)
4. Deploy automático!

### Netlify
1. Acesse https://netlify.com
2. Conecte seu repositório GitHub
3. Build command: `npm run build`
4. Publish directory: `dist`
5. Adicione as variáveis de ambiente
6. Deploy!

## 🔧 Scripts Disponíveis

```bash
npm run dev          # Inicia o servidor de desenvolvimento
npm run build        # Cria build de produção
npm run preview      # Preview do build de produção
npm run lint         # Executa o linter
```

## 📖 Como Usar

1. **Escolha uma categoria** na tela principal
2. **Clique em "Estudar"** para iniciar uma sessão com 10 questões aleatórias
3. **Responda as questões** selecionando uma alternativa
4. **Navegue** entre as questões com os botões "Anterior" e "Próxima"
5. **Finalize** clicando em "Finalizar" na última questão
6. **Veja seus resultados** com explicações das questões erradas
7. **Mantenha sua ofensiva** estudando todos os dias!

## 🎯 Roadmap

- [ ] Adicionar questões de Meteorologia
- [ ] Adicionar questões de Aerodinâmica
- [ ] Adicionar questões de Aeronave e Motores
- [ ] Sistema de usuários com login
- [ ] Notificações push para lembrar de estudar
- [ ] Modo escuro
- [ ] Compartilhar progresso nas redes sociais
- [ ] Badges de conquistas
- [ ] Gráficos de progresso ao longo do tempo
- [ ] Modo de simulado (tempo cronometrado)

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Evandro Casanova**
- GitHub: [@Akejr](https://github.com/Akejr)

## 🙏 Agradecimentos

- ANAC - Agência Nacional de Aviação Civil
- ICAO/OACI - Organização de Aviação Civil Internacional
- Comunidade de pilotos brasileiros

---

**Bons estudos e voos seguros! ✈️**
