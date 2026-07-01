"use client";

import { useState } from "react";
import { useAuth } from "@/contexts/AuthContext";
import Link from "next/link";

export default function AdminLoginPage() {
  const { loginAdmin } = useAuth();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    const result = await loginAdmin(username, password);
    if (!result.success) {
      setError(result.message || "Đăng nhập admin thất bại.");
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-950 font-['Be_Vietnam_Pro'] px-4 py-12">
      {/* Background Decorative Blur Circles */}
      <div className="absolute top-1/4 left-1/4 w-72 h-72 bg-blue-600/10 rounded-full blur-3xl pointer-events-none"></div>
      <div className="absolute bottom-1/4 right-1/4 w-72 h-72 bg-indigo-600/10 rounded-full blur-3xl pointer-events-none"></div>

      <div className="w-full max-w-md relative">
        {/* Glow effect border */}
        <div className="absolute -inset-0.5 bg-gradient-to-r from-blue-500 to-indigo-500 rounded-2xl blur-xs opacity-30"></div>
        
        {/* Main Card */}
        <div className="relative bg-slate-900/60 backdrop-blur-xl border border-slate-800 rounded-2xl p-8 shadow-2xl text-white">
          <div className="text-center mb-8">
            <span className="text-4xl">🛡️</span>
            <h2 className="text-2xl font-extrabold tracking-tight bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-indigo-300 mt-3">
              ADMIN PORTAL
            </h2>
            <p className="text-xs text-slate-400 mt-1">Đăng nhập vào hệ thống quản trị cửa hàng</p>
          </div>

          {error && (
            <div className="mb-6 bg-red-950/40 border border-red-500/30 p-3.5 rounded-xl text-xs text-red-400 flex items-start gap-2.5">
              <span>⚠️</span>
              <span>{error}</span>
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-5">
            <div>
              <label htmlFor="username" className="block text-[11px] uppercase tracking-wider font-bold text-slate-400 mb-1.5">
                Tên đăng nhập
              </label>
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="Nhập tài khoản Admin..."
                className="w-full bg-slate-950/50 border border-slate-800 rounded-xl px-4 py-3 text-sm text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-[11px] uppercase tracking-wider font-bold text-slate-400 mb-1.5">
                Mật khẩu
              </label>
              <input
                type="password"
                id="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Nhập mật khẩu..."
                className="w-full bg-slate-950/50 border border-slate-800 rounded-xl px-4 py-3 text-sm text-white placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500/50 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div className="flex items-center justify-between text-xs pt-1">
              <label className="flex items-center text-slate-400 cursor-pointer">
                <input
                  type="checkbox"
                  className="h-4 w-4 bg-slate-950 border-slate-800 rounded-md text-blue-500 focus:ring-blue-500/30 focus:ring-offset-slate-950 cursor-pointer"
                />
                <span className="ml-2 select-none">Duy trì đăng nhập</span>
              </label>
              <Link href="/" className="text-slate-400 hover:text-white transition-colors">
                Trở về Shop
              </Link>
            </div>

            <div className="pt-3">
              <button
                type="submit"
                disabled={loading}
                className="w-full flex justify-center py-3.5 px-4 border border-transparent rounded-xl text-sm font-bold text-white bg-blue-600 hover:bg-blue-500 active:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-slate-950 focus:ring-blue-500 shadow-lg shadow-blue-600/20 transition-all duration-200 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? "Đang xác thực hệ thống..." : "ĐĂNG NHẬP HỆ THỐNG"}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
