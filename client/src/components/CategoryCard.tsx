/**
 * CategoryCard Component
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean card layout with clear action buttons
 * - Displays category info, question count and statistics
 * - Responsive design with subtle hover effects
 */

import { Category } from "@/types";
import { Button } from "@/components/ui/button";
import { BookOpen, Edit2, AlertCircle, TrendingUp } from "lucide-react";

interface CategoryStatistics {
  totalQuestionsAnswered: number;
  correctAnswers: number;
  wrongAnswers: number;
  percentage: number;
}

interface CategoryCardProps {
  category: Category;
  statistics?: CategoryStatistics;
  onStudy: (categoryId: string) => void;
  onWrongQuestions: (categoryId: string) => void;
  onEdit: (categoryId: string) => void;
}

export default function CategoryCard({
  category,
  statistics,
  onStudy,
  onWrongQuestions,
  onEdit,
}: CategoryCardProps) {
  const hasStatistics = statistics && statistics.totalQuestionsAnswered > 0;
  const hasWrongAnswers = statistics && statistics.wrongAnswers > 0;

  return (
    <div className="bg-white border border-border rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow duration-300">
      {/* Header */}
      <div className="mb-4">
        <h3 className="text-xl font-bold text-foreground mb-1">{category.name}</h3>
        {category.description && (
          <p className="text-sm text-muted-foreground line-clamp-2">{category.description}</p>
        )}
      </div>

      {/* Statistics */}
      {hasStatistics && (
        <div className="mb-4 p-3 bg-gradient-to-r from-blue-50 to-indigo-50 rounded-lg border border-blue-100">
          <div className="flex items-center justify-between mb-2">
            <div className="flex items-center gap-2">
              <TrendingUp className="w-4 h-4 text-primary" />
              <span className="text-sm font-semibold text-foreground">Seu Desempenho</span>
            </div>
            <span className={`text-2xl font-bold ${
              statistics.percentage >= 70 ? 'text-green-600' : 
              statistics.percentage >= 50 ? 'text-yellow-600' : 
              'text-red-600'
            }`}>
              {statistics.percentage}%
            </span>
          </div>
          <div className="flex gap-4 text-xs text-muted-foreground">
            <span className="text-green-600 font-medium">
              ✓ {statistics.correctAnswers} acertos
            </span>
            <span className="text-red-600 font-medium">
              ✗ {statistics.wrongAnswers} erros
            </span>
          </div>
        </div>
      )}

      {/* Stats */}
      <div className="flex gap-4 mb-6 text-sm">
        <div className="flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-primary" />
          <span className="text-foreground font-medium">{category.questions.length} perguntas</span>
        </div>
      </div>

      {/* Actions */}
      <div className="flex flex-col gap-2">
        <Button
          onClick={() => onStudy(category.id)}
          className="w-full bg-primary hover:bg-primary/90 text-primary-foreground"
          disabled={category.questions.length === 0}
        >
          Estudar
        </Button>

        <div className="flex gap-2">
          <Button
            onClick={() => onWrongQuestions(category.id)}
            variant="outline"
            className="flex-1"
            disabled={!hasWrongAnswers}
            title={hasWrongAnswers ? "Revisar perguntas erradas" : "Nenhuma pergunta errada ainda"}
          >
            <AlertCircle className="w-4 h-4 mr-2" />
            Erradas
          </Button>

          <Button
            onClick={() => onEdit(category.id)}
            variant="outline"
            className="flex-1"
          >
            <Edit2 className="w-4 h-4 mr-2" />
            Editar
          </Button>
        </div>
      </div>
    </div>
  );
}
