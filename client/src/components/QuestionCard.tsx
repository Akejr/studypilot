/**
 * QuestionCard Component
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean presentation of questions and answers
 * - Radio button selection for answer choice
 * - Progress indicator
 */

import { Question } from "@/types";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";

interface QuestionCardProps {
  question: Question;
  questionNumber: number;
  totalQuestions: number;
  selectedAnswerId?: string;
  onAnswerSelect: (answerId: string) => void;
}

export default function QuestionCard({
  question,
  questionNumber,
  totalQuestions,
  selectedAnswerId,
  onAnswerSelect,
}: QuestionCardProps) {
  return (
    <div className="bg-white rounded-lg shadow-sm border border-border p-8">
      {/* Progress */}
      <div className="mb-6">
        <div className="flex justify-between items-center mb-2">
          <span className="text-sm font-medium text-muted-foreground">
            Pergunta {questionNumber} de {totalQuestions}
          </span>
          <span className="text-sm font-medium text-primary">
            {Math.round((questionNumber / totalQuestions) * 100)}%
          </span>
        </div>
        <div className="w-full bg-secondary rounded-full h-2">
          <div
            className="bg-primary h-2 rounded-full transition-all duration-300"
            style={{ width: `${(questionNumber / totalQuestions) * 100}%` }}
          ></div>
        </div>
      </div>

      {/* Question Statement */}
      <h2 className="text-2xl font-bold text-foreground mb-8 leading-relaxed">
        {question.statement}
      </h2>

      {/* Answers */}
      <RadioGroup value={selectedAnswerId || ""} onValueChange={onAnswerSelect}>
        <div className="space-y-3">
          {question.answers.map((answer) => (
            <div
              key={answer.id}
              className="flex items-center space-x-3 p-4 rounded-lg border border-border hover:bg-secondary/50 cursor-pointer transition-colors"
            >
              <RadioGroupItem value={answer.id} id={answer.id} />
              <Label
                htmlFor={answer.id}
                className="flex-1 cursor-pointer text-base text-foreground"
              >
                {answer.text}
              </Label>
            </div>
          ))}
        </div>
      </RadioGroup>
    </div>
  );
}
