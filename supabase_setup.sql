-- Run this in Supabase SQL Editor once.
-- Stores one JSON blob per workspace (ontrack/sim/qg).

create table if not exists public.app_workspace_state (
  workspace text primary key,
  state_json jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.app_workspace_state enable row level security;

-- For now: allow read/write with anon key from the app.
-- Tighten this later when moving to authenticated users + per-user access rules.
drop policy if exists "app_workspace_state_read_all" on public.app_workspace_state;
create policy "app_workspace_state_read_all"
on public.app_workspace_state
for select
to anon, authenticated
using (true);

drop policy if exists "app_workspace_state_write_all" on public.app_workspace_state;
create policy "app_workspace_state_write_all"
on public.app_workspace_state
for insert
to anon, authenticated
with check (true);

drop policy if exists "app_workspace_state_update_all" on public.app_workspace_state;
create policy "app_workspace_state_update_all"
on public.app_workspace_state
for update
to anon, authenticated
using (true)
with check (true);
