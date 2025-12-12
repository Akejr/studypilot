-- Script para adicionar 20 perguntas de Regulamentos de Tráfego Aéreo
-- Execute este SQL no painel do Supabase (SQL Editor)

DO $BODY$
DECLARE
    reg_category_id UUID;
BEGIN
    -- Buscar o ID da categoria de Regulamentos de Tráfego Aéreo
    SELECT id INTO reg_category_id FROM categories WHERE name = 'Regulamentos de Tráfego Aéreo (RG)';
    
    -- Inserir as 20 perguntas
    INSERT INTO questions (category_id, text, option1, option2, option3, option4, correct_answer, explanation) VALUES
    
    -- PERGUNTA 1
    (reg_category_id, 'Origem dos Regulamentos de Tráfego Aéreo: Qual foi o contexto histórico que levou à criação dos primeiros regulamentos de tráfego aéreo?', 
    'A Segunda Guerra Mundial e a necessidade de controlar aviões de combate', 
    'A Primeira Guerra Mundial, seguida pela Conferência de Paz em 1919', 
    'A criação do primeiro avião por Wright Brothers', 
    'A necessidade de regular o transporte de cargas internacionais', 
    1, 
    'Os primeiros regulamentos de tráfego aéreo surgiram logo após a Primeira Guerra Mundial, na chamada Conferência de Paz de 1919. Esse foi o ponto de partida para a regulamentação da aviação. Posteriormente, após a Segunda Guerra Mundial, quando houve grande desenvolvimento tecnológico e aumento do volume de tráfego aéreo, foi criada a Convenção de Chicago em 1944.'),
    
    -- PERGUNTA 2
    (reg_category_id, 'Conferência de Paz - Ano e Significado: Em que ano ocorreu a primeira regulamentação de tráfego aéreo, na chamada Conferência de Paz?', 
    '1919', 
    '1939', 
    '1944', 
    '1947', 
    0, 
    'A Conferência de Paz ocorreu em 1919, logo após a Primeira Guerra Mundial. Este foi o marco inicial da regulamentação internacional da aviação, estabelecendo os primeiros princípios para o tráfego aéreo entre nações.'),
    
    -- PERGUNTA 3
    (reg_category_id, 'Convenção de Chicago - Data e Local: Qual foi a data e o local da Convenção de Navegação Aérea Internacional (CACI)?', 
    '1919 em Paris, França', 
    '1939 em Berlim, Alemanha', 
    '7 de dezembro de 1944 em Chicago, Estados Unidos', 
    'Outubro de 1947 em Montreal, Canadá', 
    2, 
    'A Convenção de Navegação Aérea Internacional (CACI), também conhecida como Convenção de Chicago, foi realizada em 7 de dezembro de 1944 em Chicago, Estados Unidos. Esta convenção estabeleceu as bases da aviação civil internacional moderna.'),
    
    -- PERGUNTA 4
    (reg_category_id, 'Participantes da Convenção de Chicago: Quantas nações participaram da Convenção de Chicago em 1944, e o Brasil estava entre elas?', 
    '25 nações, e o Brasil não participou', 
    '52 nações, incluindo o Brasil', 
    '100 nações, incluindo o Brasil', 
    '52 nações, mas o Brasil não participou', 
    1, 
    'A Convenção de Chicago, realizada em 7 de dezembro de 1944, contou com a participação de 52 nações, entre elas o Brasil. Essa participação foi significativa, pois estabeleceu o Brasil como país signatário das normas internacionais de aviação civil desde o início.'),
    
    -- PERGUNTA 5
    (reg_category_id, 'Significado de ICAO e OACI: Qual é a diferença entre ICAO e OACI?', 
    'ICAO é a organização americana, enquanto OACI é a europeia', 
    'Ambas referem-se à mesma organização, apenas em idiomas diferentes (inglês e português)', 
    'ICAO é mais antiga que OACI', 
    'Não há relação entre elas, são organizações completamente diferentes', 
    1, 
    'ICAO (International Civil Aviation Organization, em inglês) e OACI (Organização de Aviação Civil Internacional, em português) referem-se exatamente à mesma organização. A diferença é apenas no idioma em que o nome é expresso. Ambas as siglas são usadas indistintamente para se referir à mesma entidade.'),
    
    -- PERGUNTA 6
    (reg_category_id, 'Criação e Sede da ICAO/OACI: Quando e onde foi criada a ICAO/OACI, e qual é a sua sede?', 
    'Em 1944 em Chicago, com sede em Washington', 
    'Em outubro de 1947 no Canadá, com sede em Montreal', 
    'Em 1919 em Paris, com sede em Genebra', 
    'Em 1939 em Berlim, com sede em Bruxelas', 
    1, 
    'A ICAO/OACI foi criada em outubro de 1947 no Canadá e tem sua sede em Montreal. É importante notar que embora a Convenção de Chicago tenha ocorrido em 1944, a organização em si foi formalizada apenas em 1947, três anos depois.'),
    
    -- PERGUNTA 7
    (reg_category_id, 'Status da ICAO/OACI: Qual é o status da ICAO/OACI dentro da estrutura das Nações Unidas?', 
    'É uma organização independente, sem relação com a ONU', 
    'É uma agência técnica da ONU (Organização das Nações Unidas)', 
    'É subordinada ao governo dos Estados Unidos', 
    'É uma organização privada de pilotos', 
    1, 
    'A ICAO/OACI é uma agência técnica especializada da Organização das Nações Unidas (ONU). Isso significa que ela opera sob os princípios da ONU, mas com autonomia técnica para estabelecer padrões e práticas recomendadas para a aviação civil internacional.'),
    
    -- PERGUNTA 8
    (reg_category_id, 'Objetivos Principais da ICAO/OACI: Qual NÃO é um dos objetivos principais da ICAO/OACI?', 
    'Desenvolver a aviação civil internacional de forma segura e ordenada', 
    'Promover a segurança do voo estabelecendo padrões internacionais', 
    'Encorajar o desenvolvimento de aeroportos e aerovias', 
    'Estabelecer tarifas de passagens aéreas internacionais', 
    3, 
    'Os objetivos principais da ICAO/OACI incluem desenvolver aviação civil de forma segura, promover segurança do voo, estabelecer padrões internacionais, encorajar desenvolvimento de aeroportos e aerovias, e promover auxílios à navegação aérea. Estabelecer tarifas de passagens não é um objetivo da organização.'),
    
    -- PERGUNTA 9
    (reg_category_id, 'Motivação para Criação da Convenção de Chicago: Qual foi a principal necessidade que levou à criação da Convenção de Chicago em 1944?', 
    'Controlar aviões militares durante a Segunda Guerra Mundial', 
    'O desenvolvimento da aviação civil internacional, o crescimento do tráfego aéreo e a necessidade de estabelecer regras uniformes internacionais', 
    'Criar uma organização para vender aviões', 
    'Estabelecer rotas de transporte de cargas militares', 
    1, 
    'A Segunda Guerra Mundial trouxe grande desenvolvimento tecnológico da aviação e, após seu término, houve um crescimento exponencial do volume de tráfego aéreo civil. Isso criou a necessidade de estabelecer normas e regras para regulamentar a aviação civil internacional, garantindo segurança, uniformidade e padronização entre os países.'),
    
    -- PERGUNTA 10
    (reg_category_id, 'Participação do Brasil na ICAO/OACI: Qual é a situação do Brasil em relação à ICAO/OACI?', 
    'O Brasil não é membro da ICAO/OACI', 
    'O Brasil é um país signatário que segue os preceitos da ICAO/OACI e procura ajustar suas normas e métodos recomendados', 
    'O Brasil é membro, mas não segue as normas da organização', 
    'O Brasil é membro, mas apenas para fins administrativos', 
    1, 
    'O Brasil é um país signatário da ICAO/OACI desde a Convenção de Chicago em 1944. Como membro, o Brasil segue os preceitos da organização e procura ajustar suas normas e métodos recomendados às práticas internacionais, garantindo compatibilidade com a aviação civil mundial.'),
    
    -- PERGUNTA 11
    (reg_category_id, 'Processo de Adoção de Padrões Internacionais: Como funciona o processo de adoção de padrões e práticas recomendadas pela ICAO/OACI?', 
    'Todos os países são obrigados a aceitar todas as práticas recomendadas sem exceção', 
    'Os países são consultados e têm autonomia para aceitar ou rejeitar as práticas recomendadas', 
    'Apenas os países europeus podem aceitar ou rejeitar práticas', 
    'A ICAO/OACI impõe as práticas sem consultar os países', 
    1, 
    'Os países que fazem parte da ICAO/OACI são consultados sobre a adoção de padrões e práticas recomendadas. Cada país tem autonomia para aceitar ou rejeitar essas práticas. No entanto, aqueles que não aceitam uma prática recomendada são obrigados a apresentar as razões através de um documento chamado "Diferenças".'),
    
    -- PERGUNTA 12
    (reg_category_id, 'Documento de Diferenças: O que é o documento chamado "Diferenças" na legislação internacional de aviação?', 
    'Um documento que lista as diferenças entre aviões de diferentes países', 
    'Um documento obrigatório que apresenta as razões pelas quais um país não aceita uma prática recomendada pela ICAO/OACI', 
    'Um documento que lista as diferenças de moedas entre países', 
    'Um documento que descreve as diferenças geográficas entre países', 
    1, 
    'O documento "Diferenças" é obrigatório para países que não aceitam determinadas práticas recomendadas pela ICAO/OACI. Através desse documento, o país apresenta as razões técnicas, legais ou operacionais pelas quais não adota uma prática específica. É uma forma de manter transparência e comunicação dentro da comunidade aeronáutica internacional.'),
    
    -- PERGUNTA 13
    (reg_category_id, 'Publicação de Diferenças no Brasil: Onde são publicadas as "Diferenças" do Brasil em relação às práticas recomendadas pela ICAO/OACI?', 
    'No Diário Oficial da União', 
    'Na AIP Brasil, no item 1.7 da Generalidade (GEM número 1)', 
    'No site da ANAC', 
    'Em um boletim especial do governo', 
    1, 
    'As Diferenças do Brasil são publicadas na AIP Brasil (Aeronautical Information Publication - Brasil), especificamente no item 1.7 da seção de Generalidades (GEM número 1), sob o título "Legislação Internacional". Essa é a publicação oficial onde todos os pilotos e operadores aéreos podem consultar quais práticas recomendadas o Brasil não adota e as razões para isso.'),
    
    -- PERGUNTA 14
    (reg_category_id, 'Importância da Regulamentação para Segurança: Por que a aviação é tão regulamentada e qual é a importância dessa regulamentação?', 
    'Porque a aviação é um negócio lucrativo', 
    'Porque a regulamentação mantém todos seguros; não seguir regras coloca em risco a própria vida e a de outros pilotos e passageiros', 
    'Porque o governo quer controlar os pilotos', 
    'Porque a aviação é mais fácil que dirigir carros', 
    1, 
    'A aviação é altamente regulamentada porque a segurança é absolutamente crítica. Ao contrário de dirigir um carro ou moto, onde há mais flexibilidade nas regras, a aviação não permite desvios das regulamentações. Não seguir as regras de aviação coloca em risco a vida do piloto, dos passageiros e de outras pessoas. Por isso, a regulamentação é tão rigorosa e deve ser sempre seguida.'),
    
    -- PERGUNTA 15
    (reg_category_id, 'Padronização Internacional na Aviação: Por que é necessário que a aviação internacional seja padronizada?', 
    'Para que os aviões sejam mais bonitos', 
    'Para que todos os países pensem e ajam da mesma forma, independentemente de onde estejam voando, facilitando voos internacionais e garantindo segurança', 
    'Para que os pilotos não precisem estudar muito', 
    'Não há necessidade real de padronização', 
    1, 
    'A padronização internacional é essencial na aviação porque permite que pilotos, controladores de tráfego aéreo e operadores de diferentes países entendam e sigam os mesmos procedimentos. Isso é crítico especialmente para voos internacionais, onde aeronaves de um país voam em espaço aéreo de outro. Se não houvesse padronização, haveria confusão, conflitos e risco de acidentes.'),
    
    -- PERGUNTA 16
    (reg_category_id, 'Interconexão entre Disciplinas na Aviação: Como os regulamentos de tráfego aéreo se relacionam com outras disciplinas da aviação?', 
    'Não há relação, cada disciplina é completamente independente', 
    'Os regulamentos de tráfego aéreo conectam com meteorologia e outras matérias, uma complementando a outra', 
    'Os regulamentos só se relacionam com mecânica de voo', 
    'Essa é uma questão sem importância', 
    1, 
    'Os regulamentos de tráfego aéreo não existem isoladamente. Eles se conectam com meteorologia, navegação, comunicações e outras disciplinas da aviação. Uma matéria complementa a outra, criando um sistema integrado de conhecimento que o piloto deve dominar. Por exemplo, regulamentos sobre voo em condições de baixa visibilidade conectam com conhecimentos de meteorologia.'),
    
    -- PERGUNTA 17
    (reg_category_id, 'Contexto da Segunda Guerra Mundial: Como a Segunda Guerra Mundial influenciou o desenvolvimento da aviação e a necessidade de regulamentação?', 
    'A Segunda Guerra Mundial não teve influência na aviação', 
    'A Segunda Guerra Mundial trouxe grande desenvolvimento tecnológico da aviação, e após seu término, houve crescimento exponencial do tráfego aéreo civil, criando necessidade de regulamentação', 
    'A Segunda Guerra Mundial destruiu toda a aviação', 
    'A aviação só se desenvolveu após a Segunda Guerra Mundial', 
    1, 
    'Embora a aviação tenha sido usada para fins militares durante a Segunda Guerra Mundial, o conflito resultou em grande desenvolvimento tecnológico. Após o término da guerra, muitos aviões foram convertidos para uso civil, e o volume de tráfego aéreo cresceu exponencialmente. Isso criou a necessidade urgente de estabelecer regulamentações internacionais para gerenciar esse crescimento de forma segura e ordenada.'),
    
    -- PERGUNTA 18
    (reg_category_id, 'Objetivos de Segurança e Ordem: Qual é o objetivo central da ICAO/OACI ao desenvolver a aviação civil internacional?', 
    'Maximizar lucros das companhias aéreas', 
    'Desenvolver a aviação civil de forma segura e ordenada, promovendo a segurança do voo', 
    'Reduzir o número de aeroportos', 
    'Limitar o crescimento da aviação', 
    1, 
    'O objetivo central da ICAO/OACI é desenvolver a aviação civil internacional de forma segura e ordenada, promovendo a segurança do voo através do estabelecimento de padrões internacionais. A segurança é sempre a prioridade máxima em todas as atividades e regulamentações da organização.'),
    
    -- PERGUNTA 19
    (reg_category_id, 'Evitar Competição Predatória: O que significa "evitar competição predatória e discriminação entre os estados" como objetivo da ICAO/OACI?', 
    'Impedir que países comprem aviões uns dos outros', 
    'Garantir que os países (estados) compitam de forma justa e sem discriminação, promovendo igualdade nas oportunidades de aviação civil', 
    'Proibir completamente a competição entre países', 
    'Favorecer os países ricos em detrimento dos pobres', 
    1, 
    '"Estados" neste contexto refere-se aos países. O objetivo de evitar competição predatória e discriminação significa garantir que todos os países tenham oportunidades justas e iguais no desenvolvimento da aviação civil, sem que um país possa prejudicar injustamente outro através de práticas discriminatórias ou competição desleal.'),
    
    -- PERGUNTA 20
    (reg_category_id, 'Filosofia de Seguir Regulamentações: Qual é a mensagem principal sobre seguir regulamentações na aviação?', 
    'As regulamentações são sugestões que podem ser ignoradas', 
    'As regulamentações devem ser sempre seguidas, independentemente de onde ou quando se esteja voando, porque mantêm o piloto, passageiros e outras pessoas seguras', 
    'As regulamentações só importam em voos internacionais', 
    'As regulamentações são iguais às regras de trânsito de carros', 
    1, 
    'A mensagem central é que as regulamentações de aviação devem ser sempre seguidas, independentemente de circunstâncias. Diferente de dirigir um carro, onde há mais flexibilidade, a aviação não permite desvios das regras. Seguir as regulamentações é o que mantém todos seguros: o piloto, os passageiros e outras pessoas. Não seguir regulamentações coloca vidas em risco.');
    
END $BODY$;
