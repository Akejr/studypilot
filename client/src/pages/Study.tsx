/**
 * Study Page
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean study interface with question display
 * - Navigation between questions
 * - Results display after completion
 */

import { useState } from "react";
import { useLocation, useRoute } from "wouter";
import { Button } from "@/components/ui/button";
import { ArrowLeft, ChevronRight } from "lucide-react";
import QuestionCard from "@/components/QuestionCard";
import ResultsCard from "@/components/ResultsCard";
import { useAppState } from "@/hooks/useAppState";
import { StudyResult } from "@/types";

export default function Study() {
  const [, setLocation] = useLocation();
  const [match, params] = useRoute("/study/:categoryId");
  const [result, setResult] = useState<StudyResult | null>(null);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);

  const {
    appState,
    recordAnswer,
    completeStudySession,
    startStudySession,
    clearSession,
  } = useAppState();

  const categoryId = params?.categoryId;
  const session = appState.currentSession;

  // Define handlers first before any early returns
  const handleBackToCategories = () => {
    clearSession();
    setLocation("/");
  };

  const handleRetry = async () => {
    setResult(null);
    setCurrentQuestionIndex(0);
    const newSession = await startStudySession(categoryId, 10);
    if (!newSession) {
      setLocation("/");
    }
  };

  if (!match || !categoryId) {
    setLocation("/");
    return null;
  }

  // Check for result FIRST before checking session
  // This prevents showing loading screen after completing session
  if (result) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white p-4 sm:p-6 lg:p-8">
        <div className="max-w-4xl mx-auto">
          <Button
            onClick={handleBackToCategories}
            variant="ghost"
            className="mb-6 gap-2"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar para Categorias
          </Button>

          <ResultsCard
            result={result}
            onRetry={handleRetry}
            onBackToCategories={handleBackToCategories}
          />
        </div>
      </div>
    );
  }

  if (!session) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white p-4 sm:p-6 lg:p-8">
        <div className="max-w-4xl mx-auto">
          <div className="text-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
            <p className="text-muted-foreground">Carregando sessão de estudo...</p>
          </div>
        </div>
      </div>
    );
  }

  const currentQuestion = session.questions[currentQuestionIndex];
  const selectedAnswerId = session.userAnswers.get(currentQuestion.id);
  const isLastQuestion = currentQuestionIndex === session.questions.length - 1;

  const handleAnswerSelect = (answerId: string) => {
    recordAnswer(currentQuestion.id, answerId);
  };

  const handleNext = async () => {
    if (isLastQuestion) {
      const studyResult = await completeStudySession();
      if (studyResult) {
        setResult(studyResult);
      }
    } else {
      setCurrentQuestionIndex(currentQuestionIndex + 1);
    }
  };

  const handlePrevious = () => {
    if (currentQuestionIndex > 0) {
      setCurrentQuestionIndex(currentQuestionIndex - 1);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white p-4 sm:p-6 lg:p-8">
      <div className="max-w-4xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <Button
            onClick={handleBackToCategories}
            variant="ghost"
            className="mb-4 gap-2"
          >
            <ArrowLeft className="w-4 h-4" />
            Cancelar
          </Button>

          <h1 className="text-3xl font-bold text-foreground">
            {appState.categories.find((c) => c.id === categoryId)?.name}
          </h1>
        </div>

        {/* Question */}
        <div className="mb-8">
          <QuestionCard
            question={currentQuestion}
            questionNumber={currentQuestionIndex + 1}
            totalQuestions={session.questions.length}
            selectedAnswerId={selectedAnswerId}
            onAnswerSelect={handleAnswerSelect}
          />
        </div>

        {/* Navigation */}
        <div className="flex gap-3 justify-between">
          <Button
            onClick={handlePrevious}
            variant="outline"
            disabled={currentQuestionIndex === 0}
          >
            Anterior
          </Button>

          <Button
            onClick={handleNext}
            disabled={!selectedAnswerId}
            className="bg-primary hover:bg-primary/90 text-primary-foreground gap-2"
          >
            {isLastQuestion ? "Finalizar" : "Próxima"}
            {!isLastQuestion && <ChevronRight className="w-4 h-4" />}
          </Button>
        </div>
      </div>
    </div>
  );
}
