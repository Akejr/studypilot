import { Toaster } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import NotFound from "@/pages/NotFound";
import { Route, Switch } from "wouter";
import ErrorBoundary from "./components/ErrorBoundary";
import { ThemeProvider } from "./contexts/ThemeContext";
import { AppStateProvider } from "./contexts/AppStateContext";
import Categories from "./pages/Categories";
import Study from "./pages/Study";
import EditCategory from "./pages/EditCategory";
import Debug from "./pages/Debug";

/**
 * PilotStudy Router
 * 
 * Design Philosophy: Minimalismo Aéreo Moderno
 * - Clean routing structure
 * - Clear navigation between pages
 */
function Router() {
  return (
    <Switch>
      <Route path={"/"} component={Categories} />
      <Route path={"/debug"} component={Debug} />
      <Route path={"/study/:categoryId"} component={Study} />
      <Route path={"/edit/:categoryId"} component={EditCategory} />
      <Route path={"/404"} component={NotFound} />
      {/* Final fallback route */}
      <Route component={NotFound} />
    </Switch>
  );
}

// NOTE: About Theme
// - First choose a default theme according to your design style (dark or light bg), than change color palette in index.css
//   to keep consistent foreground/background color across components
// - If you want to make theme switchable, pass `switchable` ThemeProvider and use `useTheme` hook

function App() {
  return (
    <ErrorBoundary>
      <ThemeProvider defaultTheme="light">
        <AppStateProvider>
          <TooltipProvider>
            <Toaster />
            <Router />
          </TooltipProvider>
        </AppStateProvider>
      </ThemeProvider>
    </ErrorBoundary>
  );
}

export default App;
