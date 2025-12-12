/**
 * StreakCard Component
 * 
 * Displays user's study streak information
 */

import { Flame, Trophy } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";

interface StreakCardProps {
  currentStreak: number;
  longestStreak: number;
}

export default function StreakCard({ currentStreak, longestStreak }: StreakCardProps) {
  return (
    <Card className="border-border bg-gradient-to-br from-orange-50 to-red-50">
      <CardContent className="p-6">
        <div className="flex items-center justify-between">
          {/* Current Streak */}
          <div className="flex items-center gap-4">
            <div className="p-3 bg-orange-100 rounded-full">
              <Flame className="w-8 h-8 text-orange-600" />
            </div>
            <div>
              <div className="text-3xl font-bold text-orange-600">
                {currentStreak}
              </div>
              <div className="text-sm text-muted-foreground">
                {currentStreak === 1 ? 'dia de ofensiva' : 'dias de ofensiva'}
              </div>
            </div>
          </div>

          {/* Longest Streak */}
          <div className="flex items-center gap-4">
            <div>
              <div className="text-2xl font-bold text-amber-600 text-right">
                {longestStreak}
              </div>
              <div className="text-sm text-muted-foreground text-right">
                recorde
              </div>
            </div>
            <div className="p-3 bg-amber-100 rounded-full">
              <Trophy className="w-6 h-6 text-amber-600" />
            </div>
          </div>
        </div>

        {/* Motivational Message */}
        {currentStreak > 0 && (
          <div className="mt-4 pt-4 border-t border-orange-200">
            <p className="text-sm text-center text-orange-800">
              {currentStreak >= 7 && "🔥 Incrível! Continue assim!"}
              {currentStreak >= 3 && currentStreak < 7 && "💪 Você está no caminho certo!"}
              {currentStreak < 3 && "✨ Continue estudando todos os dias!"}
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
