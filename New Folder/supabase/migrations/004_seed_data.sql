-- ============================================================
-- TS Sports — Seed Data
-- Run AFTER all other migrations
-- ============================================================

-- ============================================================
-- Categories
-- ============================================================
INSERT INTO categories (name, slug, display_order, active) VALUES
  ('Full Length', 'full-length', 1, TRUE),
  ('Ankle Cut', 'ankle-cut', 2, TRUE),
  ('Sleeve Socks', 'sleeve-socks', 3, TRUE),
  ('Team Edition', 'team-edition', 4, TRUE),
  ('Accessories', 'accessories', 5, TRUE)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Products (with category references)
-- ============================================================
DO $$
DECLARE
  cat_full_length UUID;
  cat_ankle_cut UUID;
  cat_sleeve UUID;
  cat_team UUID;
  prod1 UUID;
  prod2 UUID;
  prod3 UUID;
  prod4 UUID;
  prod5 UUID;
  prod6 UUID;
BEGIN
  SELECT id INTO cat_full_length FROM categories WHERE slug = 'full-length';
  SELECT id INTO cat_ankle_cut FROM categories WHERE slug = 'ankle-cut';
  SELECT id INTO cat_sleeve FROM categories WHERE slug = 'sleeve-socks';
  SELECT id INTO cat_team FROM categories WHERE slug = 'team-edition';

  -- Product 1: Pro Grip White
  INSERT INTO products (name, slug, sku, short_description, description, price, original_price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Pro Grip Socks 2.0 - Pure White',
    'ts-sports-pro-grip-socks-2-white',
    'TS-SPORTS-001-WHT',
    'Flagship white matchday grip socks with anti-slip silicone pod technology and arch compression.',
    'Engineered for elite athletes, the TS Sports Pro Grip 2.0 features dual-density silicone pods that lock your foot inside the cleat, eliminating micro-slippage during explosive sprints, sharp cuts, and high-speed directional shifts. Constructed with breathable combed cotton and elastane compression arch support.',
    24.99, 29.99, cat_full_length, TRUE, TRUE, 'Hexagonal Dual-Traction Grid'
  ) RETURNING id INTO prod1;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES
    (prod1, '/images/socks_white.jpg', 'TS Sports Pro Grip White', 0),
    (prod1, '/images/hero.jpg', 'TS Sports Pro Grip White Detail', 1);

  INSERT INTO product_colors (product_id, color_name) VALUES
    (prod1, 'Pure White / Black Pods'),
    (prod1, 'Pure White / Gold Pods');

  INSERT INTO product_sizes (product_id, size_label) VALUES
    (prod1, 'S (EU 35-38)'), (prod1, 'M (EU 39-42)'), (prod1, 'L (EU 43-46)'), (prod1, 'XL (EU 47+)');

  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod1, '68% Combed Cotton, 22% Nylon, 10% Elastane', 0),
    (prod1, 'Non-slip medical grade Silicone Pod Matrix', 1),
    (prod1, 'Ergonomic Arch Band Compression', 2),
    (prod1, '3D Mesh Breathable Upper Instep', 3),
    (prod1, 'Double-stitched Seamless Toe Lock', 4);

  -- Product 2: Stealth Ankle Black
  INSERT INTO products (name, slug, sku, short_description, description, price, original_price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Stealth Ankle Grip Socks - Midnight Black',
    'ts-sports-stealth-ankle-grip-socks-black',
    'TS-SPORTS-002-BLK',
    'Sleek black ankle cut grip socks engineered for speed, agility, and minimal bulk.',
    'Designed for players who prefer a low-cut profile or wear leg sleeves. The Stealth Ankle Grip Socks offer low-profile ankle stability combined with high-friction silicone pads across the heel, midfoot, and forefoot to maximize power transfer into your boots.',
    22.99, 27.99, cat_ankle_cut, TRUE, TRUE, 'Diamond Pod Stability Array'
  ) RETURNING id INTO prod2;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES
    (prod2, '/images/socks_black.jpg', 'TS Sports Stealth Black', 0),
    (prod2, '/images/hero.jpg', 'TS Sports Stealth Black Detail', 1);

  INSERT INTO product_colors (product_id, color_name) VALUES
    (prod2, 'Midnight Black / White Pods'), (prod2, 'All Black Stealth');

  INSERT INTO product_sizes (product_id, size_label) VALUES
    (prod2, 'S (EU 35-38)'), (prod2, 'M (EU 39-42)'), (prod2, 'L (EU 43-46)');

  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod2, '70% Combed Cotton, 20% Nylon, 10% Spandex', 0),
    (prod2, 'Targeted Ankle Collar Reinforcement', 1),
    (prod2, 'High-Friction Silicone Sole Grid', 2),
    (prod2, 'Anti-Blister Cushion Heel', 3);

  -- Product 3: Volt Turbo
  INSERT INTO products (name, slug, sku, short_description, description, price, original_price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Volt Turbo Match Socks',
    'ts-sports-volt-turbo-match-socks',
    'TS-SPORTS-003-VLT',
    'High-visibility neon volt grip socks built for matchday speed and maximum pitch visibility.',
    'High-visibility neon volt yellow grip socks designed to stand out on the pitch. Features high-tack silicone grip elements, reinforced heel padding, and moisture-wicking weave for intense 90-minute performance.',
    26.99, 32.00, cat_full_length, TRUE, TRUE, 'Linear Chevron Grip Pods'
  ) RETURNING id INTO prod3;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES
    (prod3, '/images/hero.jpg', 'TS Sports Volt Turbo', 0),
    (prod3, '/images/socks_white.jpg', 'TS Sports Volt Turbo Detail', 1);

  INSERT INTO product_colors (product_id, color_name) VALUES (prod3, 'Volt Neon / Black Pods');
  INSERT INTO product_sizes (product_id, size_label) VALUES (prod3, 'M (EU 39-42)'), (prod3, 'L (EU 43-46)');
  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod3, '65% Cotton, 25% Polyester, 10% Elastane', 0),
    (prod3, 'Anti-Slip Silicone Footbed', 1),
    (prod3, 'Rapid Dry Venting Weave', 2);

  -- Product 4: Royal Blue
  INSERT INTO products (name, slug, sku, short_description, description, price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Royal Club Edition - Cobalt Blue',
    'ts-sports-royal-club-edition-blue',
    'TS-SPORTS-004-BLU',
    'Classic cobalt blue team edition grip socks with reinforced arch support and durable sole.',
    'Official club colorway featuring rich cobalt blue with white grip pads. Built to exact academy and professional team standards for seamless integration with team uniforms.',
    24.99, cat_team, FALSE, TRUE, 'Hexagonal Dual-Traction Grid'
  ) RETURNING id INTO prod4;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES
    (prod4, '/images/socks_white.jpg', 'TS Sports Royal Blue', 0),
    (prod4, '/images/socks_black.jpg', 'TS Sports Royal Blue Detail', 1);

  INSERT INTO product_colors (product_id, color_name) VALUES (prod4, 'Cobalt Blue / White Pods');
  INSERT INTO product_sizes (product_id, size_label) VALUES
    (prod4, 'S (EU 35-38)'), (prod4, 'M (EU 39-42)'), (prod4, 'L (EU 43-46)');
  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod4, '68% Cotton, 22% Nylon, 10% Elastane', 0),
    (prod4, 'Medical Silicone Traction Grid', 1);

  -- Product 5: Leg Sleeves
  INSERT INTO products (name, slug, sku, short_description, description, price, original_price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Pro Compression Leg Sleeves - White',
    'ts-sports-pro-leg-sleeves-white',
    'TS-SPORTS-SLV-001-WHT',
    'Calf compression leg sleeves designed to pair seamlessly with grip socks and shin guards.',
    'Matchday calf compression sleeves designed to hold shin guards securely in place when pairing with TS Sports Grip Socks. Provides calf muscle stabilization and reduces muscle vibration fatigue.',
    14.99, 18.00, cat_sleeve, FALSE, TRUE, 'Compression Weave'
  ) RETURNING id INTO prod5;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES (prod5, '/images/hero.jpg', 'TS Sports Leg Sleeves', 0);
  INSERT INTO product_colors (product_id, color_name) VALUES (prod5, 'Pure White'), (prod5, 'Midnight Black');
  INSERT INTO product_sizes (product_id, size_label) VALUES (prod5, 'S/M'), (prod5, 'L/XL');
  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod5, '80% Nylon, 20% Spandex Compression Weave', 0),
    (prod5, 'Non-slip Elastic Top Band', 1),
    (prod5, 'Graduated Calf Muscle Support', 2);

  -- Product 6: Crimson Flash
  INSERT INTO products (name, slug, sku, short_description, description, price, category_id, featured, active, grip_pattern)
  VALUES (
    'TS Sports Crimson Flash Match Socks',
    'ts-sports-crimson-flash-match-socks',
    'TS-SPORTS-005-RED',
    'Dynamic crimson red grip socks engineered for explosive power and heel stability.',
    'Vibrant crimson red performance socks featuring high-traction grip matrix, anti-blister padded soles, and zero-slip heel locks.',
    24.99, cat_team, FALSE, TRUE, 'Chevron Pod Matrix'
  ) RETURNING id INTO prod6;

  INSERT INTO product_images (product_id, image_url, alt_text, display_order) VALUES (prod6, '/images/socks_black.jpg', 'TS Sports Crimson Flash', 0);
  INSERT INTO product_colors (product_id, color_name) VALUES (prod6, 'Crimson Red / Black Pods');
  INSERT INTO product_sizes (product_id, size_label) VALUES (prod6, 'M (EU 39-42)'), (prod6, 'L (EU 43-46)');
  INSERT INTO product_material_specs (product_id, spec_text, display_order) VALUES
    (prod6, '68% Combed Cotton, 22% Nylon, 10% Elastane', 0),
    (prod6, 'Dual-Traction Silicone Matrix', 1);
