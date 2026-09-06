-- ============================================================
-- TS Sports — Row Level Security Policies
-- Run AFTER 001_schema.sql
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_colors ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_sizes ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_material_specs ENABLE ROW LEVEL SECURITY;
ALTER TABLE blogs ENABLE ROW LEVEL SECURITY;
ALTER TABLE showrooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE leadership ENABLE ROW LEVEL SECURITY;
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE inquiries ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE hero_slides ENABLE ROW LEVEL SECURITY;
ALTER TABLE why_choose_us ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- Helper function: check if current user is admin
-- ============================================================
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND role = 'admin'
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- PROFILES
-- ============================================================
CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Admins can view all profiles" ON profiles
  FOR SELECT USING (is_admin());

-- ============================================================
-- CATEGORIES — Public read, admin write
-- ============================================================
CREATE POLICY "Public can read active categories" ON categories
  FOR SELECT USING (active = TRUE);

CREATE POLICY "Admins full access categories" ON categories
  FOR ALL USING (is_admin());

-- ============================================================
-- PRODUCTS — Public read active, admin full CRUD
-- ============================================================
CREATE POLICY "Public can read active products" ON products
  FOR SELECT USING (active = TRUE);

CREATE POLICY "Admins full access products" ON products
  FOR ALL USING (is_admin());

-- ============================================================
-- PRODUCT IMAGES — Public read (for active products), admin write
-- ============================================================
CREATE POLICY "Public can read product images" ON product_images
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM products WHERE products.id = product_images.product_id AND products.active = TRUE
    )
  );

CREATE POLICY "Admins full access product images" ON product_images
  FOR ALL USING (is_admin());

-- ============================================================
-- PRODUCT COLORS — Public read, admin write
-- ============================================================
CREATE POLICY "Public can read product colors" ON product_colors
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM products WHERE products.id = product_colors.product_id AND products.active = TRUE
    )
  );

CREATE POLICY "Admins full access product colors" ON product_colors
  FOR ALL USING (is_admin());

-- ============================================================
-- PRODUCT SIZES — Public read, admin write
-- ============================================================
CREATE POLICY "Public can read product sizes" ON product_sizes
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM products WHERE products.id = product_sizes.product_id AND products.active = TRUE
    )
  );

CREATE POLICY "Admins full access product sizes" ON product_sizes
  FOR ALL USING (is_admin());

-- ============================================================
-- PRODUCT MATERIAL SPECS — Public read, admin write
-- ============================================================
CREATE POLICY "Public can read product specs" ON product_material_specs
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM products WHERE products.id = product_material_specs.product_id AND products.active = TRUE
    )
  );

CREATE POLICY "Admins full access product specs" ON product_material_specs
  FOR ALL USING (is_admin());

-- ============================================================
-- BLOGS — Public read published, admin full CRUD
-- ============================================================
CREATE POLICY "Public can read published blogs" ON blogs
  FOR SELECT USING (status = 'published');

CREATE POLICY "Admins full access blogs" ON blogs
  FOR ALL USING (is_admin());

-- ============================================================
-- SHOWROOMS — Public read active, admin full CRUD
-- ============================================================
CREATE POLICY "Public can read active showrooms" ON showrooms
  FOR SELECT USING (active = TRUE);

CREATE POLICY "Admins full access showrooms" ON showrooms
  FOR ALL USING (is_admin());

-- ============================================================
-- LEADERSHIP — Public read, admin full CRUD
-- ============================================================
CREATE POLICY "Public can read leadership" ON leadership
  FOR SELECT USING (TRUE);

CREATE POLICY "Admins full access leadership" ON leadership
  FOR ALL USING (is_admin());

-- ============================================================
-- SUPPLIERS — Public read, admin full CRUD
-- ============================================================
CREATE POLICY "Public can read suppliers" ON suppliers
  FOR SELECT USING (TRUE);

CREATE POLICY "Admins full access suppliers" ON suppliers
  FOR ALL USING (is_admin());

-- ============================================================
-- INQUIRIES — Public can insert, admin can read/update
-- ============================================================
CREATE POLICY "Public can submit inquiries" ON inquiries
  FOR INSERT WITH CHECK (TRUE);

CREATE POLICY "Admins full access inquiries" ON inquiries
  FOR ALL USING (is_admin());

-- ============================================================
-- SITE SETTINGS — Public read, admin write
-- ============================================================
CREATE POLICY "Public can read site settings" ON site_settings
  FOR SELECT USING (TRUE);

CREATE POLICY "Admins full access site settings" ON site_settings
  FOR ALL USING (is_admin());

-- ============================================================
-- HERO SLIDES — Public read active, admin write
-- ============================================================
CREATE POLICY "Public can read active hero slides" ON hero_slides
  FOR SELECT USING (active = TRUE);

CREATE POLICY "Admins full access hero slides" ON hero_slides
  FOR ALL USING (is_admin());

-- ============================================================
-- WHY CHOOSE US — Public read active, admin write
-- ============================================================
CREATE POLICY "Public can read active why choose us" ON why_choose_us
  FOR SELECT USING (active = TRUE);

CREATE POLICY "Admins full access why choose us" ON why_choose_us
  FOR ALL USING (is_admin());
