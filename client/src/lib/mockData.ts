/**
 * Mock Data for PilotStudy
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Realistic pilot study questions for demonstration
 * - Data structure supports localStorage persistence
 * - Easy to replace with backend API calls
 */

import { Category, Question } from "@/types";

const createQuestion = (
  id: string,
  statement: string,
  answers: { text: string; isCorrect: boolean }[],
  explanation: string,
  wrongCount: number = 0
): Question => ({
  id,
  statement,
  answers: answers.map((a, idx) => ({
    id: `${id}-answer-${idx}`,
    text: a.text,
    isCorrect: a.isCorrect,
  })),
  explanation,
  wrongCount,
});

export const mockCategories: Category[] = [
  {
    id: "cat-1",
    name: "Regulamentações Aéreas",
    description: "Normas e regulamentações da aviação civil",
    createdAt: new Date().toISOString(),
    questions: [
      createQuestion(
        "q1-1",
        "Qual é a altitude máxima permitida para voo visual em zona de controle?",
        [
          { text: "3.000 pés", isCorrect: false },
          { text: "5.000 pés", isCorrect: false },
          { text: "Conforme autorização do controle de tráfego aéreo", isCorrect: true },
          { text: "10.000 pés", isCorrect: false },
        ],
        "A altitude máxima para voo visual em zona de controle é determinada pela autorização do controle de tráfego aéreo, variando conforme as condições e o espaço aéreo.",
        2
      ),
      createQuestion(
        "q1-2",
        "Qual documento é obrigatório para operar uma aeronave?",
        [
          { text: "Certificado de Aeronavegabilidade", isCorrect: true },
          { text: "Licença do piloto", isCorrect: false },
          { text: "Plano de voo", isCorrect: false },
          { text: "Autorização da ANAC", isCorrect: false },
        ],
        "O Certificado de Aeronavegabilidade é o documento que comprova que a aeronave está em condições seguras de voo e é obrigatório para operação.",
        1
      ),
      createQuestion(
        "q1-3",
        "Qual é a velocidade máxima permitida abaixo de 1.000 pés em zona de controle?",
        [
          { text: "200 nós", isCorrect: false },
          { text: "250 nós", isCorrect: true },
          { text: "300 nós", isCorrect: false },
          { text: "350 nós", isCorrect: false },
        ],
        "A velocidade máxima permitida abaixo de 1.000 pés em zona de controle é 250 nós, conforme regulamentação RBHA.",
        0
      ),
      createQuestion(
        "q1-4",
        "Qual é o período de validade de um certificado de piloto privado?",
        [
          { text: "2 anos", isCorrect: false },
          { text: "3 anos", isCorrect: false },
          { text: "5 anos", isCorrect: true },
          { text: "10 anos", isCorrect: false },
        ],
        "O certificado de piloto privado tem validade de 5 anos, após o qual deve ser renovado mediante avaliação periódica.",
        3
      ),
      createQuestion(
        "q1-5",
        "Qual é a distância mínima de visibilidade para voo VFR?",
        [
          { text: "1 km", isCorrect: false },
          { text: "3 km", isCorrect: true },
          { text: "5 km", isCorrect: false },
          { text: "10 km", isCorrect: false },
        ],
        "A distância mínima de visibilidade para voo VFR é 3 km, garantindo que o piloto possa ver e evitar obstáculos e outras aeronaves.",
        1
      ),
    ],
  },
  {
    id: "cat-2",
    name: "Meteorologia Aeronáutica",
    description: "Conceitos e fenômenos meteorológicos relevantes para voo",
    createdAt: new Date().toISOString(),
    questions: [
      createQuestion(
        "q2-1",
        "O que é um METAR?",
        [
          { text: "Previsão de tempo para 7 dias", isCorrect: false },
          { text: "Relatório de condições meteorológicas observadas em um aeroporto", isCorrect: true },
          { text: "Aviso de tempestade", isCorrect: false },
          { text: "Informação de vento em altitude", isCorrect: false },
        ],
        "METAR é um relatório de condições meteorológicas observadas em um aeroporto, fornecendo informações sobre temperatura, vento, visibilidade e outros parâmetros.",
        0
      ),
      createQuestion(
        "q2-2",
        "Qual é a temperatura de formação de gelo em uma nuvem?",
        [
          { text: "0°C", isCorrect: false },
          { text: "-5°C", isCorrect: false },
          { text: "-15°C", isCorrect: false },
          { text: "Varia entre 0°C e -40°C", isCorrect: true },
        ],
        "O gelo em nuvens pode se formar em uma faixa de temperatura entre 0°C e -40°C, dependendo de vários fatores como umidade e presença de núcleos de condensação.",
        2
      ),
      createQuestion(
        "q2-3",
        "O que é cisalhamento de vento (wind shear)?",
        [
          { text: "Mudança de direção do vento", isCorrect: false },
          { text: "Mudança de velocidade e/ou direção do vento em curta distância", isCorrect: true },
          { text: "Aumento gradual da velocidade do vento", isCorrect: false },
          { text: "Vento em altitude", isCorrect: false },
        ],
        "Cisalhamento de vento é uma mudança significativa de velocidade e/ou direção do vento em uma curta distância vertical ou horizontal, perigoso para aeronaves.",
        1
      ),
      createQuestion(
        "q2-4",
        "Qual é a causa principal da formação de nuvens cúmulo?",
        [
          { text: "Resfriamento frontal", isCorrect: false },
          { text: "Convecção térmica", isCorrect: true },
          { text: "Orografia", isCorrect: false },
          { text: "Convergência de ar", isCorrect: false },
        ],
        "Nuvens cúmulo são formadas principalmente por convecção térmica, quando ar quente sobe e se expande, resfriando até o ponto de condensação.",
        0
      ),
      createQuestion(
        "q2-5",
        "O que indica um TAF?",
        [
          { text: "Temperatura do ar em altitude", isCorrect: false },
          { text: "Previsão de tempo para as próximas 24 a 30 horas", isCorrect: true },
          { text: "Tipo de aeronave em voo", isCorrect: false },
          { text: "Teste de aeronavegabilidade", isCorrect: false },
        ],
        "TAF (Terminal Aerodrome Forecast) é uma previsão de condições meteorológicas para as próximas 24 a 30 horas em um aeroporto específico.",
        0
      ),
    ],
  },
  {
    id: "cat-3",
    name: "Navegação Aérea",
    description: "Técnicas e instrumentos de navegação",
    createdAt: new Date().toISOString(),
    questions: [
      createQuestion(
        "q3-1",
        "O que é declinação magnética?",
        [
          { text: "Erro do compasso magnético", isCorrect: false },
          { text: "Ângulo entre o norte verdadeiro e o norte magnético", isCorrect: true },
          { text: "Desvio da aeronave em relação ao rumo", isCorrect: false },
          { text: "Variação de altitude", isCorrect: false },
        ],
        "Declinação magnética é o ângulo entre o norte verdadeiro (geográfico) e o norte magnético, variando conforme a localização geográfica.",
        1
      ),
      createQuestion(
        "q3-2",
        "Como se calcula a velocidade solo de uma aeronave?",
        [
          { text: "Velocidade aerodinâmica + componente do vento", isCorrect: true },
          { text: "Velocidade aerodinâmica - componente do vento", isCorrect: false },
          { text: "Apenas a velocidade aerodinâmica", isCorrect: false },
          { text: "Velocidade aerodinâmica × altitude", isCorrect: false },
        ],
        "A velocidade solo é calculada adicionando a componente do vento à velocidade aerodinâmica. Se o vento é de cauda, soma-se; se é de proa, subtrai-se.",
        0
      ),
      createQuestion(
        "q3-3",
        "Qual é a função de um VOR (VHF Omnidirectional Range)?",
        [
          { text: "Medir altitude", isCorrect: false },
          { text: "Fornecer radiais para navegação", isCorrect: true },
          { text: "Comunicação de voz", isCorrect: false },
          { text: "Detectar tempestades", isCorrect: false },
        ],
        "VOR é um auxílio de navegação que fornece radiais (linhas de posição) permitindo ao piloto navegar com precisão em relação à estação.",
        0
      ),
      createQuestion(
        "q3-4",
        "O que é proa magnética?",
        [
          { text: "Direção em relação ao norte verdadeiro", isCorrect: false },
          { text: "Direção em relação ao norte magnético", isCorrect: true },
          { text: "Direção em relação ao vento", isCorrect: false },
          { text: "Direção em relação ao solo", isCorrect: false },
        ],
        "Proa magnética é a direção em que a aeronave está apontada em relação ao norte magnético, medida no compasso magnético.",
        0
      ),
      createQuestion(
        "q3-5",
        "Qual é a distância máxima de recepção de um NDB (Non-Directional Beacon)?",
        [
          { text: "25 nm", isCorrect: false },
          { text: "50 nm", isCorrect: false },
          { text: "100 nm", isCorrect: true },
          { text: "200 nm", isCorrect: false },
        ],
        "Um NDB pode ser recebido até aproximadamente 100 nm durante o dia e até 200 nm à noite, dependendo da potência do transmissor.",
        2
      ),
    ],
  },
  {
    id: "cat-4",
    name: "Performance e Planejamento",
    description: "Cálculos de performance e planejamento de voo",
    createdAt: new Date().toISOString(),
    questions: [
      createQuestion(
        "q4-1",
        "O que é densidade do ar?",
        [
          { text: "Peso do ar por unidade de volume", isCorrect: true },
          { text: "Umidade relativa do ar", isCorrect: false },
          { text: "Pressão atmosférica", isCorrect: false },
          { text: "Temperatura do ar", isCorrect: false },
        ],
        "Densidade do ar é o peso do ar por unidade de volume, afetando a sustentação e o arrasto da aeronave.",
        0
      ),
      createQuestion(
        "q4-2",
        "Como a altitude afeta a performance de uma aeronave?",
        [
          { text: "Aumenta a performance", isCorrect: false },
          { text: "Diminui a performance devido à menor densidade do ar", isCorrect: true },
          { text: "Não afeta a performance", isCorrect: false },
          { text: "Afeta apenas o consumo de combustível", isCorrect: false },
        ],
        "A altitude diminui a performance porque a densidade do ar é menor, reduzindo a sustentação e aumentando a distância necessária para decolagem e pouso.",
        1
      ),
      createQuestion(
        "q4-3",
        "O que é autonomia de voo?",
        [
          { text: "Tempo máximo que a aeronave pode voar", isCorrect: false },
          { text: "Distância máxima que a aeronave pode voar com combustível disponível", isCorrect: true },
          { text: "Velocidade máxima da aeronave", isCorrect: false },
          { text: "Altitude máxima da aeronave", isCorrect: false },
        ],
        "Autonomia de voo é a distância máxima que uma aeronave pode voar com o combustível disponível, considerando consumo e condições de voo.",
        0
      ),
      createQuestion(
        "q4-4",
        "Qual é o fator de carga máximo permitido para uma aeronave civil?",
        [
          { text: "2.5 G", isCorrect: false },
          { text: "3.8 G", isCorrect: true },
          { text: "5.0 G", isCorrect: false },
          { text: "6.0 G", isCorrect: false },
        ],
        "O fator de carga máximo para aeronaves civis é tipicamente 3.8 G, estabelecido pelos padrões de certificação.",
        1
      ),
      createQuestion(
        "q4-5",
        "O que é teto de serviço de uma aeronave?",
        [
          { text: "Altitude máxima teórica", isCorrect: false },
          { text: "Altitude máxima em que a aeronave pode manter razão de subida de 100 pés/min", isCorrect: true },
          { text: "Altitude de cruzeiro recomendada", isCorrect: false },
          { text: "Altitude de segurança", isCorrect: false },
        ],
        "Teto de serviço é a altitude máxima em que a aeronave pode manter uma razão de subida de 100 pés por minuto.",
        0
      ),
    ],
  },
  {
    id: "cat-5",
    name: "Procedimentos de Emergência",
    description: "Procedimentos e técnicas para situações de emergência",
    createdAt: new Date().toISOString(),
    questions: [
      createQuestion(
        "q5-1",
        "Qual é o primeiro passo em caso de falha de motor em voo?",
        [
          { text: "Descer imediatamente", isCorrect: false },
          { text: "Manter altitude e velocidade, procurar local seguro para pouso", isCorrect: true },
          { text: "Aumentar velocidade", isCorrect: false },
          { text: "Chamar emergência", isCorrect: false },
        ],
        "Em caso de falha de motor, o piloto deve manter altitude e velocidade enquanto procura um local seguro para pouso, comunicando a emergência quando apropriado.",
        0
      ),
      createQuestion(
        "q5-2",
        "O que fazer se a aeronave entrar em estol?",
        [
          { text: "Puxar o manche para trás", isCorrect: false },
          { text: "Empurrar o manche para frente e recuperar velocidade", isCorrect: true },
          { text: "Aumentar potência", isCorrect: false },
          { text: "Fazer uma curva cerrada", isCorrect: false },
        ],
        "Para recuperar de um estol, o piloto deve empurrar o manche para frente para reduzir o ângulo de ataque e recuperar a velocidade aerodinâmica.",
        0
      ),
      createQuestion(
        "q5-3",
        "Qual é o procedimento para pouso de emergência em água?",
        [
          { text: "Máxima velocidade para minimizar tempo", isCorrect: false },
          { text: "Velocidade mínima controlada, flaps parciais, pouso suave", isCorrect: true },
          { text: "Flaps totais", isCorrect: false },
          { text: "Trem de pouso abaixado", isCorrect: false },
        ],
        "Para pouso em água, deve-se usar velocidade mínima controlada, flaps parciais para manter sustentação e fazer um pouso suave e controlado.",
        0
      ),
      createQuestion(
        "q5-4",
        "O que fazer em caso de fogo na cabine?",
        [
          { text: "Continuar o voo normalmente", isCorrect: false },
          { text: "Descer imediatamente, desligar equipamentos, usar extintor se disponível", isCorrect: true },
          { text: "Aumentar altitude", isCorrect: false },
          { text: "Abrir todas as janelas", isCorrect: false },
        ],
        "Em caso de fogo na cabine, deve-se descer imediatamente, desligar equipamentos não essenciais, usar extintor se disponível e preparar para pouso de emergência.",
        1
      ),
      createQuestion(
        "q5-5",
        "Qual é o procedimento de recuperação de parafuso?",
        [
          { text: "Aumentar velocidade", isCorrect: false },
          { text: "Reduzir potência, aplicar leme oposto ao sentido de rotação, puxar manche", isCorrect: false },
          { text: "Reduzir potência, aplicar leme oposto, empurrar manche", isCorrect: true },
          { text: "Fazer uma curva cerrada", isCorrect: false },
        ],
        "Para recuperar de um parafuso, reduz-se a potência, aplica-se leme oposto ao sentido de rotação e empurra-se o manche para recuperar a atitude normal.",
        0
      ),
    ],
  },
];
