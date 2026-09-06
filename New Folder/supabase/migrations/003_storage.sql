-- ============================================================
-- TS Sports — Storage Buckets & Policies
-- Run in Supabase SQL Editor AFTER schema & RLS migrations
-- ============================================================

-- Create storage buckets
INSERT INTO storage.buckets (id, name, public) VALUES ('product-images', 'product-images', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO storage.buckets (id, name, public) VALUES ('blog-images', 'blog-images', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO storage.buckets (id, name, public) VALUES ('leadership-images', 'leadership-images', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO storage.buckets (id, name, public) VALUES ('supplier-logos', 'supplier-logos', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO storage.buckets (id, name, public) VALUES ('website-assets', 'website-assets', true) ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- Storage Policies: Public read, admin upload/delete
-- ============================================================

-- PRODUCT IMAGES BUCKET
CREATE POLICY "Public read product images" ON storage.objects
  FOR SELECT USING (bucket_id = 'product-images');

CREATE POLICY "Admin upload product images" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'product-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin update product images" ON storage.objects
  FOR UPDATE USING (
    bucket_id = 'product-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin delete product images" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'product-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- BLOG IMAGES BUCKET
CREATE POLICY "Public read blog images" ON storage.objects
  FOR SELECT USING (bucket_id = 'blog-images');

CREATE POLICY "Admin upload blog images" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'blog-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin update blog images" ON storage.objects
  FOR UPDATE USING (
    bucket_id = 'blog-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin delete blog images" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'blog-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- LEADERSHIP IMAGES BUCKET
CREATE POLICY "Public read leadership images" ON storage.objects
  FOR SELECT USING (bucket_id = 'leadership-images');

CREATE POLICY "Admin upload leadership images" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'leadership-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin delete leadership images" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'leadership-images'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- SUPPLIER LOGOS BUCKET
CREATE POLICY "Public read supplier logos" ON storage.objects
  FOR SELECT USING (bucket_id = 'supplier-logos');

CREATE POLICY "Admin upload supplier logos" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'supplier-logos'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin delete supplier logos" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'supplier-logos'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- WEBSITE ASSETS BUCKET
CREATE POLICY "Public read website assets" ON storage.objects
  FOR SELECT USING (bucket_id = 'website-assets');

CREATE POLICY "Admin upload website assets" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'website-assets'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admin delete website assets" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'website-assets'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );
