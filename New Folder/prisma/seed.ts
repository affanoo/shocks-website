import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

async function main() {
  console.log('🌱 Starting Prisma seeding...');

  // 1. Create Default Admin User
  const adminEmail = 'admin@tssports.pk';
  const defaultPassword = 'Password123!';
  const hashedPassword = await bcrypt.hash(defaultPassword, 10);

  await prisma.admin.upsert({
    where: { email: adminEmail },
    update: { password: hashedPassword },
    create: {
      email: adminEmail,
      password: hashedPassword,
      name: 'Kashif Tufail',
    },
  });
  console.log(`✅ Admin account configured: ${adminEmail}`);

  // 2. Seed Default Site Settings
  const settingsData = [
    { key: 'brandName', value: 'TS Sports' },
    { key: 'slogan', value: 'Elevate Your Performance with Elite Athletic Wear' },
    { key: 'whatsappNumber', value: '03085410293' },
    { key: 'contactEmail', value: 'sportspakistan10@gmail.com' },
    { key: 'contactPhone', value: '+92 308 5410293' },
    { key: 'address', value: 'Industrial Estate, Sialkot, Punjab, Pakistan' },
    { key: 'instagramUrl', value: 'https://instagram.com/tssports' },
    { key: 'tiktokUrl', value: 'https://tiktok.com/@tssports' },
    { key: 'youtubeUrl', value: 'https://youtube.com/@tssports' },
    { key: 'facebookUrl', value: 'https://facebook.com/tssports' },
    { key: 'metaTitle', value: 'TS Sports | Premium Sports & Athletic Gear' },
    { key: 'metaDescription', value: 'Leading manufacturer of elite sports grip socks, athletic compression wear, and team edition accessories.' },
  ];

  for (const s of settingsData) {
    await prisma.siteSetting.upsert({
      where: { key: s.key },
      update: { value: s.value },
      create: s,
    });
  }
  console.log('✅ Site settings seeded.');

  // 3. Seed CEO Kashif Tufail Profile
  await prisma.leadership.deleteMany({});
  await prisma.leadership.create({
    data: {
      name: 'Kashif Tufail',
      designation: 'Founder & CEO',
      bio: 'Kashif Tufail leads TS Sports with a vision to deliver world-class athletic gear and high-performance grip socks for athletes across Pakistan and internationally.',
      image: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=600',
      displayOrder: 1,
      linkedIn: 'https://linkedin.com',
    },
  });
  console.log('✅ CEO profile seeded.');

  // 4. Seed Initial Products
  const productsCount = await prisma.product.count();
  if (productsCount === 0) {
    const products = [
      {
        name: 'Pro Performance Grip Socks (Black)',
        slug: 'pro-performance-grip-socks-black',
        SKU: 'TSS-GRIP-BLK-01',
        description: 'Engineered with anti-slip silicone dots and dynamic arch support for maximum friction and agility during explosive athletic movement.',
        shortDescription: 'Anti-slip elite grip socks designed for professional football and athletic performance.',
        price: 1499,
        originalPrice: 1999,
        status: 'active',
        featured: true,
        category: 'Full Length',
        colors: ['#000000', '#1F2937'],
        sizes: ['M (EU 38-42)', 'L (EU 43-46)'],
        materialSpecs: ['75% Combed Cotton', '18% Polyester', '7% Elastane', 'Silicone Grip Pads'],
        gripPattern: 'Hexagon Anti-Slip Pattern',
        images: ['https://images.unsplash.com/photo-1586350977771-b3b0abd50c82?auto=format&fit=crop&q=80&w=800'],
      },
      {
        name: 'Ankle Performance Socks (White Edition)',
        slug: 'ankle-performance-socks-white-edition',
        SKU: 'TSS-ANK-WHT-02',
        description: 'Lightweight ankle compression socks featuring breathable mesh panels and moisture-wicking technology.',
        shortDescription: 'Ultra-light breathable ankle socks for gym workouts and running.',
        price: 1199,
        originalPrice: 1599,
        status: 'active',
        featured: true,
        category: 'Ankle Cut',
        colors: ['#FFFFFF', '#E5E7EB'],
        sizes: ['S (EU 35-37)', 'M (EU 38-42)', 'L (EU 43-46)'],
        materialSpecs: ['80% Nylon', '20% Spandex'],
        gripPattern: 'Micro-Dot Arch Cushioning',
        images: ['https://images.unsplash.com/photo-1582966772680-860e372bb558?auto=format&fit=crop&q=80&w=800'],
      },
      {
        name: 'Compression Calf Sleeve Pair',
        slug: 'compression-calf-sleeve-pair',
        SKU: 'TSS-SLV-NAV-03',
        description: 'Graduated calf compression sleeves to boost blood flow, prevent muscle fatigue, and support recovery.',
        shortDescription: 'Graduated athletic compression calf sleeves for endurance support.',
        price: 1299,
        originalPrice: 1799,
        status: 'active',
        featured: true,
        category: 'Sleeve Socks',
        colors: ['#1E3A8A', '#000000'],
        sizes: ['M', 'L', 'XL'],
        materialSpecs: ['85% Polyamide', '15% Elastane'],
        gripPattern: 'Elastic Top Band Lock',
        images: ['https://images.unsplash.com/photo-1543163521-1bf539c55dd2?auto=format&fit=crop&q=80&w=800'],
      },
    ];

    for (const p of products) {
      await prisma.product.create({ data: p });
    }
    console.log('✅ Default products seeded.');
  }

  // 5. Seed Showroom
  const showroomCount = await prisma.showroom.count();
  if (showroomCount === 0) {
    await prisma.showroom.create({
      data: {
        name: 'TS Sports Digital Showroom',
        address: 'Online Global Digital Showroom & Distribution Network',
        city: 'Sialkot',
        country: 'Pakistan',
        phone: '+92 308 5410293',
        hours: '24/7 Digital Ordering & Customer Support',
        mapUrl: 'https://maps.google.com',
        mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d108342.345!2d74.52!3d32.49!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391eea2f!2sSialkot%2C%20Pakistan!5e0!3m2!1sen!2spk!4v1700000000000',
        isActive: true,
      },
    });
    console.log('✅ Showroom seeded.');
  }

  console.log('🎉 Seeding completed successfully!');
}

main()
  .catch((e) => {
    console.error('❌ Seeding error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
