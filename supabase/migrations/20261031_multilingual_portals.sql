-- SOMETIME HR: pay groups A/B and server-managed attendance PIN metadata
create table if not exists public.pay_groups (
 id uuid primary key default gen_random_uuid(),
 code text not null unique check (code in ('A','B')),
 name text not null,
 active boolean not null default true,
 created_at timestamptz not null default now()
);
insert into public.pay_groups(code,name) values ('A','Group A'),('B','Group B') on conflict(code) do nothing;
create table if not exists public.employee_pay_groups (
 id uuid primary key default gen_random_uuid(),
 employee_id uuid not null references public.employees(id) on delete cascade,
 pay_group_id uuid not null references public.pay_groups(id),
 effective_from date not null,
 effective_to date,
 created_at timestamptz not null default now(),
 check(effective_to is null or effective_to >= effective_from)
);
create index if not exists employee_pay_groups_employee_idx on public.employee_pay_groups(employee_id);
create unique index if not exists employee_one_active_pay_group_idx on public.employee_pay_groups(employee_id) where effective_to is null;
create table if not exists public.employee_attendance_pins (
 employee_id uuid primary key references public.employees(id) on delete cascade,
 pin_hash text not null,
 active boolean not null default true,
 updated_at timestamptz not null default now()
);
create table if not exists public.biometric_consents (
 id uuid primary key default gen_random_uuid(),
 employee_id uuid not null references public.employees(id) on delete cascade,
 status text not null check(status in ('active','withdrawn','expired')),
 consent_text_version text not null,
 consented_at timestamptz not null default now(),
 expires_at timestamptz,
 withdrawn_at timestamptz
);
alter table public.payroll_runs add column if not exists pay_group_id uuid references public.pay_groups(id);
alter table public.payroll_runs add column if not exists pay_date date;
alter table public.payroll_runs add column if not exists cutoff_date date;
alter table public.pay_groups enable row level security;
alter table public.employee_pay_groups enable row level security;
alter table public.employee_attendance_pins enable row level security;
alter table public.biometric_consents enable row level security;
create policy "authenticated read active pay groups" on public.pay_groups for select to authenticated using(active=true);
create policy "employees read own pay group" on public.employee_pay_groups for select to authenticated using(exists(select 1 from public.employees e where e.id=employee_id and e.auth_user_id=auth.uid()));
create policy "employees read own biometric consent" on public.biometric_consents for select to authenticated using(exists(select 1 from public.employees e where e.id=employee_id and e.auth_user_id=auth.uid()));
-- PIN hashes are intentionally inaccessible to client roles; use a server-only service-role API.
