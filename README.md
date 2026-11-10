# EMPREZA — Victory Selfie Upload & Password-Protected Admin Portal

## Pre-Configured Settings
- **Supabase Project URL**: ``
- **Supabase Storage Bucket**: `empreza-media` (Photos are uploaded directly to `empreza-media/selfies/...` and the public URL is saved to the `selfies` table)
- **Default Admin Password**: `empreza2026` (Can be changed anytime inside the Admin Settings drawer)
- **Language**: 100% English UI

## Quick Setup (2 Minutes)
1. Open your **Supabase SQL Editor** and run the contents of `supabase-schema.sql`. This ensures the `selfies` table and `empreza-media` storage policies allow public image uploads and public URL viewing.
2. Deploy `index.html` to Vercel or Netlify.
3. Paste `main-site-embed.html` into your main website (`https://empreza.vercel.app/`).
