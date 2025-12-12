/**
 * ResultsCard Component
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Shows study session results with clear metrics
 * - Lists wrong questions with explanations
 * - Celebration visual for high scores
 */

import { StudyResult } from "@/types";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { CheckCircle2, AlertCircle, Clock } from "lucide-react";
import { formatTime } from "@/lib/utils";

interface ResultsCardProps {
  result: StudyResult;
  onRetry: () => void;
  onBackToCategories: () => void;
}

export default function ResultsCard({
  result,
  onRetry,
  onBackToCategories,
}: ResultsCardProps) {
  const isExcellent = result.percentage >= 80;
  const isGood = result.percentage >= 60;

  return (
    <div className="space-y-6">
      {/* Main Result Card */}
      <Card className="border-border bg-white">
        <CardHeader className="text-center pb-8">
          <div className="flex justify-center mb-4">
            {isExcellent ? (
              <img
                src="/images/success-illustration.png"
                alt="Sucesso"
                className="w-32 h-32"
              />
            ) : (
              <div className="w-32 h-32 flex items-center justify-center">
                <div className="text-center">
                  <div className="text-6xl font-bold text-primary mb-2">
                    {result.percentage}%
                  </div>
                </div>
              </div>
            )}
          </div>

          <CardTitle className="text-3xl mb-2">
            {isExcellent && "Excelente desempenho!"}
            {isGood && !isExcellent && "Bom desempenho!"}
            {!isGood && "Continue praticando!"}
          </CardTitle>

          <CardDescription className="text-base">
            Você acertou {result.correctAnswers} de {result.totalQuestions} perguntas
          </CardDescription>
        </CardHeader>

        <CardContent>
          <div className="grid grid-cols-3 gap-4 mb-8">
            <div className="text-center p-4 bg-secondary/50 rounded-lg">
              <div className="flex justify-center mb-2">
                <CheckCircle2 className="w-6 h-6 text-primary" />
              </div>
              <div className="text-2xl font-bold text-foreground">
                {result.correctAnswers}
              </div>
              <div className="text-sm text-muted-foreground">Corretas</div>
            </div>

            <div className="text-center p-4 bg-secondary/50 rounded-lg">
              <div className="flex justify-center mb-2">
                <AlertCircle className="w-6 h-6 text-destructive" />
              </div>
              <div className="text-2xl font-bold text-foreground">
                {result.wrongQuestions.length}
              </div>
              <div className="text-sm text-muted-foreground">Erradas</div>
            </div>

            <div className="text-center p-4 bg-secondary/50 rounded-lg">
              <div className="flex justify-center mb-2">
                <Clock className="w-6 h-6 text-muted-foreground" />
              </div>
              <div className="text-2xl font-bold text-foreground">
                {formatTime(result.timeSpent)}
              </div>
              <div className="text-sm text-muted-foreground">Tempo</div>
            </div>
          </div>

          <div className="flex gap-3">
            <Button
              onClick={onRetry}
              className="flex-1 bg-primary hover:bg-primary/90 text-primary-foreground"
            >
              Tentar Novamente
            </Button>
            <Button
              onClick={onBackToCategories}
              variant="outline"
              className="flex-1"
            >
              Voltar para Categorias
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Wrong Questions */}
      {result.wrongQuestions.length > 0 && (
        <Card className="border-border bg-white">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <AlertCircle className="w-5 h-5 text-destructive" />
              Perguntas Erradas
            </CardTitle>
            <CardDescription>
              Revise as perguntas que você errou para melhorar
            </CardDescription>
          </CardHeader>

          <CardContent>
            <div className="space-y-6">
              {result.wrongQuestions.map((question, index) => {
                const correctAnswer = question.answers.find((a) => a.isCorrect);
                return (
                  <div
                    key={question.id}
                    className="pb-6 border-b border-border last:border-b-0 last:pb-0"
                  >
                    <div className="mb-3">
                      <h4 className="font-semibold text-foreground mb-2">
                        {index + 1}. {question.statement}
                      </h4>
                    </div>

                    <div className="mb-3 p-3 bg-green-50 border border-green-200 rounded-lg">
                      <p className="text-sm font-medium text-green-900 mb-1">
                        Resposta Correta:
                      </p>
                      <p className="text-sm text-green-800">{correctAnswer?.text}</p>
                    </div>

                    <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg">
                      <p className="text-sm font-medium text-blue-900 mb-2">
                        Explicação:
                      </p>
                      <p className="text-sm text-blue-800 leading-relaxed">
                        {question.explanation}
                      </p>
                    </div>
                  </div>
                );
              })}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
