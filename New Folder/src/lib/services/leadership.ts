import type { Leadership } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchLeadership(): Promise<Leadership[]> {
  try {
    return await apiFetch<Leadership[]>('/leadership');
  } catch (error) {
    console.warn('Failed to fetch leadership from API:', error);
    return [];
  }
}

export async function createLeader(leaderData: Omit<Leadership, 'id'>): Promise<Leadership> {
  return await apiFetch<Leadership>('/leadership', {
    method: 'POST',
    body: JSON.stringify(leaderData),
  });
}

export async function updateLeader(id: string, leaderData: Partial<Leadership>): Promise<Leadership> {
  return await apiFetch<Leadership>(`/leadership/${id}`, {
    method: 'PUT',
    body: JSON.stringify(leaderData),
  });
}

export async function deleteLeader(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/leadership/${id}`, {
    method: 'DELETE',
  });
}
