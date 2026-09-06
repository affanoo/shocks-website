import { apiFetch, setAuthToken, removeAuthToken, getAuthToken } from '../apiClient';

export interface AuthResponse {
  token: string;
  user: {
    id: string;
    email: string;
    name?: string;
  };
}

export async function loginAdmin(email: string, password: string): Promise<AuthResponse> {
  const data = await apiFetch<AuthResponse>('/auth/login', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  });

  if (data.token) {
    setAuthToken(data.token);
  }

  return data;
}

export function logoutAdmin(): void {
  removeAuthToken();
}

export function getAdminSessionToken(): string | null {
  return getAuthToken();
}
