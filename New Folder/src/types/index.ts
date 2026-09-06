export interface Product {
  id: string;
  name: string;
  slug: string;
  SKU: string;
  description: string;
  shortDescription: string;
  price?: number;
  originalPrice?: number;
  status: 'active' | 'inactive';
  featured: boolean;
  category: 'Full Length' | 'Ankle Cut' | 'Sleeve Socks' | 'Team Edition' | 'Accessories';
  colors: string[];
  sizes: string[];
  materialSpecs: string[];
  gripPattern: string;
  images: string[];
  createdAt: string;
}

export interface Blog {
  id: string;
  title: string;
  slug: string;
  summary: string;
  content: string;
  image: string;
  author: string;
  category: string;
  status: 'published' | 'draft';
  publishedAt: string;
}

export interface Showroom {
  id: string;
  name: string;
  address: string;
  city: string;
  country: string;
  phone: string;
  hours: string;
  mapUrl: string;
  mapEmbedUrl: string;
  isActive: boolean;
}

export interface Leadership {
  id: string;
  name: string;
  designation: string;
  bio: string;
  image: string;
  displayOrder: number;
  linkedIn?: string;
}

export interface Supplier {
  id: string;
  name: string;
  logo: string;
  category: string;
  location: string;
  website: string;
  description: string;
}

export interface Inquiry {
  id: string;
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  status: 'new' | 'replied' | 'archived';
  createdAt: string;
}

export interface SiteSettings {
  brandName: string;
  slogan: string;
  whatsappNumber: string;
  contactEmail: string;
  contactPhone: string;
  address: string;
  instagramUrl: string;
  tiktokUrl: string;
  youtubeUrl: string;
  facebookUrl: string;
  metaTitle: string;
  metaDescription: string;
}

export type ActiveTab = 
  | 'home'
  | 'products'
  | 'showrooms'
  | 'about'
  | 'leadership'
  | 'suppliers'
  | 'blogs'
  | 'contact'
  | 'admin-login'
  | 'admin-dashboard';
