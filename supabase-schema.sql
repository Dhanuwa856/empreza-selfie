-- ============================================================================
-- RUN THIS ONCE IN YOUR SUPABASE SQL EDITOR (https://supabase.com/dashboard)
-- Sets up the 'selfies' table AND public access policies for 'empreza-media'
-- ============================================================================

-- 1. Create the 'selfies' table (stores the public 'empreza-media' image URL in image_data)
create table if not exists public.selfies (
  id uuid default gen_random_uuid() primary key,
  team_name text not null,
  event text not null,
  image_data text not null,
  status text default 'pending' check (status in ('pending', 'approved', 'rejected')),
  created_at timestamptz default now()
);

alter table public.selfies enable row level security;

drop policy if exists "Allow public insert" on public.selfies;
drop policy if exists "Allow public select" on public.selfies;
drop policy if exists "Allow public update" on public.selfies;
drop policy if exists "Allow public delete" on public.selfies;

create policy "Allow public insert" on public.selfies for insert with check (true);
create policy "Allow public select" on public.selfies for select using (true);
create policy "Allow public update" on public.selfies for update using (true);
create policy "Allow public delete" on public.selfies for delete using (true);

-- 2. Ensure 'empreza-media' bucket is public and allows image uploads
insert into storage.buckets (id, name, public)
values ('empreza-media', 'empreza-media', true)
on conflict (id) do update set public = true;

drop policy if exists "Allow public uploads to empreza-media" on storage.objects;
drop policy if exists "Allow public viewing of empreza-media" on storage.objects;

create policy "Allow public uploads to empreza-media"
on storage.objects for insert
with check (bucket_id = 'empreza-media');

create policy "Allow public viewing of empreza-media"
on storage.objects for select
using (bucket_id = 'empreza-media');
