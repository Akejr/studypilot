# Design Document

## Overview

O sistema de estudos para piloto será implementado como uma API REST usando Node.js com TypeScript, fornecendo endpoints para gerenciar categorias, perguntas, sessões de estudo e histórico de respostas. O sistema utilizará SQLite como banco de dados para persistência local e incluirá validação robusta de dados e tratamento de erros.

## Architecture

### Backend Architecture
- **Framework**: Express.js com TypeScript
- **Database**: SQLite com migrations
- **ORM**: Prisma para type-safe database access
- **Validation**: Zod para validação de schemas
- **Testing**: Jest para unit tests, fast-check para property-based testing

### API Design
- RESTful endpoints seguindo convenções HTTP
- JSON como formato de dados
- Middleware para validação, logging e error handling
- CORS configurado para integração com frontend

## Components and Interfaces

### Core Models

```typescript
interface Category {
  id: string;
  name: string;
  description: string;
  createdAt: Date;
  updatedAt: Date;
}

interface Question {
  id: string;
  categoryId: string;
  text: string;
  options: string[]; // Array de 4 opções
  correctAnswer: number; // Índice da resposta correta (0-3)
  explanation: string;
  createdAt: Date;
  updatedAt: Date;
}

interface StudySession {
  id: string;
  categoryId: string;
  type: 'study' | 'review';
  questions: string[]; // Array de IDs das perguntas
  startedAt: Date;
  completedAt?: Date;
}

interface Answer {
  id: string;
  sessionId: string;
  questionId: string;
  selectedAnswer: number;
  isCorrect: boolean;
  answeredAt: Date;
}
```

### API Endpoints

#### Categories
- `GET /api/categories` - Listar todas as categorias
- `POST /api/categories` - Criar nova categoria
- `GET /api/categories/:id` - Obter categoria específica
- `PUT /api/categories/:id` - Atualizar categoria
- `DELETE /api/categories/:id` - Excluir categoria

#### Questions
- `GET /api/categories/:categoryId/questions` - Listar perguntas da categoria
- `POST /api/categories/:categoryId/questions` - Criar nova pergunta
- `GET /api/questions/:id` - Obter pergunta específica
- `PUT /api/questions/:id` - Atualizar pergunta
- `DELETE /api/questions/:id` - Excluir pergunta

#### Study Sessions
- `POST /api/categories/:categoryId/study` - Iniciar sessão de estudo
- `POST /api/categories/:categoryId/review` - Iniciar sessão de revisão
- `GET /api/sessions/:id` - Obter detalhes da sessão
- `POST /api/sessions/:id/answers` - Submeter resposta
- `POST /api/sessions/:id/complete` - Finalizar sessão

#### Statistics
- `GET /api/categories/:categoryId/stats` - Estatísticas da categoria
- `GET /api/questions/:questionId/stats` - Estatísticas da pergunta

## Data Models

### Database Schema

```sql
-- Categories table
CREATE TABLE categories (
  id TEXT PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  description TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Questions table
CREATE TABLE questions (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL,
  text TEXT NOT NULL,
  option_1 TEXT NOT NULL,
  option_2 TEXT NOT NULL,
  option_3 TEXT NOT NULL,
  option_4 TEXT NOT NULL,
  correct_answer INTEGER NOT NULL CHECK (correct_answer >= 0 AND correct_answer <= 3),
  explanation TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Study sessions table
CREATE TABLE study_sessions (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('study', 'review')),
  started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Session questions table (many-to-many)
CREATE TABLE session_questions (
  session_id TEXT NOT NULL,
  question_id TEXT NOT NULL,
  question_order INTEGER NOT NULL,
  PRIMARY KEY (session_id, question_id),
  FOREIGN KEY (session_id) REFERENCES study_sessions(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- Answers table
CREATE TABLE answers (
  id TEXT PRIMARY KEY,
  session_id TEXT NOT NULL,
  question_id TEXT NOT NULL,
  selected_answer INTEGER NOT NULL CHECK (selected_answer >= 0 AND selected_answer <= 3),
  is_correct BOOLEAN NOT NULL,
  answered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (session_id) REFERENCES study_sessions(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);
```

### Business Logic Services

```typescript
class CategoryService {
  async createCategory(data: CreateCategoryDto): Promise<Category>
  async getCategories(): Promise<Category[]>
  async getCategoryById(id: string): Promise<Category | null>
  async updateCategory(id: string, data: UpdateCategoryDto): Promise<Category>
  async deleteCategory(id: string): Promise<void>
}

class QuestionService {
  async createQuestion(categoryId: string, data: CreateQuestionDto): Promise<Question>
  async getQuestionsByCategory(categoryId: string): Promise<Question[]>
  async getQuestionById(id: string): Promise<Question | null>
  async updateQuestion(id: string, data: UpdateQuestionDto): Promise<Question>
  async deleteQuestion(id: string): Promise<void>
}

class StudyService {
  async startStudySession(categoryId: string): Promise<StudySession>
  async startReviewSession(categoryId: string): Promise<StudySession>
  async submitAnswer(sessionId: string, questionId: string, answer: number): Promise<Answer>
  async completeSession(sessionId: string): Promise<SessionResult>
  async getSessionById(id: string): Promise<StudySession | null>
}

class StatisticsService {
  async getCategoryStats(categoryId: string): Promise<CategoryStats>
  async getQuestionStats(questionId: string): Promise<QuestionStats>
  async getMostMissedQuestions(categoryId: string, limit: number): Promise<Question[]>
}
```

## Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system-essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*

### Property Reflection

