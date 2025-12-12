-- Script para adicionar 25 perguntas sobre Anexos da Convenção de Chicago
-- Execute este SQL no painel do Supabase (SQL Editor)

DO $BODY$
DECLARE
    reg_category_id UUID;
BEGIN
    -- Buscar o ID da categoria de Regulamentos de Tráfego Aéreo
    SELECT id INTO reg_category_id FROM categories WHERE name = 'Regulamentos de Tráfego Aéreo (RG)';
    
    -- Inserir as 25 perguntas sobre Anexos
    INSERT INTO questions (category_id, text, option1, option2, option3, option4, correct_answer, explanation) VALUES
    
    -- PERGUNTA 1
    (reg_category_id, 'Número Total de Anexos Atualmente: Quantos anexos a Convenção de Chicago possui atualmente?', 
    '16 anexos', 
    '17 anexos', 
    '18 anexos', 
    '19 anexos', 
    3, 
    'Atualmente existem 19 anexos à Convenção de Chicago. Embora apostilas antigas mencionem 18 anexos, o 19º anexo (Gerenciamento da Segurança Operacional) foi adicionado em agosto de 2013. Se a ANAC perguntar quantos anexos existem na atualidade, a resposta correta é 19.'),
    
    -- PERGUNTA 2
    (reg_category_id, 'Definição de Anexos da Convenção: O que são os anexos da Convenção de Chicago?', 
    'Documentos históricos sobre aviação antiga', 
    'Especificações de características físicas, configurações, performance e procedimentos baseados em normas internacionais e métodos recomendados', 
    'Regulamentações que variam de país para país', 
    'Sugestões opcionais para operações aéreas', 
    1, 
    'Os anexos da Convenção de Chicago são especificações detalhadas de características físicas, configurações, performance e procedimentos baseados em normas internacionais e métodos recomendados pela ICAO/OACI. Eles estabelecem padrões uniformes para a aviação civil internacional.'),
    
    -- PERGUNTA 3
    (reg_category_id, 'Obrigatoriedade das Normas: Qual é o status das normas especificadas nos anexos da ICAO/OACI?', 
    'São sugestões que podem ser ignoradas se o piloto desejar', 
    'São recomendações que cada país pode aceitar ou rejeitar livremente', 
    'São obrigatórias e seu cumprimento é compulsório para segurança e regularidade da navegação aérea internacional', 
    'São apenas para fins educacionais', 
    2, 
    'As normas especificadas nos anexos são obrigatórias. Seu cumprimento é compulsório (obrigatório), não é opcional. Isso é essencial para garantir a segurança e regularidade da navegação aérea internacional. A regulamentação de tráfego aéreo é obrigatória para segurança.'),
    
    -- PERGUNTA 4
    (reg_category_id, 'Anexo 1 - Licença Pessoal: O que trata o Anexo 1 da Convenção?', 
    'Regulamentação de aeroportos', 
    'Licenças pessoais de pilotos e pessoal aeronáutico', 
    'Regras de voo', 
    'Serviços meteorológicos', 
    1, 
    'O Anexo 1 trata das licenças pessoais de pilotos e todo o pessoal aeronáutico. Estabelece os requisitos, qualificações e certificações necessárias para diferentes funções na aviação civil.'),
    
    -- PERGUNTA 5
    (reg_category_id, 'Anexo 2 - Regras do Ar: Qual é o tema principal do Anexo 2?', 
    'Cartas aeronáuticas', 
    'Unidades de medida', 
    'Regras do ar e procedimentos que pilotos devem seguir', 
    'Matrículas de aeronaves', 
    2, 
    'O Anexo 2 estabelece as regras do ar e os procedimentos que todos os pilotos devem seguir durante o voo. Isso inclui regras de prioridade, separação de aeronaves, procedimentos de comunicação e muito mais.'),
    
    -- PERGUNTA 6
    (reg_category_id, 'Anexo 3 - Meteorologia: O Anexo 3 trata sobre qual tema?', 
    'Operações de aeronaves', 
    'Serviços meteorológicos para aviação civil internacional', 
    'Telecomunicações aeronáuticas', 
    'Busca e salvamento', 
    1, 
    'O Anexo 3 regulamenta os serviços meteorológicos para aviação civil internacional. Define como as informações meteorológicas devem ser coletadas, processadas e disseminadas para garantir a segurança dos voos.'),
    
    -- PERGUNTA 7
    (reg_category_id, 'Anexo 4 - Cartas Aeronáuticas: Qual é o propósito do Anexo 4?', 
    'Especificar unidades de medida', 
    'Regulamentar comunicações aéreas', 
    'Especificar as características e requisitos das cartas aeronáuticas', 
    'Definir procedimentos de segurança', 
    2, 
    'O Anexo 4 especifica as características e requisitos das cartas aeronáuticas. Estabelece padrões para mapas de navegação, garantindo que pilotos de diferentes países possam interpretar as mesmas informações de forma consistente.'),
    
    -- PERGUNTA 8
    (reg_category_id, 'Anexo 5 - Unidades de Medida: O Anexo 5 trata sobre qual assunto?', 
    'Operações de aeronaves', 
    'Unidades de medida adotadas internacionalmente, como velocidade em quilômetros ou milhas e altitude em pés', 
    'Investigação de acidentes', 
    'Marcas de nacionalidade', 
    1, 
    'O Anexo 5 estabelece as unidades de medida adotadas internacionalmente na aviação, como velocidade (nós, quilômetros ou milhas por hora), altitude (pés ou metros), distância, temperatura, pressão, entre outras. Isso garante uniformidade nas comunicações aeronáuticas.'),
    
    -- PERGUNTA 9
    (reg_category_id, 'Anexo 7 - Marcas de Nacionalidade e Matrículas: Como é possível identificar que uma aeronave é dos Estados Unidos através de sua matrícula?', 
    'Começa com PP', 
    'Começa com N', 
    'Começa com G', 
    'Começa com C', 
    1, 
    'Aeronaves dos Estados Unidos têm matrículas que começam com a letra "N" (exemplo: N-XXXXX). No Brasil, as matrículas começam com "PP" (exemplo: PP-XXX). Cada país tem seu próprio prefixo de matrícula que identifica sua nacionalidade. Esse sistema é regulamentado pelo Anexo 7.'),
    
    -- PERGUNTA 10
    (reg_category_id, 'Anexo 7 - Matrículas Brasileiras: Qual é o prefixo de matrícula de uma aeronave registrada no Brasil?', 
    'N', 
    'G', 
    'PP', 
    'C', 
    2, 
    'Aeronaves registradas no Brasil têm matrículas que começam com "PP" (exemplo: PP-ABC). Este prefixo identifica imediatamente a nacionalidade brasileira da aeronave, conforme estabelecido pelo Anexo 7 da Convenção de Chicago.'),
    
    -- PERGUNTA 11
    (reg_category_id, 'Anexo 8 - Aeronavegabilidade: O que significa aeronavegabilidade, conforme tratado no Anexo 8?', 
    'A capacidade de uma aeronave ser navegada em qualquer condição', 
    'A capacidade de uma aeronave estar segura e qualificada para voar', 
    'A velocidade máxima de uma aeronave', 
    'O tipo de combustível que uma aeronave usa', 
    1, 
    'Aeronavegabilidade significa que uma aeronave está segura e qualificada para voar. O Anexo 8 estabelece os padrões mínimos de projeto, construção, manutenção e operação que uma aeronave deve atender para ser considerada aeronavegável.'),
    
    -- PERGUNTA 12
    (reg_category_id, 'Anexo 10 - Telecomunicações Aeronáuticas: Qual é o propósito do Anexo 10?', 
    'Regulamentar operações de aeronaves', 
    'Especificar sistemas e procedimentos de comunicação aérea entre pilotos e controle de tráfego aéreo', 
    'Definir regras de voo', 
    'Regulamentar transporte de cargas', 
    1, 
    'O Anexo 10 especifica os sistemas e procedimentos de comunicação aérea entre pilotos e controle de tráfego aéreo. Estabelece padrões para equipamentos de rádio, frequências, protocolos de comunicação e fraseologia aeronáutica.'),
    
    -- PERGUNTA 13
    (reg_category_id, 'Anexo 11 - Serviço de Tráfego Aéreo: O que trata o Anexo 11?', 
    'Investigação de acidentes', 
    'Busca e salvamento', 
    'Serviços de tráfego aéreo prestados para organizar e gerenciar o tráfego aéreo em voo', 
    'Segurança contra interferência ilícita', 
    2, 
    'O Anexo 11 trata dos serviços de tráfego aéreo prestados para organizar e gerenciar o tráfego aéreo em voo. Define como os controladores de tráfego aéreo devem coordenar e separar aeronaves para garantir segurança e eficiência.'),
    
    -- PERGUNTA 14
    (reg_category_id, 'Anexo 12 - Busca e Salvamento: Qual é o tema do Anexo 12?', 
    'Investigação de acidentes', 
    'Procedimentos de busca e salvamento aeronáutico e como acioná-los em emergências', 
    'Transporte de materiais perigosos', 
    'Proteção ao meio ambiente', 
    1, 
    'O Anexo 12 estabelece os procedimentos de busca e salvamento aeronáutico (SAR - Search and Rescue) e como acioná-los em situações de emergência. Define responsabilidades, coordenação entre países e recursos necessários para operações de resgate.'),
    
    -- PERGUNTA 15
    (reg_category_id, 'Anexo 13 - Investigação de Acidentes Aeronáuticos: Qual é a natureza da investigação de acidentes aeronáuticos, conforme o Anexo 13?', 
    'Punitiva, para punir pilotos por erros', 
    'Preventiva, para entender o que aconteceu e evitar que erros semelhantes se repitam', 
    'Apenas para fins estatísticos', 
    'Para determinar culpa criminal', 
    1, 
    'A investigação de acidentes aeronáuticos não é punitiva. Sua natureza é preventiva. O objetivo é entender o que aconteceu em determinada situação para que não se cometam os mesmos erros no futuro. Essa abordagem busca melhorar a segurança de toda a aviação, não punir indivíduos.'),
    
    -- PERGUNTA 16
    (reg_category_id, 'Anexo 15 - Serviços de Informações Aeronáuticas: Como o instrutor descreveu a importância do Anexo 15?', 
    'Pouco importante', 
    'Importantíssimo', 
    'Apenas para fins administrativos', 
    'Não tem importância prática', 
    1, 
    'O Anexo 15 foi descrito como importantíssimo. Ele trata dos serviços de informações aeronáuticas (AIS), que fornecem dados essenciais para o planejamento e execução segura de voos, incluindo NOTAMs, AIPs e outras publicações aeronáuticas.'),
    
    -- PERGUNTA 17
    (reg_category_id, 'Anexo 17 - Segurança e Interferência Ilícita: O que é interferência ilícita, conforme tratado no Anexo 17?', 
    'Interferência de sinais de rádio', 
    'Atos criminosos como sequestro de aeronaves e invasão de cabine de comando', 
    'Problemas técnicos com equipamentos', 
    'Falhas de comunicação', 
    1, 
    'Interferência ilícita refere-se a atos criminosos contra aeronaves, como sequestro, invasão de cabine de comando e uso de aeronaves como armas. As regulamentações sobre isso tornaram-se muito mais rigorosas após o 11 de setembro de 2001, quando terroristas sequestraram aeronaves e as usaram para matar milhares de pessoas.'),
    
    -- PERGUNTA 18
    (reg_category_id, 'Anexo 17 - Contexto Histórico: Por que as regulamentações sobre segurança e interferência ilícita (Anexo 17) tornaram-se mais rigorosas?', 
    'Porque houve aumento de acidentes técnicos', 
    'Porque houve aumento de problemas meteorológicos', 
    'Porque após o 11 de setembro de 2001, foram adotadas medidas preventivas contra sequestros e atos terroristas', 
    'Porque o número de voos aumentou', 
    2, 
    'As regulamentações do Anexo 17 tornaram-se muito mais rigorosas após os ataques terroristas de 11 de setembro de 2001. Esse evento trágico levou à implementação de medidas preventivas muito mais severas contra sequestros e atos terroristas na aviação civil mundial.'),
    
    -- PERGUNTA 19
    (reg_category_id, 'Anexo 18 - Transporte de Materiais Perigosos: O que regula o Anexo 18?', 
    'Operações de aeronaves', 
    'Transporte seguro de materiais perigosos por via aérea', 
    'Investigação de acidentes', 
    'Serviços meteorológicos', 
    1, 
    'O Anexo 18 regulamenta o transporte seguro de materiais perigosos por via aérea. Isso inclui restrições a explosivos, substâncias tóxicas e outras cargas perigosas. É importante tanto em aviação comercial (bagagens de passageiros) quanto em aviação executiva e cargas diversas.'),
    
    -- PERGUNTA 20
    (reg_category_id, 'Anexo 18 - Exemplo Prático de Risco: Qual foi o exemplo de acidente causado por material perigoso mencionado na aula?', 
    'Explosivo que detonou durante o voo', 
    'Substância tóxica invisível que vazou da carga, causando sonolência em todos a bordo, levando à perda de consciência e queda da aeronave', 
    'Combustível que se incendiou', 
    'Equipamento que caiu na cabine', 
    1, 
    'O instrutor mencionou um acidente onde a carga transportada começou a vazar uma substância tóxica invisível durante o voo. Essa substância causou sonolência em todos a bordo, levando todos a perderem a consciência. A aeronave continuou voando por várias horas até esgotar o combustível e cair. Inicialmente, ninguém entendia a causa do acidente até que investigações identificaram o material perigoso como culpado. Esse exemplo ilustra a importância crítica do Anexo 18.'),
    
    -- PERGUNTA 21
    (reg_category_id, 'Anexo 19 - Gerenciamento da Segurança Operacional: Qual é o tema do Anexo 19?', 
    'Investigação de acidentes', 
    'Transporte de materiais perigosos', 
    'Gerenciamento da segurança operacional', 
    'Busca e salvamento', 
    2, 
    'O Anexo 19 trata do gerenciamento da segurança operacional (Safety Management System - SMS). Estabelece requisitos para que organizações de aviação implementem sistemas proativos de gestão de segurança.'),
    
    -- PERGUNTA 22
    (reg_category_id, 'Anexo 19 - Data de Criação: Quando foi criado o Anexo 19?', 
    '1944', 
    '1947', 
    'Agosto de 2013', 
    '2001', 
    2, 
    'O Anexo 19 (Gerenciamento da Segurança Operacional) foi criado em agosto de 2013. Por isso, não aparecia em apostilas mais antigas que mencionavam apenas 18 anexos. É importante estar atualizado sobre essa adição recente.'),
    
    -- PERGUNTA 23
    (reg_category_id, 'Diferença entre Normas e Métodos Recomendados: Qual é a diferença entre uma norma e um método recomendado nos anexos da ICAO?', 
    'Não há diferença, são a mesma coisa', 
    'Uma norma é obrigatória, enquanto um método recomendado é considerado conveniente por razões de segurança, mas pode ter menos obrigatoriedade', 
    'Uma norma é antiga, enquanto um método recomendado é moderno', 
    'Uma norma é para pilotos, enquanto um método recomendado é para mecânicos', 
    1, 
    'Uma norma é obrigatória e deve ser cumprida, enquanto um método recomendado é considerado conveniente e desejável por razões de segurança, mas pode ter um grau de obrigatoriedade menor. Ambos são importantes, mas as normas têm caráter mais compulsório.'),
    
    -- PERGUNTA 24
    (reg_category_id, 'Uniformidade das Aplicações: Por que as aplicações das normas dos anexos devem ser uniformes entre os países?', 
    'Para que todos os países tenham a mesma economia', 
    'Para que pilotos de diferentes países entendam e sigam os mesmos procedimentos, garantindo segurança e regularidade da navegação aérea internacional', 
    'Para que todos os aviões sejam iguais', 
    'Não há razão específica', 
    1, 
    'As aplicações das normas devem ser uniformes entre os países para que pilotos de diferentes nacionalidades entendam e sigam os mesmos procedimentos, garantindo segurança e regularidade da navegação aérea internacional. Essa uniformidade é essencial para a aviação global.'),
    
    -- PERGUNTA 25
    (reg_category_id, 'Importância de Conhecer Materiais Perigosos: Por que é importante que um piloto conheça as regulamentações sobre materiais perigosos (Anexo 18)?', 
    'Apenas para fins teóricos', 
    'Porque pode estar transportando passageiros, cargas ou materiais que podem ser perigosos, e precisa saber o que pode ou não transportar em voo', 
    'Porque é obrigatório memorizar todas as regulamentações', 
    'Porque a ANAC sempre pergunta sobre isso', 
    1, 
    'Conhecer as regulamentações sobre materiais perigosos é crítico porque um piloto pode estar transportando passageiros, cargas diversas, ou materiais específicos. Precisa saber quais materiais são proibidos (como explosivos), quais são regulamentados (como substâncias tóxicas) e como transportá-los com segurança. Isso vale tanto para aviação comercial quanto para aviação executiva.');
    
END $BODY$;
