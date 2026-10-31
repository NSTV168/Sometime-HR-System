"use client";
import { useState } from "react";
export default function Home() {
 const [status] = useState("Starter พร้อมตั้งค่า Supabase");
 return <main><div className="brand">SOMETIME</div><h1>HUMAN RESOURCE</h1><p className="muted">Admin · Employee · Attendance · Payroll</p><div className="grid"><a className="panel portal admin" href="/admin">ADMIN PORTAL<p>จัดการพนักงาน กะงาน ลงเวลา และเงินเดือน</p></a><a className="panel portal staff" href="/staff">EMPLOYEE PORTAL<p>ตารางงาน ประวัติลงเวลา และสลิปเงินเดือน</p></a></div><section className="panel"><h2>สถานะระบบ</h2><p>{status}</p><p className="muted">ยังไม่เชื่อมต่อ Supabase จนกว่าจะตั้งค่า Environment Variables และรัน schema</p></section></main>;
}
