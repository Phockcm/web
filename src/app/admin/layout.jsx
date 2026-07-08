"use client";

import { useState } from "react";
import Sidebar from "@/components/admin/Sidebar";
import AdminHeader from "@/components/admin/AdminHeader";
import { usePathname } from "next/navigation";
import ProtectedRoute from "@/components/common/ProtectedRoute";
import { useAuth } from "@/contexts/AuthContext";
import Link from "next/link";

export default function AdminLayout({ children }) {
  const [sidebarOpen, setSidebarOpen] = useState(true);
  const pathname = usePathname();
  const { user } = useAuth();

  // Determine page title
  const getPageTitle = () => {
    if (pathname.includes("/admin/products")) return "Sản phẩm";
    if (pathname.includes("/admin/categories")) return "Danh mục";
    if (pathname.includes("/admin/orders")) return "Đơn hàng";
    if (pathname.includes("/admin/users")) return "Tài khoản";
    return "Dashboard";
  };

  // Check admin role once authenticated
  const isAdmin = user?.role === "admin";

  if (user && !isAdmin) {
    return (
      <div className="min-h-screen flex flex-col justify-center items-center bg-gray-50 p-6 text-center font-['Be_Vietnam_Pro']">
        <span className="text-5xl">🚫</span>
        <h1 className="text-2xl font-bold text-gray-800 mt-4">Truy cập bị từ chối</h1>
        <p className="text-gray-500 mt-2 max-w-sm">Bạn không có quyền truy cập trang quản trị này. Trang này chỉ dành cho tài khoản Admin.</p>
        <Link href="/" className="mt-6 px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-sm font-bold transition-colors no-underline">
          Quay lại Trang chủ
        </Link>
      </div>
    );
  }

  return (
    <ProtectedRoute>
      <div className="flex h-screen overflow-hidden bg-gray-50 font-['Be_Vietnam_Pro'] text-gray-800">
        {/* ===== SIDEBAR ===== */}
        <Sidebar isOpen={sidebarOpen} />

        {/* ===== MAIN CONTAINER ===== */}
        <div className="flex-1 flex flex-col overflow-hidden">
          {/* Top Header Section */}
          <div className="flex items-center bg-white border-b border-gray-200 h-16 flex-shrink-0">
            <button
              onClick={() => setSidebarOpen(!sidebarOpen)}
              className="px-4 h-full border-r border-gray-200 text-gray-550 hover:bg-gray-50 transition-colors focus:outline-none flex items-center justify-center text-lg shrink-0 cursor-pointer"
            >
              ☰
            </button>
            <div className="flex-1">
              <AdminHeader title={getPageTitle()} />
            </div>
          </div>

          {/* Scrollable Content */}
          <main className="flex-1 overflow-y-auto p-6 md:p-8 bg-gray-50">
            {children}
          </main>
        </div>
      </div>
    </ProtectedRoute>
  );
}

