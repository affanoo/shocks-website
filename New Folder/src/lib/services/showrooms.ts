import type { Showroom } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchShowrooms(): Promise<Showroom[]> {
  try {
    return await apiFetch<Showroom[]>('/showrooms');
  } catch (error) {
    console.warn('Failed to fetch showrooms from API:', error);
    return [];
  }
}

export async function createShowroom(showroomData: Omit<Showroom, 'id'>): Promise<Showroom> {
  return await apiFetch<Showroom>('/showrooms', {
    method: 'POST',
    body: JSON.stringify(showroomData),
  });
}

export async function updateShowroom(id: string, showroomData: Partial<Showroom>): Promise<Showroom> {
  return await apiFetch<Showroom>(`/showrooms/${id}`, {
    method: 'PUT',
    body: JSON.stringify(showroomData),
  });
}

export async function deleteShowroom(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/showrooms/${id}`, {
    method: 'DELETE',
  });
}
