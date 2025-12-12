/**
 * Categories Page
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Hero section with gradient background
 * - Grid layout for category cards
 * - Clear navigation and action buttons
 */

import { useLocation } from "wouter";
import { Plane } from "lucide-react";
import CategoryCard from "@/components/CategoryCard";
import StreakCard from "@/components/StreakCard";
import { useAppState } from "@/hooks/useAppState";

export default function Categories() {
  const [, setLocation] = useLocation();
  const {
    appState,
    categoryStatistics,
    streak,
    startStudySession,
    startWrongQuestionsSession,
  } = useAppState();

  const handleStudy = async (categoryId: string) => {
    console.log('handleStudy called with categoryId:', categoryId);
    try {
      const session = await startStudySession(categoryId, 10);
      console.log('startStudySession returned:', session);
      if (session) {
        console.log('Navigating to study page...');
        setLocation(`/study/${categoryId}`);
      } else {
        console.log('No session returned, not navigating');
      }
    } catch (error) {
      console.error('Error in handleStudy:', error);
    }
  };

  const handleWrongQuestions = async (categoryId: string) => {
    const session = await startWrongQuestionsSession(categoryId);
    if (session) {
      setLocation(`/study/${categoryId}?mode=wrong`);
    }
  };

  const handleEdit = (categoryId: string) => {
    setLocation(`/edit/${categoryId}`);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white">
      {/* Hero Section */}
      <div
        className="relative py-16 px-4 sm:px-6 lg:px-8 bg-cover bg-center"
        style={{
          backgroundImage: "url('/images/hero-study.png')",
          backgroundAttachment: "fixed",
        }}
      >
        <div className="absolute inset-0 bg-gradient-to-r from-white/95 to-white/90"></div>

        <div className="relative max-w-6xl mx-auto">
          <div className="flex items-center gap-3 mb-4">
            <div className="p-2 bg-primary/10 rounded-lg">
              <Plane className="w-6 h-6 text-primary" />
            </div>
            <h1 className="text-4xl sm:text-5xl font-bold text-foreground">
              PilotStudy
            </h1>
          </div>

          <p className="text-lg text-muted-foreground max-w-2xl">
            Estude perguntas de piloto de forma eficiente. Escolha uma categoria, responda
            questionários aleatórios e acompanhe seu progresso.
          </p>
        </div>
      </div>

      {/* Streak Card */}
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <StreakCard 
          currentStreak={streak.currentStreak} 
          longestStreak={streak.longestStreak} 
        />
      </div>

      {/* Categories Grid */}
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pb-16">
        {appState.categories.length === 0 ? (
          <div className="text-center py-12">
            <div className="mb-4 flex justify-center">
              <img
                src="/images/empty-state.png"
                alt="Nenhuma categoria"
                className="w-32 h-32 opacity-80"
              />
            </div>
            <h2 className="text-2xl font-bold text-foreground mb-2">
              Carregando categorias...
            </h2>
            <p className="text-muted-foreground">
              Aguarde enquanto carregamos as categorias de estudo
            </p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {appState.categories.map((category) => (
              <CategoryCard
                key={category.id}
                category={category}
                statistics={categoryStatistics[category.id]}
                onStudy={handleStudy}
                onWrongQuestions={handleWrongQuestions}
                onEdit={handleEdit}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
