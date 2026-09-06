# TS Sports — Production Web Application & Admin CMS

![TS Sports Banner](public/images/socks_white.jpg)

TS Sports is a full-stack, production-ready web platform and CMS built for high-performance sports apparel, grip gear, and athletic equipment, backed by **Neon.tech Cloud PostgreSQL** and **Prisma ORM**.

---

## ⚡ Tech Stack

- **Frontend**: React 19, TypeScript, Vite, Tailwind CSS, Lucide Icons
- **Backend API**: Node.js, Express, JWT Authentication, Multer file handling
- **ORM**: Prisma ORM (`prisma/schema.prisma`)
- **Database Engine**: Neon.tech Cloud PostgreSQL
- **Deployment**: Vercel & GitHub Ready

---

## 🚀 Key Features

1. **Anti-Slip Grip Gear & Apparel Catalog**: Dynamic listing of products with categories, sizes, color variants, and material specifications.
2. **Direct WhatsApp Ordering System**: Instant WhatsApp order generator formatted with custom product details and size selection (`wa.me/923085410293`).
3. **Digital Showrooms Platform**: Dedicated 24/7 online virtual showroom portal.
4. **Leadership Profile**: Profile for Founder & CEO **Kashif Tufail**.
5. **Secure Admin Portal**:
   - JWT Auth protected routing.
   - Full CRUD for Products, Blogs, Digital Showrooms, Leadership, Suppliers, and Customer Inquiries.
   - Dynamic site setting management for WhatsApp, email (`sportspakistan10@gmail.com`), address, and meta tags.

---

## 🛠 Local Development Setup

### 1. Installation
```bash
npm install
```

### 2. Environment Setup
Create a `.env` file from `.env.example`:
```env
DATABASE_URL="postgresql://user:password@ep-xxxx.neon.tech/neondb?sslmode=require"
JWT_SECRET="tssports_production_super_secret_jwt_key_2026"
PORT=5000
VITE_API_URL="http://localhost:5000/api"
```

### 3. Prisma Migrations & Seed
```bash
npm run prisma:generate
npm run prisma:push
npm run prisma:seed
```

### 4. Run Development Servers
```bash
# Start Express Backend API (Port 5000)
npm run server

# Start React Vite Frontend (Port 5173)
npm run dev
```

---

## 📚 Database & Deployment Instructions

Refer to [`DEPLOYMENT.md`](./DEPLOYMENT.md) for full step-by-step instructions on setting up your Neon PostgreSQL database, running Prisma migrations, pushing to GitHub, and deploying to Vercel.
