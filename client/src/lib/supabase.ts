/**
 * Supabase Client Configuration
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Simple and clean Supabase client setup
 * - Environment-based configuration
 * - Type-safe database operations
 */

import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Database Types
export interface Database {
  public: {
    Tables: {
      categories: {
        Row: {
          id: string;
          name: string;
          description: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          name: string;
          description: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          name?: string;
          description?: string;
          created_at?: string;
          updated_at?: string;
        };
      };
      questions: {
        Row: {
          id: string;
          category_id: string;
          text: string;
          option1: string;
          option2: string;
          option3: string;
          option4: string;
          correct_answer: number;
          explanation: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          category_id: string;
          text: string;
          option1: string;
          option2: string;
          option3: string;
          option4: string;
          correct_answer: number;
          explanation: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          category_id?: string;
          text?: string;
          option1?: string;
          option2?: string;
          option3?: string;
          option4?: string;
          correct_answer?: number;
          explanation?: string;
          created_at?: string;
          updated_at?: string;
        };
      };
      study_sessions: {
        Row: {
          id: string;
          category_id: string;
          type: string;
          started_at: string;
          completed_at: string | null;
        };
        Insert: {
          id?: string;
          category_id: string;
          type: string;
          started_at?: string;
          completed_at?: string | null;
        };
        Update: {
          id?: string;
          category_id?: string;
          type?: string;
          started_at?: string;
          completed_at?: string | null;
        };
      };
      session_questions: {
        Row: {
          session_id: string;
          question_id: string;
          question_order: number;
        };
        Insert: {
          session_id: string;
          question_id: string;
          question_order: number;
        };
        Update: {
          session_id?: string;
          question_id?: string;
          question_order?: number;
        };
      };
      answers: {
        Row: {
          id: string;
          session_id: string;
          question_id: string;
          selected_answer: number;
          is_correct: boolean;
          answered_at: string;
        };
        Insert: {
          id?: string;
          session_id: string;
          question_id: string;
          selected_answer: number;
          is_correct: boolean;
          answered_at?: string;
        };
        Update: {
          id?: string;
          session_id?: string;
          question_id?: string;
          selected_answer?: number;
          is_correct?: boolean;
          answered_at?: string;
        };
      };
    };
  };
}