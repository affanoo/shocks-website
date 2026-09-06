# TS Sports Deployment & Production Setup Guide (Neon.tech PostgreSQL + Prisma + Vercel)

This document provides complete instructions for deploying the **TS Sports** full-stack web application using:
- **Frontend**: React + TypeScript + Vite (Deployed on Vercel)
- **Backend API**: Node.js + Express + Prisma ORM
- **Database**: Neon.tech Cloud PostgreSQL (Free Tier)
- **Source Control**: GitHub repository

---

## 🛠️ Step 1: Create a Neon.tech Cloud PostgreSQL Database

1. Sign up or log into [https://neon.tech](https://neon.tech).
2. Click **Create Project**.
3. Name your project (e.g., `ts-sports-db`).
4. Select a region near your primary users (e.g. `eu-central-1` or `ap-southeast-1`).
5. Once created, copy your **PostgreSQL Connection String**:
   ```
   postgresql://user:password@ep-xxxx.neon.tech/neondb?sslmode=require
   ```

---

## ⚙️ Step 2: Configure Environment Variables

Create a `.env` file in the root folder of the project:

```env
# Neon PostgreSQL Database Connection URL
DATABASE_URL="postgresql://user:password@ep-xxxx.neon.tech/neondb?sslmode=require"

# JWT Token Secret Key for Admin Authentication
JWT_SECRET="tssports_production_super_secret_jwt_key_2026"

# Express API Port
PORT=5000

# Frontend API URL
VITE_API_URL="http://localhost:5000/api"
```

---

## 🗄️ Step 3: Run Prisma Database Migrations & Seed Data

1. **Generate Prisma Client**:
   ```bash
   npm run prisma:generate
   ```

2. **Push Schema to Neon PostgreSQL**:
   ```bash
   npm run prisma:push
   ```

3. **Seed Database (Admin account & TS Sports default content)**:
   ```bash
   npm run prisma:seed
   ```

> **Default Admin Credentials**:
> - Email: `admin@tssports.pk`
> - Password: `Password123!`

---

## 🚀 Step 4: Run Locally

1. **Start Express Backend**:
   ```bash
   npm run server
   ```
   *(Backend will start on `http://localhost:5000/api`)*

2. **Start Vite Frontend**:
   ```bash
   npm run dev
   ```
   *(Frontend will start on `http://localhost:5173/`)*

---

## 🐙 Step 5: Push Project to GitHub

1. Initialize git repository (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Migrated TS Sports to Neon PostgreSQL + Prisma ORM + Express API"
   ```

2. Create a new repository on GitHub named `ts-sports-website`.

3. Push code to GitHub:
   ```bash
   git remote add origin https://github.com/your-username/ts-sports-website.git
   git branch -M main
   git push -u origin main
   ```

---

## ☁️ Step 6: Deploy to Vercel

1. Log into [https://vercel.com](https://vercel.com).
2. Click **Add New** -> **Project**.
3. Import your `ts-sports-website` repository from GitHub.
4. Set Framework Preset to **Vite**.
5. Under **Environment Variables**, add:
   - `DATABASE_URL` = `postgresql://user:password@ep-xxxx.neon.tech/neondb?sslmode=require`
   - `JWT_SECRET` = `tssports_production_super_secret_jwt_key_2026`
   - `VITE_API_URL` = `/api`
6. Click **Deploy**.

---

## 📌 Features Included in TS Sports:
- **Brand**: TS Sports (Formerly TS Socks)
- **WhatsApp Order Flow**: `03085410293` (`wa.me/923085410293`)
- **Contact Email**: `sportspakistan10@gmail.com`
- **CEO**: Kashif Tufail
- **Digital Showroom**: 24/7 Virtual Online Showroom
- **Database Engine**: Neon Cloud PostgreSQL
- **ORM**: Prisma ORM
