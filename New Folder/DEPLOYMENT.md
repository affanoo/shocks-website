# TS Sports Full Production Architecture & Deployment Guide

This guide will walk you through deploying the TS Sports platform using your chosen modern stack:

1. **Vercel** (Frontend Hosting - React/Vite)
2. **Render** (Backend Hosting - Node.js/Express)
3. **Neon.tech** (Database - PostgreSQL)
4. **Cloudinary** (Media Storage - Product Images)
5. **Hostinger** (Domain Management - DNS)

---

## ☁️ 1. Set up Cloudinary (Media Storage)
*Your database shouldn't store large image files. Cloudinary will host and serve your product images lightning fast.*

1. Go to [Cloudinary](https://cloudinary.com/) and create a free account.
2. Once logged in, go to your **Dashboard**.
3. Locate your **Product Environment Credentials**:
   - Cloud Name
   - API Key
   - API Secret
4. Keep these handy; you will need them when setting up Render.

---

## 🗄️ 2. Set up Neon (Database)
*Your serverless PostgreSQL database where products, blogs, and settings are stored.*

1. Log into [Neon.tech](https://neon.tech/).
2. Create a new project (e.g., `ts-sports-db`).
3. Select a region close to your primary users.
4. Once created, copy the **Connection String** from the dashboard. It looks like this:
   `postgresql://user:password@ep-xxxx.neon.tech/neondb?sslmode=require`

---

## ⚙️ 3. Deploy the Backend to Render
*This hosts your Express server which processes data, auth, and talks to the database.*

1. Push your latest code (with Cloudinary integration) to GitHub.
2. Log into [Render](https://render.com/).
3. Click **New +** and select **Web Service**.
4. Connect your GitHub account and select the `shocks-website` repository.
5. **Configuration Details**:
   - **Name**: `ts-sports-backend` (or similar)
   - **Environment**: Node
   - **Build Command**: `npm install && npx prisma generate`
   - **Start Command**: `npm run server`
6. Scroll down to **Environment Variables** and add the following:
   - `DATABASE_URL` = `[Your Neon Connection String]`
   - `CLOUDINARY_CLOUD_NAME` = `[Your Cloudinary Cloud Name]`
   - `CLOUDINARY_API_KEY` = `[Your Cloudinary API Key]`
   - `CLOUDINARY_API_SECRET` = `[Your Cloudinary API Secret]`
   - `JWT_SECRET` = `[Create a random long string of characters for security]`
7. Click **Create Web Service**.
8. Once the deployment finishes, copy the URL Render gives you (e.g., `https://ts-sports-backend.onrender.com`). **This is your `API_URL`**.

---

## 🗃️ 4. Seed the Database
*Now that the backend is live, we need to push the Prisma schema to Neon and seed the initial admin account.*

To do this from your local machine, open your terminal inside the project folder:
1. Create a `.env` file locally and paste your `DATABASE_URL` inside it.
2. Run the database migration: `npx prisma db push`
3. Run the database seeder: `npm run prisma:seed`

*This creates the default Admin account: `admin@tssports.pk` / `Password123!`*

---

## 🚀 5. Deploy the Frontend to Vercel
*This hosts your beautiful React website.*

1. Log into [Vercel](https://vercel.com/).
2. Click **Add New** -> **Project**.
3. Import your `shocks-website` repository from GitHub.
4. **Configuration Details**:
   - **Framework Preset**: Vite
   - **Root Directory**: `./` (leave default)
5. Expand **Environment Variables** and add:
   - `VITE_API_URL` = `https://ts-sports-backend.onrender.com/api` *(Make sure to use the actual URL you got from Render!)*
6. Click **Deploy**.
7. Once deployed, you will receive a Vercel staging URL (e.g. `https://ts-sports-website.vercel.app`).

---

## 🌐 6. Connect your Domain on Hostinger
*Point your custom domain (e.g., tssports.pk) to Vercel.*

1. In Vercel, go to your Project Settings -> **Domains**.
2. Add your custom domain name (e.g., `www.yourdomain.com`).
3. Vercel will provide you with DNS records (usually an `A` record and a `CNAME` record).
4. Log into [Hostinger](https://hpanel.hostinger.com/).
5. Go to your **DNS Zone Editor**.
6. Delete any existing A or CNAME records that conflict (like default parking pages).
7. Add the records Vercel provided you.
8. Wait a few minutes (up to an hour) for DNS to propagate. Vercel will automatically generate a free SSL certificate for you.

---

### 🎉 You're Live! 
Your customers can now browse your fast React frontend, interact with your secure Render backend, view lightning-fast Cloudinary images, and your data safely lives in Neon!
