const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';

export function getAuthToken(): string | null {
  return localStorage.getItem('tssports_token');
}

export function setAuthToken(token: string) {
  localStorage.setItem('tssports_token', token);
}

export function removeAuthToken() {
  localStorage.removeItem('tssports_token');
}

export async function apiFetch<T>(endpoint: string, options: RequestInit = {}): Promise<T> {
  const token = getAuthToken();
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    ...(options.headers as Record<string, string>),
  };

  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }

  const response = await fetch(`${API_BASE_URL}${endpoint}`, {
    ...options,
    headers,
  });

  if (!response.ok) {
    const errorData = await response.json().catch(() => ({ error: response.statusText }));
    throw new Error(errorData.error || `HTTP error ${response.status}`);
  }

  return response.json();
}
