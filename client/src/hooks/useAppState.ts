/**
 * useAppState Hook
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Manages application state with Supabase integration
 * - Provides clean interface for categories and study sessions
 * - Simple and reliable data operations
 */

import { useAppStateContext } from "@/contexts/AppStateContext";

export const useAppState = () => {
  return useAppStateContext();
};