END $$;

-- ============================================================
-- Blogs
-- ============================================================
INSERT INTO blogs (title, slug, summary, content, image, author, category, status, published_at) VALUES
(
  'Why Professional Athletes Wear TS Sports Performance Grip Socks',
  'why-professional-athletes-wear-ts-sports-grip-socks',
  'Discover how TS Sports grip socks eliminate foot slippage inside boots and maximize agility for matchday dominance.',
  E'In modern sports, footwear technology has advanced dramatically. However, internal boot friction remains a challenge that affects speed and agility.\n\n### The Science of Traction\nWhen an athlete accelerates or cuts sharply, tiny micro-slippages occur between the foot, sock, and boot insole. This wastes kinetic energy and creates heat that leads to blisters.\n\n### TS Sports Engineering\nTS Sports incorporates high-tack silicone pod matrices directly onto high-impact sole zones. This locks your foot directly to your boot sole plate, providing 100% mechanical agility transfer.',
  '/images/hero.jpg', 'Kashif Tufail', 'Sports Science', 'published', NOW()
),
(
  'How to Care for Your TS Sports Grip Socks',
  'care-guide-washing-ts-sports-grip-socks',
  'Follow these simple care instructions to keep your silicone grip pods sticky, elastic, and high-performing.',
  E'To keep your TS Sports grip socks performing at peak levels:\n\n- Wash inside out in cold water.\n- Avoid heavy fabric softeners that coat silicone pods.\n- Air dry naturally for maximum elasticity retention.',
  '/images/socks_white.jpg', 'Kashif Tufail', 'Maintenance', 'published', NOW()
)
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Showrooms
-- ============================================================
INSERT INTO showrooms (name, address, city, country, phone, hours, map_url, map_embed_url, active) VALUES
(
  'TS Sports Digital Showroom Online',
  'Official 3D Interactive Virtual Showroom Platform',
  'Online Worldwide',
  'Digital Global Hub',
  '03085410293',
  'Available 24/7 Online | Instant WhatsApp Assistance',
  'https://wa.me/923085410293',
  'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d108420.73278839211!2d74.4578135!3d32.492482!2m3!1f0!1f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391eea5674c0c7eb%3A0xe543e264627d3b25!2sSialkot%2C%20Punjab%2C%20Pakistan!5e0!3m2!1sen!2spk!4v1700000000000!5m2!1sen!2spk',
  TRUE
);

