# Requirements Document

## Introduction

O sistema de estudos para piloto é uma aplicação web que permite aos usuários organizarem seus estudos através de categorias de perguntas, realizarem sessões de estudo com perguntas aleatórias, acompanharem seu desempenho e revisarem questões com maior dificuldade.

## Glossary

- **Sistema**: O sistema de estudos para piloto
- **Usuário**: Pessoa que utiliza o sistema para estudar
- **Categoria**: Agrupamento temático de perguntas relacionadas
- **Pergunta**: Questão de múltipla escolha com 4 opções de resposta
- **Sessão de Estudo**: Conjunto de 10 perguntas aleatórias de uma categoria
- **Sessão de Revisão**: Conjunto de 5 perguntas mais erradas de uma categoria
- **Resposta**: Uma das 4 opções disponíveis para cada pergunta
- **Explicação**: Texto que justifica a resposta correta
- **Resultado**: Porcentagem de acerto e detalhes de uma sessão

## Requirements

### Requirement 1

**User Story:** Como usuário, eu quero gerenciar categorias de estudo, para que eu possa organizar minhas perguntas por temas específicos.

#### Acceptance Criteria

1. WHEN o usuário cria uma nova categoria, THE Sistema SHALL armazenar a categoria com nome único e descrição
2. WHEN o usuário visualiza as categorias, THE Sistema SHALL exibir todas as categorias cadastradas com seus detalhes
3. WHEN o usuário edita uma categoria existente, THE Sistema SHALL atualizar as informações mantendo a integridade dos dados
4. WHEN o usuário tenta criar categoria com nome duplicado, THE Sistema SHALL rejeitar a operação e manter o estado atual
5. WHEN o usuário exclui uma categoria, THE Sistema SHALL remover a categoria e todas as perguntas associadas

### Requirement 2

**User Story:** Como usuário, eu quero adicionar perguntas às categorias, para que eu possa construir meu banco de questões de estudo.

#### Acceptance Criteria

1. WHEN o usuário adiciona uma pergunta, THE Sistema SHALL armazenar a pergunta com texto, 4 opções de resposta, resposta correta e explicação
2. WHEN o usuário visualiza perguntas de uma categoria, THE Sistema SHALL exibir todas as perguntas com suas opções e explicações
3. WHEN o usuário edita uma pergunta existente, THE Sistema SHALL atualizar as informações preservando o histórico de respostas
4. WHEN o usuário tenta adicionar pergunta sem resposta correta definida, THE Sistema SHALL rejeitar a operação
5. WHEN o usuário exclui uma pergunta, THE Sistema SHALL remover a pergunta e seu histórico de respostas

### Requirement 3

**User Story:** Como usuário, eu quero realizar sessões de estudo com perguntas aleatórias, para que eu possa testar meus conhecimentos de forma variada.

#### Acceptance Criteria

1. WHEN o usuário inicia uma sessão de estudo, THE Sistema SHALL selecionar 10 perguntas aleatórias da categoria escolhida
2. WHEN o usuário responde uma pergunta, THE Sistema SHALL registrar a resposta e avançar para a próxima pergunta
3. WHEN o usuário completa todas as perguntas, THE Sistema SHALL calcular a porcentagem de acerto
4. WHEN uma categoria tem menos de 10 perguntas, THE Sistema SHALL usar todas as perguntas disponíveis
5. WHEN o usuário abandona uma sessão, THE Sistema SHALL descartar o progresso atual

### Requirement 4

**User Story:** Como usuário, eu quero ver os resultados detalhados das minhas sessões, para que eu possa identificar áreas que preciso melhorar.

#### Acceptance Criteria

1. WHEN uma sessão é finalizada, THE Sistema SHALL exibir a porcentagem de acerto total
2. WHEN há respostas incorretas, THE Sistema SHALL mostrar cada pergunta errada com a resposta correta e explicação
3. WHEN o usuário visualiza resultados, THE Sistema SHALL destacar claramente as respostas corretas e incorretas
4. WHEN uma sessão é concluída, THE Sistema SHALL armazenar o histórico de respostas para análise futura
5. WHEN o usuário acessa o histórico, THE Sistema SHALL exibir todas as sessões anteriores com suas estatísticas

### Requirement 5

**User Story:** Como usuário, eu quero estudar as perguntas que mais erro, para que eu possa focar nas áreas de maior dificuldade.

#### Acceptance Criteria

1. WHEN o usuário solicita sessão de revisão, THE Sistema SHALL identificar as 5 perguntas com maior taxa de erro da categoria
2. WHEN não há histórico suficiente, THE Sistema SHALL selecionar 5 perguntas aleatórias da categoria
3. WHEN o usuário completa a sessão de revisão, THE Sistema SHALL atualizar as estatísticas de cada pergunta
4. WHEN uma categoria tem menos de 5 perguntas, THE Sistema SHALL usar todas as perguntas disponíveis
5. WHEN há empate na taxa de erro, THE Sistema SHALL priorizar perguntas respondidas mais recentemente

### Requirement 6

**User Story:** Como usuário, eu quero que o sistema persista meus dados, para que eu não perca meu progresso entre sessões.

#### Acceptance Criteria

1. WHEN dados são criados ou modificados, THE Sistema SHALL persistir as informações imediatamente
2. WHEN o usuário acessa o sistema, THE Sistema SHALL carregar todos os dados previamente salvos
3. WHEN ocorre erro de persistência, THE Sistema SHALL notificar o usuário e manter dados em memória
4. WHEN o sistema é reiniciado, THE Sistema SHALL restaurar o estado completo dos dados
5. WHEN dados são corrompidos, THE Sistema SHALL tentar recuperação ou inicializar estado limpo

### Requirement 7

**User Story:** Como desenvolvedor, eu quero uma API REST bem estruturada, para que o frontend possa interagir eficientemente com o backend.

#### Acceptance Criteria

1. WHEN requisições são feitas, THE Sistema SHALL responder com códigos HTTP apropriados
2. WHEN dados são enviados, THE Sistema SHALL validar entrada e rejeitar dados inválidos
3. WHEN erros ocorrem, THE Sistema SHALL retornar mensagens de erro descritivas
4. WHEN operações são bem-sucedidas, THE Sistema SHALL retornar dados no formato JSON consistente
5. WHEN múltiplas requisições simultâneas ocorrem, THE Sistema SHALL manter integridade dos dados