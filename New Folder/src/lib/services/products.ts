import type { Product } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchProducts(): Promise<Product[]> {
  try {
    return await apiFetch<Product[]>('/products');
  } catch (error) {
    console.warn('Failed to fetch products from backend API, falling back to default:', error);
    return [];
  }
}

export async function fetchProductById(id: string): Promise<Product | null> {
  try {
    return await apiFetch<Product>(`/products/${id}`);
  } catch (error) {
    console.error(`Error fetching product ${id}:`, error);
    return null;
  }
}

export async function createProduct(productData: Omit<Product, 'id' | 'createdAt'>): Promise<Product> {
  return await apiFetch<Product>('/products', {
    method: 'POST',
    body: JSON.stringify(productData),
  });
}

export async function updateProduct(id: string, productData: Partial<Product>): Promise<Product> {
  return await apiFetch<Product>(`/products/${id}`, {
    method: 'PUT',
    body: JSON.stringify(productData),
  });
}

export async function deleteProduct(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/products/${id}`, {
    method: 'DELETE',
  });
}
