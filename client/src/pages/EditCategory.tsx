/**
 * EditCategory Page
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Interface for managing questions in a category
 * - Add, edit, and delete questions
 * - Clean, organized layout
 */

import { useState, useEffect } from "react";
import { useLocation, useRoute } from "wouter";
import { Button } from "@/components/ui/button";
import { ArrowLeft, Plus } from "lucide-react";
import QuestionEditor from "@/components/QuestionEditor";
import QuestionsList from "@/components/QuestionsList";
import { useAppState } from "@/hooks/useAppState";
import { Question } from "@/types";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default function EditCategory() {
  const [, setLocation] = useLocation();
  const [match, params] = useRoute("/edit/:categoryId");
  const [editingQuestion, setEditingQuestion] = useState<Question | null>(null);
  const [showNewForm, setShowNewForm] = useState(false);

  const { 
    appState, 
    getCategoryById, 
    addQuestion, 
    updateQuestion, 
    deleteQuestion,
    loadCategoryQuestions 
  } = useAppState();

  const categoryId = params?.categoryId;
  const category = categoryId ? getCategoryById(categoryId) : null;

  // Load questions when category is found and questions are empty
  useEffect(() => {
    if (category && category.questions.length === 0 && loadCategoryQuestions) {
      loadCategoryQuestions(category.id).then(questions => {
        // Update category with loaded questions
        // This is handled by the backend hook internally
      });
    }
  }, [category, loadCategoryQuestions]);

  if (!match || !category) {
    return null;
  }

  const handleSaveQuestion = async (questionData: Omit<Question, "id" | "wrongCount">) => {
    if (editingQuestion) {
      await updateQuestion(category.id, editingQuestion.id, {
        ...questionData,
        id: editingQuestion.id,
        wrongCount: editingQuestion.wrongCount,
      });
    } else {
      const newQuestion: Question = {
        id: `q-${Date.now()}`,
        ...questionData,
        wrongCount: 0,
      };
      await addQuestion(category.id, newQuestion);
    }

    setEditingQuestion(null);
    setShowNewForm(false);
  };

  const handleEditQuestion = (question: Question) => {
    setEditingQuestion(question);
    setShowNewForm(false);
  };

  const handleDeleteQuestion = async (questionId: string) => {
    await deleteQuestion(category.id, questionId);
  };

  const handleCancel = () => {
    setEditingQuestion(null);
    setShowNewForm(false);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white p-4 sm:p-6 lg:p-8">
      <div className="max-w-4xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <Button
            onClick={() => setLocation("/")}
            variant="ghost"
            className="mb-4 gap-2"
          >
            <ArrowLeft className="w-4 h-4" />
            Voltar
          </Button>

          <h1 className="text-3xl font-bold text-foreground mb-2">{category.name}</h1>
          {category.description && (
            <p className="text-muted-foreground">{category.description}</p>
          )}
        </div>

        {/* Stats */}
        <Card className="border-border bg-white mb-8">
          <CardContent className="pt-6">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <p className="text-sm text-muted-foreground">Total de Perguntas</p>
                <p className="text-2xl font-bold text-foreground">
                  {category.questions.length}
                </p>
              </div>
              <div>
                <p className="text-sm text-muted-foreground">Perguntas Erradas</p>
                <p className="text-2xl font-bold text-destructive">
                  {category.questions.filter((q) => q.wrongCount > 0).length}
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Editor or List */}
        {editingQuestion || showNewForm ? (
          <div className="mb-8">
            <QuestionEditor
              question={editingQuestion || undefined}
              onSave={handleSaveQuestion}
              onCancel={handleCancel}
            />
          </div>
        ) : (
          <div className="mb-8">
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-2xl font-bold text-foreground">Perguntas</h2>
              <Button
                onClick={() => setShowNewForm(true)}
                className="bg-primary hover:bg-primary/90 text-primary-foreground gap-2"
              >
                <Plus className="w-4 h-4" />
                Nova Pergunta
              </Button>
            </div>

            <QuestionsList
              questions={category.questions}
              onEdit={handleEditQuestion}
              onDelete={handleDeleteQuestion}
            />
          </div>
        )}

        {/* Back Button */}
        {!editingQuestion && !showNewForm && (
          <div className="flex gap-3">
            <Button
              onClick={() => setLocation("/")}
              variant="outline"
              className="flex-1"
            >
              Voltar para Categorias
            </Button>
          </div>
        )}
      </div>
    </div>
  );
}
