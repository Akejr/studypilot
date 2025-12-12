import { createContext, useContext, ReactNode } from "react";
import { useSupabaseData } from "@/hooks/useSupabaseData";

type AppStateContextType = ReturnType<typeof useSupabaseData>;

const AppStateContext = createContext<AppStateContextType | null>(null);

export function AppStateProvider({ children }: { children: ReactNode }) {
  const appStateData = useSupabaseData();
  
  return (
    <AppStateContext.Provider value={appStateData}>
      {children}
    </AppStateContext.Provider>
  );
}

export function useAppStateContext() {
  const context = useContext(AppStateContext);
  if (!context) {
    throw new Error("useAppStateContext must be used within AppStateProvider");
  }
  return context;
}
