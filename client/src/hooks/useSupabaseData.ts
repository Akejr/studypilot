import { useEffect, useState, useCallback } from "react";
import type { AppState, StudySession, StudyResult, Question } from "@/types";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

export function useSupabaseData() {
  const [appState, setAppState] = useState<AppState>({
    categories: [],
    currentSession: null,
    lastResult: null,
  });

  const [isLoaded, setIsLoaded] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [categoryStatistics, setCategoryStatistics] = useState<Record<string, any>>({});
  const [streak, setStreak] = useState<{ currentStreak: number; longestStreak: number }>({
    currentStreak: 0,
    longestStreak: 0,
  });

  const loadCategories = useCallback(async () => {
    try {
      setIsLoading(true);
      
      const { data: categories, error } = await supabase
        .from('categories')
        .select('*')
        .order('created_at', { ascending: true });

      if (error) throw error;
      
      const categoriesWithQuestions = await Promise.all(
        (categories || []).map(async (cat: any) => {
          const { data: questions, error: questionsError } = await supabase
            .from('questions')
            .select('*')
            .eq('category_id', cat.id)
            .order('created_at', { ascending: true });

          if (questionsError) {
            console.error(`Failed to load questions for category ${cat.id}:`, questionsError);
            return {
              id: cat.id,
              name: cat.name,
              description: cat.description,
              questions: [],
              createdAt: cat.created_at,
            };
          }

          const convertedQuestions = (questions || []).map((q: any): Question => ({
            id: q.id,
            statement: q.text,
            answers: [
              { id: `${q.id}-answer-0`, text: q.option1, isCorrect: q.correct_answer === 0 },
              { id: `${q.id}-answer-1`, text: q.option2, isCorrect: q.correct_answer === 1 },
              { id: `${q.id}-answer-2`, text: q.option3, isCorrect: q.correct_answer === 2 },
              { id: `${q.id}-answer-3`, text: q.option4, isCorrect: q.correct_answer === 3 },
            ],
            explanation: q.explanation,
            wrongCount: 0,
          }));

          return {
            id: cat.id,
            name: cat.name,
            description: cat.description,
            questions: convertedQuestions,
            createdAt: cat.created_at,
          };
        })
      );
      
      setAppState((prev: AppState) => ({
        ...prev,
        categories: categoriesWithQuestions,
      }));
    } catch (error) {
      console.error('Failed to load categories:', error);
      toast.error('Erro ao carregar categorias');
    } finally {
      setIsLoading(false);
    }
  }, []);

  const loadStatistics = useCallback(async () => {
    try {
      const { data: stats, error } = await supabase
        .from('category_statistics')
        .select('*');

      if (error) throw error;

      const statsMap: Record<string, any> = {};
      (stats || []).forEach((stat: any) => {
        const percentage = stat.total_questions_answered > 0
          ? Math.round((stat.correct_answers / stat.total_questions_answered) * 100)
          : 0;
        
        statsMap[stat.category_id] = {
          totalQuestionsAnswered: stat.total_questions_answered,
          correctAnswers: stat.correct_answers,
          wrongAnswers: stat.wrong_answers,
          percentage,
        };
      });

      setCategoryStatistics(statsMap);
    } catch (error) {
      console.error('Failed to load statistics:', error);
    }
  }, []);

  const loadStreak = useCallback(async () => {
    try {
      const { data, error } = await supabase
        .from('user_streak')
        .select('current_streak, longest_streak')
        .limit(1)
        .single();

      if (error) throw error;

      if (data) {
        setStreak({
          currentStreak: data.current_streak || 0,
          longestStreak: data.longest_streak || 0,
        });
      }
    } catch (error) {
      console.error('Failed to load streak:', error);
    }
  }, []);

  useEffect(() => {
    Promise.all([loadCategories(), loadStatistics(), loadStreak()]).then(() => setIsLoaded(true));
  }, [loadCategories, loadStatistics, loadStreak]);

  const startStudySession = async (categoryId: string, questionCount: number = 10) => {
    try {
      setIsLoading(true);
      
      const category = appState.categories.find((cat: any) => cat.id === categoryId);
      
      if (!category || category.questions.length === 0) {
        toast.error('Esta categoria não possui perguntas');
        return null;
      }

      const shuffledQuestions = [...category.questions].sort(() => Math.random() - 0.5);
      const sessionQuestions = shuffledQuestions.slice(0, Math.min(questionCount, shuffledQuestions.length));

      const { data: session, error } = await supabase
        .from('study_sessions')
        .insert([{
          category_id: categoryId,
          type: 'study',
        }])
        .select()
        .single();

      if (error) throw error;

      const frontendSession: StudySession = {
        categoryId,
        questions: sessionQuestions,
        currentQuestionIndex: 0,
        userAnswers: new Map(),
        startedAt: session.started_at,
      };

      setAppState((prev: AppState) => ({
        ...prev,
        currentSession: { ...frontendSession, supabaseSessionId: session.id } as any,
      }));

      return frontendSession;
    } catch (error) {
      console.error('Failed to start study session:', error);
      toast.error('Erro ao iniciar sessão de estudo');
      return null;
    } finally {
      setIsLoading(false);
    }
  };

  const startWrongQuestionsSession = async (categoryId: string) => {
    return startStudySession(categoryId, 5);
  };

  const recordAnswer = (questionId: string, answerId: string) => {
    setAppState((prev: AppState) => {
      if (!prev.currentSession) return prev;

      const newAnswers = new Map(prev.currentSession.userAnswers);
      newAnswers.set(questionId, answerId);

      return {
        ...prev,
        currentSession: {
          ...prev.currentSession,
          userAnswers: newAnswers,
        },
      };
    });
  };

  const completeStudySession = async (): Promise<StudyResult | null> => {
    if (!appState.currentSession) return null;

    try {
      setIsLoading(true);
      const session = appState.currentSession as any;
      const supabaseSessionId = session.supabaseSessionId;

      if (supabaseSessionId) {
        const answersData = [];
        for (const [questionId, answerId] of session.userAnswers.entries()) {
          const question = session.questions.find((q: Question) => q.id === questionId);
          if (question) {
            const selectedAnswerIndex = question.answers.findIndex((answer: any) => answer.id === answerId);
            const isCorrect = question.answers[selectedAnswerIndex].isCorrect;
            
            answersData.push({
              session_id: supabaseSessionId,
              question_id: questionId,
              selected_answer: selectedAnswerIndex,
              is_correct: isCorrect,
            });
          }
        }

        if (answersData.length > 0) {
          await supabase.from('answers').insert(answersData);
        }

        await supabase
          .from('study_sessions')
          .update({ completed_at: new Date().toISOString() })
          .eq('id', supabaseSessionId);
      }

      const totalQuestions = session.questions.length;
      let correctAnswers = 0;
      const wrongQuestions = [];

      for (const question of session.questions) {
        const userAnswerId = session.userAnswers.get(question.id);
        const correctAnswer = question.answers.find((answer: any) => answer.isCorrect);
        
        if (userAnswerId === correctAnswer?.id) {
          correctAnswers++;
        } else {
          wrongQuestions.push(question);
        }
      }

      const percentage = Math.round((correctAnswers / totalQuestions) * 100);

      const result: StudyResult = {
        categoryId: session.categoryId,
        totalQuestions,
        correctAnswers,
        percentage,
        wrongQuestions,
        completedAt: new Date().toISOString(),
        timeSpent: Math.round(
          (new Date().getTime() - new Date(session.startedAt).getTime()) / 1000
        ),
      };

      setAppState((prev: AppState) => ({
        ...prev,
        currentSession: null,
        lastResult: result,
      }));

      // Reload statistics and streak after completing session
      await Promise.all([loadStatistics(), loadStreak()]);

      return result;
    } catch (error) {
      console.error('Failed to complete session:', error);
      toast.error('Erro ao finalizar sessão');
      return null;
    } finally {
      setIsLoading(false);
    }
  };

  const clearSession = () => {
    setAppState((prev: AppState) => ({
      ...prev,
      currentSession: null,
    }));
  };

  const addCategory = async (_name: string, _description?: string) => {
    toast.error('Função não implementada ainda');
    return null;
  };

  const updateCategory = async (_categoryId: string, _updates: any) => {
    toast.error('Função não implementada ainda');
  };

  const deleteCategory = async (_categoryId: string) => {
    toast.error('Função não implementada ainda');
  };

  const getCategoryById = (categoryId: string) => {
    return appState.categories.find((cat: any) => cat.id === categoryId);
  };

  const addQuestion = async (_categoryId: string, _questionData: any) => {
    toast.error('Função não implementada ainda');
    return null;
  };

  const updateQuestion = async (_categoryId: string, _questionId: string, _updates: any) => {
    toast.error('Função não implementada ainda');
  };

  const deleteQuestion = async (_categoryId: string, _questionId: string) => {
    toast.error('Função não implementada ainda');
  };

  const incrementWrongCount = (_categoryId: string, _questionId: string) => {
    // This will be implemented with proper statistics later
  };

  const loadCategoryQuestions = async (categoryId: string) => {
    const category = getCategoryById(categoryId);
    return category?.questions || [];
  };

  return {
    appState,
    isLoaded,
    isLoading,
    categoryStatistics,
    streak,
    addCategory,
    updateCategory,
    deleteCategory,
    getCategoryById,
    addQuestion,
    updateQuestion,
    deleteQuestion,
    incrementWrongCount,
    startStudySession,
    startWrongQuestionsSession,
    recordAnswer,
    completeStudySession,
    clearSession,
    loadCategories,
    loadCategoryQuestions,
    loadStatistics,
    loadStreak,
  };
}
