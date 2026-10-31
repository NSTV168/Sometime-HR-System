# SOMETIME HR — Starter

Next.js + Supabase starter for restaurant HR operations.

## Current repository status
This commit is a starter foundation, not a production deployment. Admin and Employee routes, multilingual UI, payroll workflow, QR/PIN attendance and biometric provider integration still require implementation/configuration and testing. Do not treat camera capture as face recognition.

## Setup
1. Create a Supabase project.
2. Run `supabase/schema.sql` in Supabase SQL Editor.
3. Copy `.env.example` to `.env.local` and set Supabase URL and public anon/publishable key.
4. Keep `SUPABASE_SERVICE_ROLE_KEY` and face-provider secrets server-side only.
5. Run `npm install` then `npm run dev`.

## Deployment
Use Cloudflare Workers with the OpenNext adapter for Next.js. Configure environment variables as Worker secrets. Do not deploy until auth/RLS policies, access controls, Thai payroll rules and biometric consent/retention have been reviewed.

## Safety and compliance
Biometric processing requires explicit informed consent, a lawful basis, retention/deletion controls, restricted access and a non-biometric alternative. GPS should be requested only at attendance time. Payroll calculations are draft estimates and require review against current Thai law and employment agreements.
