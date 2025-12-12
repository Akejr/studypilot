-- Execute este SQL no painel do Supabase (SQL Editor)

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Questions table
CREATE TABLE IF NOT EXISTS questions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  option1 TEXT NOT NULL,
  option2 TEXT NOT NULL,
  option3 TEXT NOT NULL,
  option4 TEXT NOT NULL,
  correct_answer INTEGER NOT NULL CHECK (correct_answer >= 0 AND correct_answer <= 3),
  explanation TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Study sessions table
CREATE TABLE IF NOT EXISTS study_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  type TEXT NOT NULL CHECK (type IN ('study', 'review')),
  started_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  completed_at TIMESTAMP WITH TIME ZONE
);

-- Session questions table
CREATE TABLE IF NOT EXISTS session_questions (
  session_id UUID NOT NULL REFERENCES study_sessions(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  question_order INTEGER NOT NULL,
  PRIMARY KEY (session_id, question_id)
);

-- Answers table
CREATE TABLE IF NOT EXISTS answers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id UUID NOT NULL REFERENCES study_sessions(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  selected_answer INTEGER NOT NULL CHECK (selected_answer >= 0 AND selected_answer <= 3),
  is_correct BOOLEAN NOT NULL,
  answered_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert Navigation category
INSERT INTO categories (name, description) VALUES 
('Navegação (NAV)', 'Questões sobre navegação aérea, instrumentos de navegação, cartas aeronáuticas, procedimentos de aproximação e sistemas de posicionamento')
ON CONFLICT (name) DO NOTHING;

-- Insert navigation questions
DO $$
DECLARE
    nav_category_id UUID;
BEGIN
    SELECT id INTO nav_category_id FROM categories WHERE name = 'Navegação (NAV)';
    
    INSERT INTO questions (category_id, text, option1, option2, option3, option4, correct_answer, explanation) VALUES
    (nav_category_id, 'Diferenciação entre Navegação Visual e Navegação Estimada:', 'Navegação visual usa apenas instrumentos, navegação estimada usa referências visuais', 'Navegação visual usa referências visuais externas, navegação estimada usa cálculos baseados em velocidade, tempo e direção', 'Ambas são idênticas', 'Navegação estimada é mais precisa que a visual', 1, 'A navegação visual baseia-se em referências visuais externas (marcos, acidentes geográficos), enquanto a navegação estimada utiliza cálculos matemáticos baseados em velocidade, tempo, direção e deriva para determinar a posição.'),
    
    (nav_category_id, 'Efeito do vento na navegação:', 'O vento não afeta a navegação', 'O vento apenas afeta a velocidade', 'O vento causa deriva, alterando a trajetória da aeronave', 'O vento só afeta aeronaves pequenas', 2, 'O vento causa deriva (drift), que é o desvio lateral da aeronave em relação à sua trajetória planejada. É necessário aplicar correção de deriva para manter o rumo desejado.'),
    
    (nav_category_id, 'Número mínimo de satélites GPS necessários para determinar posição:', '2 satélites', '3 satélites', '4 satélites', '5 satélites', 2, 'São necessários no mínimo 4 satélites GPS para determinar posição tridimensional (latitude, longitude e altitude) com precisão. Com 3 satélites é possível determinar apenas posição bidimensional.'),
    
    (nav_category_id, 'Radionavegação - Definição de NDB:', 'Non-Directional Beacon - transmite sinal omnidirecional', 'Navigation Database - banco de dados de navegação', 'New Direction Beacon - transmite sinal direcional', 'North Direction Beacon - aponta sempre para o norte', 0, 'NDB (Non-Directional Beacon) é um radiofarol que transmite sinal omnidirecional em todas as direções, permitindo que aeronaves determinem sua direção relativa à estação.'),
    
    (nav_category_id, 'Navegação celestial - Princípio básico:', 'Usa apenas a Estrela Polar', 'Baseia-se na posição de corpos celestes para determinar posição', 'Funciona apenas durante o dia', 'É o mesmo que navegação por GPS', 1, 'A navegação celestial utiliza a posição observada de corpos celestes (sol, lua, estrelas, planetas) em relação ao horizonte para determinar a posição geográfica da aeronave.'),
    
    (nav_category_id, 'Carta aeronáutica - Escala mais comum para navegação VFR:', '1:1.000.000', '1:500.000', '1:250.000', '1:100.000', 1, 'A escala 1:500.000 é a mais comumente utilizada para cartas de navegação VFR, oferecendo bom equilíbrio entre detalhamento e área de cobertura.'),
    
    (nav_category_id, 'Sistema de coordenadas - Definição de latitude:', 'Distância angular do Equador', 'Distância angular do Meridiano de Greenwich', 'Distância em quilômetros do Polo Norte', 'Distância em milhas náuticas do Equador', 0, 'Latitude é a distância angular medida em graus a partir do Equador (0°) até os polos (90° Norte ou Sul), determinando a posição norte-sul de um ponto.'),
    
    (nav_category_id, 'Declinação magnética:', 'É sempre zero', 'É a diferença entre o norte magnético e o norte geográfico', 'É a diferença entre o norte magnético e o norte da bússola', 'Não varia com a localização', 1, 'Declinação magnética é o ângulo entre o norte magnético (direção da agulha da bússola) e o norte geográfico (verdadeiro), variando conforme a localização geográfica.'),
    
    (nav_category_id, 'Procedimento de aproximação ILS - Significado:', 'Instrument Landing System', 'International Landing Standard', 'Integrated Location System', 'Internal Landing Signal', 0, 'ILS (Instrument Landing System) é um sistema de aproximação de precisão que fornece orientação lateral e vertical para pouso em condições de baixa visibilidade.'),
    
    (nav_category_id, 'Navegação por estima - Fatores considerados:', 'Apenas velocidade e tempo', 'Apenas direção e tempo', 'Velocidade, tempo, direção e deriva', 'Apenas posição inicial e final', 2, 'A navegação por estima considera velocidade da aeronave, tempo de voo, direção (rumo) e deriva causada pelo vento para calcular a posição estimada.'),
    
    (nav_category_id, 'VOR - Significado e função:', 'Very High Frequency Omnidirectional Range - radiofarol omnidirecional', 'Visual Observation Range - alcance de observação visual', 'Variable Output Radio - rádio de saída variável', 'Vertical Orientation Reference - referência de orientação vertical', 0, 'VOR (Very High Frequency Omnidirectional Range) é um sistema de radionavegação que transmite sinais em todas as direções, permitindo determinar radiais e posição relativa à estação.'),
    
    (nav_category_id, 'Triângulo de velocidades na navegação:', 'Relaciona apenas velocidade e tempo', 'Relaciona velocidade verdadeira, velocidade no solo e velocidade do vento', 'É usado apenas para cálculos de combustível', 'Não é relevante para navegação aérea', 1, 'O triângulo de velocidades relaciona a velocidade verdadeira da aeronave (TAS), velocidade do vento e velocidade resultante no solo (GS), sendo fundamental para navegação precisa.'),
    
    (nav_category_id, 'Checkpoint na navegação VFR:', 'Ponto de controle de tráfego aéreo', 'Referência visual ou eletrônica usada para confirmar posição', 'Local obrigatório de pouso', 'Estação de combustível', 1, 'Checkpoint é uma referência visual distintiva ou eletrônica usada para confirmar a posição da aeronave durante o voo e verificar se está seguindo a rota planejada.'),
    
    (nav_category_id, 'Dead reckoning (navegação por estima):', 'Navegação usando apenas GPS', 'Navegação baseada em cálculos de posição a partir de um ponto conhecido', 'Navegação apenas visual', 'Navegação usando apenas instrumentos', 1, 'Dead reckoning é o processo de calcular a posição atual baseando-se em uma posição previamente conhecida, usando velocidade, tempo, rumo e deriva estimados.'),
    
    (nav_category_id, 'Diferença entre rumo e proa:', 'São termos idênticos', 'Rumo é a direção desejada, proa é a direção que a aeronave aponta', 'Proa é sempre magnética, rumo é sempre verdadeiro', 'Rumo é medido em graus, proa em radianos', 1, 'Rumo (heading) é a direção desejada de voo sobre o solo, enquanto proa é a direção para onde o nariz da aeronave está apontando. Podem diferir devido ao vento lateral.');
END $$;