-- ============================================================
-- Leadership
-- ============================================================
INSERT INTO leadership (name, designation, bio, image, display_order, linkedin) VALUES
(
  'Kashif Tufail',
  'Chief Executive Officer & Founder',
  'Visionary founder and CEO of TS Sports. Kashif Tufail leads the brand in pioneering high-performance athletic apparel, precision grip gear, and global sporting goods innovation.',
  'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=400&q=80',
  1,
  'https://linkedin.com'
);

-- ============================================================
-- Suppliers
-- ============================================================
INSERT INTO suppliers (name, logo, category, location, website, description) VALUES
(
  'SilicoGrip Labs',
  'https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=200&q=80',
  'Silicone Traction Technology',
  'Munich, Germany',
  'https://silicogrip-labs.de',
  'Supplies medical-grade non-slip silicone compounds engineered specifically for high-torque athletic foot movement.'
),
(
  'Premier Athletic Yarn Mills',
  'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=200&q=80',
  'Combed Cotton & Performance Elastane',
  'Sialkot, Pakistan',
  'https://tssports.com',
  'Produces extra-long staple combed cotton threads with moisture-wicking treatments for maximum breathability and durability.'
);

-- ============================================================
-- Site Settings
-- ============================================================
INSERT INTO site_settings (key, value) VALUES
  ('brandName', 'TS Sports'),
  ('slogan', 'Unleash Maximum Athletic Performance & Agility'),
  ('whatsappNumber', '923085410293'),
  ('contactEmail', 'sportspakistan10@gmail.com'),
  ('contactPhone', '03085410293'),
  ('address', 'TS Sports Pakistan Headquarters, Industrial Sports Complex, Sialkot, Pakistan'),
  ('instagramUrl', 'https://instagram.com/tssports'),
  ('tiktokUrl', 'https://tiktok.com/@tssports'),
  ('youtubeUrl', 'https://youtube.com/tssports'),
  ('facebookUrl', 'https://facebook.com/tssports'),
  ('metaTitle', 'TS Sports | Official Performance Apparel & Grip Gear Catalog'),
  ('metaDescription', 'Explore TS Sports premium anti-slip grip socks and athletic performance gear. Direct WhatsApp ordering available with custom sizes & colors.')
ON CONFLICT (key) DO NOTHING;

-- ============================================================
-- Inquiry (sample)
-- ============================================================
INSERT INTO inquiries (name, email, phone, subject, message, status) VALUES
(
  'Team Manager Hassan',
  'hassan@sportsclub.com',
  '03085410293',
  'Bulk Custom Team Order',
  'Hello TS Sports team, we would like to order 50 pairs of TS Sports Pro Grip Socks for our academy squad.',
  'new'
);
