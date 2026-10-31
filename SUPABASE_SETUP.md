# Supabase setup — SOMETIME HR

1. Open your Supabase project → SQL Editor.
2. Run `supabase/schema.sql` once on a new empty project.
3. Run `supabase/migrations/20261031_multilingual_portals.sql` next.
4. In Project Settings → API, copy the Project URL and anon/publishable key into your deployment platform's variables. Keep the service-role key server-only.
5. In Authentication, create test admin and employee accounts. Assign roles through a trusted admin-only process; never allow a public signup form to choose its own role.
6. Create/verify branch records and geofence coordinates before enabling attendance.

The current schema is a starter and requires a security review of every RLS policy and API route before real employee data is imported. Test with separate admin and employee accounts. Do not paste keys into chat.
