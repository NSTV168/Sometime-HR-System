# Cloudflare setup — SOMETIME HR

Cloudflare is not connected to this ChatGPT session. Complete these steps in your Cloudflare account:

1. Open Workers & Pages → Create → Connect to Git → select `NSTV168/Sometime-HR-System` and branch `main`.
2. Use the repository's `wrangler.jsonc` and OpenNext adapter. Build command: `npx opennextjs-cloudflare build`; deploy command: `npx opennextjs-cloudflare deploy`.
3. Add Worker secrets/variables: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `QR_ATTENDANCE_SECRET`. Add `FACE_PROVIDER_URL` and `FACE_PROVIDER_API_KEY` only if/when a vetted face provider is selected.
4. Never put service-role, QR signing or provider keys in `NEXT_PUBLIC_*` variables, source files, GitHub commits, or chat.
5. Deploy to a temporary `workers.dev` address first. Verify login, role separation, branch access, QR/PIN, GPS and payroll with test accounts before attaching a custom domain.

Do not enable production attendance or payroll until the SQL migrations, RLS policies, legal payroll rules, privacy notice, employee consent and backup/restore process have been reviewed.
