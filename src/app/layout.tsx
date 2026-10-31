import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = { title: "SOMETIME HR", description: "Restaurant HR, attendance and payroll" };
export default function RootLayout({children}:{children:React.ReactNode}) { return <html lang="th"><body>{children}</body></html>; }
