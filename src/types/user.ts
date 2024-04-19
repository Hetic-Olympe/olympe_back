export interface User {
    id: number;
    full_name: string;
    email: string;
    password: string;
    token?: string; // Le token est facultatif car il peut ne pas être présent dans toutes les opérations
  }
  