Após análise dos critérios de aceitação, identifiquei algumas propriedades redundantes que podem ser consolidadas:
- Propriedades de persistência (6.1, 6.2, 6.4) podem ser combinadas em uma propriedade de round-trip
- Propriedades de seleção de perguntas (3.1, 3.4, 5.1, 5.2, 5.4) podem ser agrupadas por comportamento similar
- Propriedades de validação HTTP (7.1, 7.2, 7.3, 7.4) podem ser consolidadas

### Core Properties

**Property 1: Category persistence round-trip**
*For any* valid category data, creating and then retrieving the category should return equivalent data with generated ID and timestamps
**Validates: Requirements 1.1, 6.1, 6.2**

**Property 2: Category name uniqueness**
*For any* existing category name, attempting to create another category with the same name should be rejected and leave the system unchanged
**Validates: Requirements 1.4**

**Property 3: Category deletion cascades**
*For any* category with associated questions, deleting the category should remove both the category and all its questions from the system
**Validates: Requirements 1.5**

**Property 4: Question persistence round-trip**
*For any* valid question data, creating and then retrieving the question should return equivalent data with generated ID and timestamps
**Validates: Requirements 2.1, 6.1, 6.2**

**Property 5: Question validation enforcement**
*For any* question data without a valid correct answer (0-3), the system should reject the creation and maintain current state
**Validates: Requirements 2.4**

**Property 6: Study session question selection**
*For any* category with N questions, starting a study session should select min(N, 10) unique questions from that category
**Validates: Requirements 3.1, 3.4**

**Property 7: Answer recording accuracy**
*For any* valid answer submission, the system should correctly record whether the selected answer matches the question's correct answer
**Validates: Requirements 3.2**

**Property 8: Percentage calculation correctness**
*For any* completed session with N questions and C correct answers, the calculated percentage should equal (C/N) * 100
**Validates: Requirements 3.3**

**Property 9: Review session selection algorithm**
*For any* category with sufficient answer history, a review session should select the 5 questions with the highest error rate
**Validates: Requirements 5.1**

**Property 10: Review session fallback**
*For any* category without sufficient answer history, a review session should select min(5, available_questions) random questions
**Validates: Requirements 5.2, 5.4**

**Property 11: Statistics update consistency**
*For any* completed session, all question statistics should be updated to reflect the new answer data
**Validates: Requirements 5.3**

**Property 12: Data persistence durability**
*For any* system state, restarting the system should restore the exact same data state
**Validates: Requirements 6.4**

**Property 13: HTTP response consistency**
*For any* valid API request, the response should include appropriate HTTP status codes and consistent JSON structure
**Validates: Requirements 7.1, 7.4**

**Property 14: Input validation completeness**
*For any* invalid input data, the system should reject the request and return descriptive error messages
**Validates: Requirements 7.2, 7.3**

**Property 15: Concurrent operation safety**
*For any* set of simultaneous operations on the same data, the final state should be consistent and all operations should complete successfully or fail gracefully
**Validates: Requirements 7.5**

## Error Handling

### Validation Errors
- **Invalid Input**: Return 400 Bad Request with detailed field-level errors
- **Duplicate Names**: Return 409 Conflict for category name collisions
- **Missing Required Fields**: Return 400 Bad Request with specific missing field information

### Resource Errors
- **Not Found**: Return 404 Not Found for non-existent resources
- **Foreign Key Violations**: Return 400 Bad Request when referencing non-existent parent resources
- **Insufficient Data**: Return 422 Unprocessable Entity when business rules prevent operation

### System Errors
- **Database Connection**: Return 503 Service Unavailable with retry information
- **Data Corruption**: Attempt recovery, log error, return 500 Internal Server Error if recovery fails
- **Concurrent Modification**: Return 409 Conflict with current resource state

### Error Response Format
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {
        "field": "name",
        "message": "Name is required and must be unique"
      }
    ],
    "timestamp": "2024-01-01T00:00:00Z"
  }
}
```

## Testing Strategy

### Dual Testing Approach
O sistema utilizará tanto testes unitários quanto testes baseados em propriedades para garantir cobertura abrangente:

- **Unit Tests**: Verificam exemplos específicos, casos extremos e condições de erro
- **Property-Based Tests**: Verificam propriedades universais que devem ser válidas para todas as entradas

### Property-Based Testing Requirements
- **Framework**: fast-check para TypeScript/JavaScript
- **Iterations**: Mínimo de 100 iterações por teste de propriedade
- **Tagging**: Cada teste deve referenciar explicitamente a propriedade do design usando o formato: `**Feature: pilot-study-system, Property {number}: {property_text}**`
- **Implementation**: Cada propriedade de correção deve ser implementada por um ÚNICO teste baseado em propriedades

### Unit Testing Requirements
- **Framework**: Jest para testes unitários
- **Coverage**: Casos específicos, pontos de integração e condições de erro
- **Complementarity**: Testes unitários capturam bugs concretos, testes de propriedade verificam correção geral

### Test Categories

#### Model Tests
- Validation logic for all data models
- Business rule enforcement
- Data transformation accuracy

#### Service Tests
- Business logic correctness
- Error handling scenarios
- Integration between services

#### API Tests
- HTTP status code correctness
- Request/response format validation
- Authentication and authorization

#### Database Tests
- Data persistence verification
- Transaction integrity
- Migration correctness

### Test Data Generation
- **Categories**: Random names, descriptions, and metadata
- **Questions**: Random text, options, correct answers, and explanations
- **Sessions**: Random question selections and answer patterns
- **Edge Cases**: Empty datasets, boundary conditions, invalid inputs