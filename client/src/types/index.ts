/**
 * Type definitions for PilotStudy
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean, professional structure mirroring aviation precision
 * - All data types support localStorage persistence
 */

export interface Answer {
  id: string;
  text: string;
  isCorrect: boolean;
}

export interface Question {
  id: string;
  statement: string;
  answers: Answer[];
  explanation: string;
  wrongCount: number; // Tracks how many times user got this wrong
}

export interface Category {
  id: string;
  name: string;
  description?: string;
  questions: Question[];
  createdAt: string;
}

export interface StudySession {
  categoryId: string;
  questions: Question[];
  currentQuestionIndex: number;
  userAnswers: Map<string, string>; // questionId -> answerId
  startedAt: string;
}

export interface StudyResult {
  categoryId: string;
  totalQuestions: number;
  correctAnswers: number;
  percentage: number;
  wrongQuestions: Question[];
  completedAt: string;
  timeSpent: number; // in seconds
}

export interface AppState {
  categories: Category[];
  currentSession: StudySession | null;
  lastResult: StudyResult | null;
}
