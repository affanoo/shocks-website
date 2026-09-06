import type { Inquiry } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchInquiries(): Promise<Inquiry[]> {
  try {
    return await apiFetch<Inquiry[]>('/inquiries');
  } catch (error) {
    console.warn('Failed to fetch inquiries from API:', error);
    return [];
  }
}

export async function createInquiry(inquiryData: Omit<Inquiry, 'id' | 'createdAt' | 'status'>): Promise<Inquiry> {
  return await apiFetch<Inquiry>('/inquiries', {
    method: 'POST',
    body: JSON.stringify(inquiryData),
  });
}

export async function updateInquiryStatus(id: string, status: 'new' | 'replied' | 'archived'): Promise<Inquiry> {
  return await apiFetch<Inquiry>(`/inquiries/${id}`, {
    method: 'PUT',
    body: JSON.stringify({ status }),
  });
}

export async function deleteInquiry(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/inquiries/${id}`, {
    method: 'DELETE',
  });
}
