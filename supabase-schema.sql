-- Esquema inicial orientativo para Supabase. Revisar políticas antes de producción.
create table if not exists public.couples (
  id uuid primary key default gen_random_uuid(),
  invite_code text unique not null,
  member_a uuid references auth.users(id) on delete cascade,
  member_b uuid references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);
create table if not exists public.drawings (
  id uuid primary key default gen_random_uuid(),
  couple_id uuid not null references public.couples(id) on delete cascade,
  author_id uuid not null references auth.users(id) on delete cascade,
  title text not null default 'Un dibujo bonito',
  document_json jsonb not null default '{}'::jsonb,
  preview_path text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.couples enable row level security;
alter table public.drawings enable row level security;
-- Las políticas de producción deben validar membresía en couples para cada SELECT/INSERT/UPDATE/DELETE.
-- No habilitar acceso público a las tablas ni al bucket de dibujos.
