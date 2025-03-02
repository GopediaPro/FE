import React, { useEffect, useState } from 'react';
import { useAuthStore } from '../../../states/authStore';
import { Loading } from '../Loading';

export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const { refreshTokens } = useAuthStore();
  const [isInitializing, setIsInitializing] = useState(true);

  useEffect(() => {
    const initAuth = async () => {
      try {
        await refreshTokens();
      } catch (error) {
        console.error('Auth initialization failed:', error);
      } finally {
        setIsInitializing(false);
      }
    };

    initAuth();
  }, [refreshTokens]);

  if (isInitializing) {
    return <Loading />;
  }

  return <>{children}</>;
};