/**
 * QuestionsList Component
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean list of questions with edit/delete actions
 * - Shows question count and wrong count
 */

import { Question } from "@/types";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Edit2, Trash2, AlertCircle } from "lucide-react";

interface QuestionsListProps {
  questions: Question[];
  onEdit: (question: Question) => void;
  onDelete: (questionId: string) => void;
}

export default function QuestionsList({ questions, onEdit, onDelete }: QuestionsListProps) {
  if (questions.length === 0) {
    return (
      <Card className="border-border bg-white p-8 text-center">
        <p className="text-muted-foreground mb-4">Nenhuma pergunta nesta categoria</p>
        <p className="text-sm text-muted-foreground">
          Crie perguntas para começar a estudar
        </p>
      </Card>
    );
  }

  return (
    <div className="space-y-3">
      {questions.map((question, index) => (
        <Card
          key={question.id}
          className="border-border bg-white p-4 hover:shadow-md transition-shadow"
        >
          <div className="flex items-start justify-between gap-4">
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 mb-2">
                <span className="text-sm font-medium text-muted-foreground">
                  Pergunta {index + 1}
                </span>
                {question.wrongCount > 0 && (
                  <div className="flex items-center gap-1 px-2 py-1 bg-red-50 rounded text-xs font-medium text-red-700">
                    <AlertCircle className="w-3 h-3" />
                    {question.wrongCount} erros
                  </div>
                )}
              </div>
              <p className="text-foreground font-medium line-clamp-2">
                {question.statement}
              </p>
              <p className="text-sm text-muted-foreground mt-2 line-clamp-1">
                {question.explanation}
              </p>
            </div>

            <div className="flex gap-2 flex-shrink-0">
              <Button
                onClick={() => onEdit(question)}
                variant="outline"
                size="sm"
                title="Editar pergunta"
              >
                <Edit2 className="w-4 h-4" />
              </Button>
              <Button
                onClick={() => {
                  if (confirm("Tem certeza que deseja deletar esta pergunta?")) {
                    onDelete(question.id);
                  }
                }}
                variant="outline"
                size="sm"
                title="Deletar pergunta"
              >
                <Trash2 className="w-4 h-4 text-destructive" />
              </Button>
            </div>
          </div>
        </Card>
      ))}
    </div>
  );
}
