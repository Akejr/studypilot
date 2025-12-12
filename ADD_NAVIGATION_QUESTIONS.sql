-- Script para adicionar 20 novas perguntas de Navegação
-- Execute este SQL no painel do Supabase (SQL Editor)

DO $$
DECLARE
    nav_category_id UUID;
BEGIN
    -- Buscar o ID da categoria de Navegação
    SELECT id INTO nav_category_id FROM categories WHERE name = 'Navegação (NAV)';
    
    -- Inserir as 20 novas perguntas
    INSERT INTO questions (category_id, text, option1, option2, option3, option4, correct_answer, explanation) VALUES
    
    -- PERGUNTA 1
    (nav_category_id, 'Origem Histórica do Sistema de Coordenadas: Qual matemático desenvolveu inicialmente o sistema de coordenadas planas?', 
    'Isaac Newton', 
    'René Descartes', 
    'Euclides de Alexandria', 
    'Pitágoras', 
    1, 
    'René Descartes desenvolveu o sistema de coordenadas planas, também conhecido como sistema cartesiano. Este sistema revolucionou a matemática ao permitir a representação geométrica de equações algébricas através de dois eixos perpendiculares.'),
    
    -- PERGUNTA 2
    (nav_category_id, 'Componentes do Sistema de Coordenadas Planas: No sistema de coordenadas planas desenvolvido por René Descartes, qual é a função do eixo X e do eixo Y?', 
    'Eixo X é vertical e eixo Y é horizontal', 
    'Eixo X é horizontal e eixo Y é vertical, permitindo determinar qualquer posição através de gratículas numeradas', 
    'Ambos são utilizados apenas para cálculos matemáticos, não tendo aplicação prática', 
    'Eixo X representa o tempo e eixo Y representa a velocidade', 
    1, 
    'No sistema de coordenadas planas, o eixo X é horizontal (esquerda-direita) e o eixo Y é vertical (cima-baixo). Através de gratículas (linhas de grade) com números atribuídos a cada eixo, é possível determinar qualquer posição dentro de uma área. Esse sistema é análogo ao jogo de Batalha Naval, onde você localiza um alvo através de coordenadas.'),
    
    -- PERGUNTA 3
    (nav_category_id, 'Analogia com Batalha Naval: Por que o sistema de coordenadas planas é comparado ao jogo de Batalha Naval?', 
    'Porque ambos envolvem água e navios', 
    'Porque ambos utilizam uma grade de coordenadas para localizar posições específicas', 
    'Porque ambos foram desenvolvidos por matemáticos militares', 
    'Porque ambos requerem o uso de um transferidor', 
    1, 
    'O sistema de coordenadas planas é comparado ao Batalha Naval porque ambos utilizam uma grade de coordenadas (linhas horizontais e verticais numeradas) para localizar posições específicas. No jogo, você usa coordenadas como "B5" para atacar; na navegação, usa coordenadas para determinar posições geográficas.'),
    
    -- PERGUNTA 4
    (nav_category_id, 'Medida Total do Círculo: Qual é a medida total de um círculo em graus, conforme utilizado na navegação aérea?', 
    '180 graus', 
    '270 graus', 
    '360 graus', 
    '450 graus', 
    2, 
    'Um círculo completo mede 360 graus. Esta medida é fundamental na navegação aérea, pois todas as direções possíveis são representadas dentro desses 360 graus, começando do Norte (0°/360°) e percorrendo todo o horizonte em sentido horário.'),
    
    -- PERGUNTA 5
    (nav_category_id, 'Medida dos Lados do Quadrado: Na navegação aérea, qual é a medida de cada lado de um quadrado em graus?', 
    '45 graus', 
    '60 graus', 
    '90 graus', 
    '180 graus', 
    2, 
    'Cada lado do quadrado mede 90 graus. Como um quadrado tem 4 lados, a soma total é 360 graus, o mesmo que um círculo completo. Os quatro lados do quadrado correspondem às quatro direções cardeais: Norte (0°), Leste (90°), Sul (180°) e Oeste (270°).'),
    
    -- PERGUNTA 6
    (nav_category_id, 'Direções Cardeais em Graus: Qual é o valor angular correspondente à direção Sul na navegação aérea?', 
    '0 graus', 
    '90 graus', 
    '180 graus', 
    '270 graus', 
    2, 
    'A direção Sul corresponde a 180 graus. Partindo do Norte (0°) e percorrendo em sentido horário, temos: Leste (90°), Sul (180°), Oeste (270°) e volta ao Norte (360°/0°).'),
    
    -- PERGUNTA 7
    (nav_category_id, 'Origem da Contagem Angular: Qual é o ponto de origem para a contagem de ângulos na navegação aérea?', 
    'Uma linha horizontal apontando para a direita (Leste)', 
    'Uma linha vertical apontando para cima, fazendo referência ao Norte Verdadeiro', 
    'Uma linha diagonal apontando para o Sudeste', 
    'Uma linha horizontal apontando para a esquerda (Oeste)', 
    1, 
    'O ponto de origem para a contagem de ângulos é uma linha vertical apontando para cima, que faz referência ao Norte Verdadeiro. Esse ponto pode ser designado como 0° ou 360°, representando o mesmo local. A partir desse ponto, os ângulos são medidos em sentido horário, percorrendo todo o círculo de 360 graus.'),
    
    -- PERGUNTA 8
    (nav_category_id, 'Sentido de Abertura de Arco: Em qual sentido os ângulos são medidos a partir do ponto de origem (Norte Verdadeiro)?', 
    'Sentido anti-horário (para a esquerda)', 
    'Sentido horário (para a direita)', 
    'Alternando entre horário e anti-horário conforme a posição', 
    'Não há um sentido específico, pode ser qualquer um', 
    1, 
    'Os ângulos são sempre medidos em sentido horário a partir do ponto de origem (Norte Verdadeiro). Isso significa que se você começar em 0° (Norte) e abrir 90° para a direita, chegará a 90° (Leste). Continuando 90° mais, chegará a 180° (Sul), depois 270° (Oeste) e finalmente 360° (voltando ao Norte).'),
    
    -- PERGUNTA 9
    (nav_category_id, 'Transferidor de Navegação vs. Transferidor Escolar: Qual é a principal diferença entre um transferidor de navegação aérea e um transferidor escolar?', 
    'O transferidor escolar é maior', 
    'O transferidor de navegação tem 360 graus completos e inclui a rosa dos ventos, enquanto o escolar geralmente tem apenas 180 graus', 
    'O transferidor escolar é mais preciso', 
    'Não há diferença, são exatamente iguais', 
    1, 
    'O transferidor utilizado em navegação aérea e marítima possui 360 graus completos com a rosa dos ventos integrada, permitindo fazer leituras de todas as direções possíveis. O transferidor escolar, por sua vez, geralmente possui apenas 180 graus, sendo adequado apenas para cálculos matemáticos básicos, não para navegação.'),
    
    -- PERGUNTA 10
    (nav_category_id, 'Procedimento de Planejamento de Navegação - Passo 1: Qual é o primeiro passo para planejar uma navegação de uma cidade A para uma cidade B em uma carta?', 
    'Colocar o transferidor sobre a cidade de origem', 
    'Localizar a cidade A (origem) e a cidade B (destino)', 
    'Traçar uma linha vertical apontando para o Norte Verdadeiro', 
    'Fazer a leitura de proa no transferidor', 
    1, 
    'O primeiro passo é sempre localizar claramente a cidade A (origem) e a cidade B (destino) na carta de navegação. Sem identificar corretamente esses dois pontos, não é possível traçar a rota ou fazer qualquer cálculo de navegação.'),
    
    -- PERGUNTA 11
    (nav_category_id, 'Procedimento de Planejamento de Navegação - Passo 2: Após localizar a cidade A e a cidade B, qual é o próximo passo no planejamento de navegação?', 
    'Colocar o transferidor sobre a cidade de origem', 
    'Fazer a leitura de proa', 
    'Traçar uma linha conectando a cidade A à cidade B', 
    'Traçar uma linha vertical apontando para o Norte Verdadeiro', 
    2, 
    'Após localizar as duas cidades, o próximo passo é traçar uma linha reta conectando a cidade A à cidade B. Esta linha representa a rota direta que a aeronave deve seguir e será usada posteriormente para determinar a proa.'),
    
    -- PERGUNTA 12
    (nav_category_id, 'Procedimento de Planejamento de Navegação - Referência de Norte: Por que é importante traçar uma linha vertical apontando para cima na cidade de origem durante o planejamento de navegação?', 
    'Para decorar a carta', 
    'Para fazer referência ao Norte Verdadeiro, servindo como ponto de partida para a contagem angular', 
    'Para indicar a altitude de voo', 
    'Para marcar o ponto de reabastecimento', 
    1, 
    'A linha vertical apontando para cima na cidade de origem serve como referência ao Norte Verdadeiro, que é o ponto de partida (0°) para toda contagem angular. Esta referência é essencial para posicionar corretamente o transferidor e fazer a leitura precisa da proa.'),
    
    -- PERGUNTA 13
    (nav_category_id, 'Leitura de Proa no Transferidor: Como é feita a leitura de proa (heading) quando o transferidor está posicionado corretamente sobre a cidade de origem?', 
    'Lendo o número onde a linha de rota cruza a escala do transferidor, no sentido horário', 
    'Lendo o número onde a linha de rota cruza a escala do transferidor, no sentido anti-horário', 
    'Lendo o número no centro do transferidor', 
    'Lendo o número mais próximo da linha de rota', 
    0, 
    'A leitura de proa é feita observando onde a linha de rota (que conecta a cidade A à cidade B) cruza a escala do transferidor. O número nesse ponto de cruzamento, lido no sentido horário a partir do Norte Verdadeiro, é a proa verdadeira que o piloto deve adotar para ir da cidade A até a cidade B.'),
    
    -- PERGUNTA 14
    (nav_category_id, 'Exemplo Prático - Rota Simples: Se a leitura de proa de uma cidade A para uma cidade B é 90 graus, qual será a proa para o caminho inverso (de B para A)?', 
    '90 graus', 
    '180 graus', 
    '270 graus', 
    '360 graus', 
    2, 
    'Quando você tem uma proa de 90° (Leste) de A para B, o caminho inverso será sempre 180° diferente. Portanto, de B para A, a proa será 270° (Oeste). Isso ocorre porque você está voltando na direção oposta. Se a diferença for menor que 180°, adicione 180°; se for maior, subtraia 180°.'),
    
    -- PERGUNTA 15
    (nav_category_id, 'Exemplo Prático - Rota Complexa: Em um planejamento de navegação, a leitura de proa de uma cidade A para uma cidade B é 230 graus. Qual é a interpretação dessa direção?', 
    'Sudeste', 
    'Sudoeste', 
    'Noroeste', 
    'Nordeste', 
    1, 
    'Uma proa de 230° situa-se entre 180° (Sul) e 270° (Oeste), portanto é Sudoeste. Especificamente, 230° está 50° além do Sul em direção ao Oeste. Esse é um exemplo de rota mais complexa que não coincide exatamente com as direções cardeais.'),
    
    -- PERGUNTA 16
    (nav_category_id, 'Conceito de Alerta Situacional: O que significa "voar na frente do avião" na filosofia de voo seguro?', 
    'Sentar na cabine de pilotagem frontal', 
    'Manter alerta situacional constante, sabendo posição, localização, observando instrumentos e parâmetros, e antecipando situações', 
    'Voar sempre em altitude máxima', 
    'Usar equipamentos de visão noturna', 
    1, 
    '"Voar na frente do avião" significa manter alerta situacional constante. O piloto deve conhecer sua posição e localização, observar continuamente os instrumentos aeronáuticos, monitorar parâmetros de motor, velocidade e condições meteorológicas. Isso permite que o piloto antecipe situações e tome decisões proativas, em vez de reagir a problemas após eles ocorrerem.'),
    
    -- PERGUNTA 17
    (nav_category_id, 'Prioridades em Voo: Qual é a ordem correta de prioridades durante um voo?', 
    'Comunicar, navegar, pilotar', 
    'Navegar, pilotar, comunicar', 
    'Pilotar, navegar, comunicar', 
    'Comunicar, pilotar, navegar', 
    2, 
    'A ordem de prioridades em voo é: 1) Pilotar (manter controle da aeronave), 2) Navegar (manter rota correta), 3) Comunicar (manter contato com ATC). Essa ordem reflete que o controle da aeronave é sempre a prioridade máxima, seguido pela manutenção da rota correta, e então pela comunicação com o controle de tráfego aéreo.'),
    
    -- PERGUNTA 18
    (nav_category_id, 'Filosofia de Piloto Seguro: Qual é a diferença fundamental entre um piloto coerente (seguro) e um piloto que voa de forma insegura?', 
    'O piloto coerente é mais experiente em horas de voo', 
    'O piloto coerente faz o avião agir, enquanto o piloto inseguro reage às ações que o avião impõe', 
    'O piloto coerente voa sempre em condições meteorológicas perfeitas', 
    'O piloto coerente usa equipamentos mais modernos', 
    1, 
    'Um piloto coerente e seguro é aquele que mantém o controle proativo da aeronave, fazendo o avião agir conforme suas intenções. Um piloto inseguro, por outro lado, reage às situações que o avião primeiro impõe, perdendo a iniciativa. A diferença não está na experiência ou nos equipamentos, mas na atitude e na filosofia de voo.'),
    
    -- PERGUNTA 19
    (nav_category_id, 'Relação entre Círculo e Quadrado: Qual é a relação matemática entre o círculo (360 graus) e o quadrado (4 lados) na navegação aérea?', 
    'Não há relação, são conceitos independentes', 
    'Cada lado do quadrado representa 90 graus, totalizando 360 graus, o mesmo que o círculo', 
    'O quadrado é uma simplificação do círculo para fins de navegação', 
    'O círculo é usado apenas para cálculos teóricos, enquanto o quadrado é usado na prática', 
    1, 
    'Cada lado do quadrado representa 90 graus (Norte-Leste-Sul-Oeste), e somando os 4 lados temos 360 graus, exatamente igual ao círculo completo. Esta relação matemática demonstra que as direções cardeais dividem o horizonte em quatro partes iguais de 90 graus cada.'),
    
    -- PERGUNTA 20
    (nav_category_id, 'Aplicação Prática de Coordenadas em Navegação: Como o sistema de coordenadas planas é aplicado na prática da navegação aérea?', 
    'Apenas para fins educacionais, sem aplicação real', 
    'Para determinar a proa (heading) que a aeronave deve seguir, usando cartas de navegação, transferidor e referência ao Norte Verdadeiro', 
    'Para calcular apenas a altitude de voo', 
    'Para comunicação com o controle de tráfego aéreo', 
    1, 
    'O sistema de coordenadas planas é aplicado praticamente através do uso de cartas de navegação (mapas), transferidor e a referência ao Norte Verdadeiro. O piloto localiza sua origem e destino, traça a rota, posiciona o transferidor e faz a leitura de proa. Esse processo permite determinar exatamente qual direção (em graus) a aeronave deve seguir para atingir o destino planejado.');
    
END $$;
