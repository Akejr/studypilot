/**
 * Debug Page
 * 
 * Test page to verify backend integration
 */

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default function Debug() {
  const [supabaseStatus, setSupabaseStatus] = useState<any>(null);
  const [categories, setCategories] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [envVars, setEnvVars] = useState<any>({});

  const testSupabaseConnection = async () => {
    try {
      setLoading(true);
      setError(null);
      console.log('Testing Supabase connection...');
      
      // Test basic connection
      const { data, error } = await supabase.from('categories').select('count');
      
      if (error) throw error;
      
      setSupabaseStatus({
        status: 'connected',
        message: 'Supabase connection successful',
        timestamp: new Date().toISOString(),
      });
    } catch (err: any) {
      console.error('Supabase connection error:', err);
      setError(err.message);
      setSupabaseStatus({
        status: 'error',
        message: err.message,
        timestamp: new Date().toISOString(),
      });
    } finally {
      setLoading(false);
    }
  };

  const testGetCategories = async () => {
    try {
      setLoading(true);
      setError(null);
      console.log('Testing get categories from Supabase...');
      
      const { data: cats, error } = await supabase
        .from('categories')
        .select('*')
        .order('created_at', { ascending: true });
      
      if (error) throw error;
      
      console.log('Categories result:', cats);
      setCategories(cats || []);
    } catch (err: any) {
      console.error('Categories error:', err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    // Check environment variables
    setEnvVars({
      VITE_SUPABASE_URL: import.meta.env.VITE_SUPABASE_URL,
      VITE_SUPABASE_ANON_KEY: import.meta.env.VITE_SUPABASE_ANON_KEY ? '***hidden***' : 'undefined',
      VITE_USE_SUPABASE: import.meta.env.VITE_USE_SUPABASE,
    });
    
    testSupabaseConnection();
    testGetCategories();
  }, []);

  return (
    <div className="min-h-screen bg-gradient-to-br from-white via-blue-50 to-white p-4 sm:p-6 lg:p-8">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-3xl font-bold text-foreground mb-8">Debug - Supabase Integration</h1>

        {error && (
          <Card className="border-red-200 bg-red-50 mb-6">
            <CardContent className="pt-6">
              <p className="text-red-600">Error: {error}</p>
            </CardContent>
          </Card>
        )}

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Supabase Connection */}
          <Card>
            <CardHeader>
              <CardTitle>Supabase Connection</CardTitle>
            </CardHeader>
            <CardContent>
              <Button onClick={testSupabaseConnection} disabled={loading} className="mb-4">
                {loading ? 'Testing...' : 'Test Supabase Connection'}
              </Button>
              
              {supabaseStatus && (
                <div className="bg-gray-100 p-3 rounded">
                  <pre>{JSON.stringify(supabaseStatus, null, 2)}</pre>
                </div>
              )}
            </CardContent>
          </Card>

          {/* Categories */}
          <Card>
            <CardHeader>
              <CardTitle>Categories</CardTitle>
            </CardHeader>
            <CardContent>
              <Button onClick={testGetCategories} disabled={loading} className="mb-4">
                {loading ? 'Loading...' : 'Load Categories'}
              </Button>
              
              {categories.length > 0 && (
                <div className="bg-gray-100 p-3 rounded max-h-64 overflow-y-auto">
                  <pre>{JSON.stringify(categories, null, 2)}</pre>
                </div>
              )}
            </CardContent>
          </Card>
        </div>

        <Card className="mt-6">
          <CardHeader>
            <CardTitle>Supabase Configuration</CardTitle>
          </CardHeader>
          <CardContent>
            <p><strong>Supabase URL:</strong> {envVars.VITE_SUPABASE_URL || 'undefined'}</p>
            <p><strong>Supabase Key:</strong> {envVars.VITE_SUPABASE_ANON_KEY || 'undefined'}</p>
            <p><strong>Use Supabase:</strong> {envVars.VITE_USE_SUPABASE || 'undefined'}</p>
            <div className="mt-4">
              <h4 className="font-semibold">Environment Variables:</h4>
              <pre className="bg-gray-100 p-2 rounded text-xs">
                {JSON.stringify(envVars, null, 2)}
              </pre>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}