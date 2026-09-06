import type { SiteSettings } from '../../types';
import { apiFetch } from '../apiClient';

export async function fetchSiteSettings(): Promise<Partial<SiteSettings>> {
  try {
    return await apiFetch<Partial<SiteSettings>>('/settings');
  } catch (error) {
    console.warn('Failed to fetch site settings from API:', error);
    return {};
  }
}

export async function updateSiteSettings(settings: Partial<SiteSettings>): Promise<SiteSettings> {
  return await apiFetch<SiteSettings>('/settings', {
    method: 'PUT',
    body: JSON.stringify(settings),
  });
}
