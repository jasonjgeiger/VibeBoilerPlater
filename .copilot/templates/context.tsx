import React, { createContext, useContext, useReducer, ReactNode } from 'react';

interface ContextState {
  // Add your state here
}

interface ContextAction {
  type: string;
  payload?: unknown;
}

interface ContextProviderProps {
  children: ReactNode;
}

const initialState: ContextState = {
  // Add your initial state here
};

const Context = createContext<{
  state: ContextState;
  dispatch: React.Dispatch<ContextAction>;
} | undefined>(undefined);

const reducer = (state: ContextState, action: ContextAction): ContextState => {
  switch (action.type) {
    // Add your cases here
    default:
      return state;
  }
};

/**
 * ContextProvider - Brief description of what this context provides
 * @param props - Provider props
 * @returns Context provider component
 */
export const ContextProvider: React.FC<ContextProviderProps> = ({ children }) => {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <Context.Provider value={{ state, dispatch }}>
      {children}
    </Context.Provider>
  );
};

/**
 * useContext - Hook to access the context
 * @returns Context value
 */
export const useContext = () => {
  const context = useContext(Context);
  if (context === undefined) {
    throw new Error('useContext must be used within a ContextProvider');
  }
  return context;
}; 