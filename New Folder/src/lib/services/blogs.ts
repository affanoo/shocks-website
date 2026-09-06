import type { Blog } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchBlogs(): Promise<Blog[]> {
  try {
    return await apiFetch<Blog[]>('/blogs');
  } catch (error) {
    console.warn('Failed to fetch blogs from API:', error);
    return [];
  }
}

export async function createBlog(blogData: Omit<Blog, 'id' | 'publishedAt'>): Promise<Blog> {
  return await apiFetch<Blog>('/blogs', {
    method: 'POST',
    body: JSON.stringify(blogData),
  });
}

export async function updateBlog(id: string, blogData: Partial<Blog>): Promise<Blog> {
  return await apiFetch<Blog>(`/blogs/${id}`, {
    method: 'PUT',
    body: JSON.stringify(blogData),
  });
}

export async function deleteBlog(id: string): Promise<void> {
  await apiFetch<{ success: boolean }>(`/blogs/${id}`, {
    method: 'DELETE',
  });
}
