import type { Supplier } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchSuppliers(): Promise<Supplier[]> {
  try {
    return await apiFetch<Supplier[]>('/suppliers');
  } catch (error) {
    console.warn('Failed to fetch suppliers from API:', error);
    return [];
  }
}

export async function createSupplier(supplierData: Omit<Supplier, 'id'>): Promise<Supplier> {
  return await apiFetch<Supplier>('/suppliers', {
    method: 'POST',
    body: JSON.stringify(supplierData),
  });
}

export async function updateSupplier(id: string, supplierData: Partial<Supplier>): Promise<Supplier> {
  return await apiFetch<Supplier>(`/suppliers/${id}`, {
    method: 'PUT',
    body: JSON.stringify(supplierData),
  });
}

export async function deleteSupplier(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/suppliers/${id}`, {
    method: 'DELETE',
  });
}
