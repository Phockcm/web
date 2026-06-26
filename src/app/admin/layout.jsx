"use client";

import { useState } from "react";
import Sidebar from "@/components/admin/Sidebar";
import AdminHeader from "@/components/admin/AdminHeader";
import { usePathname } from "next/navigation";

export default function AdminLayout({ children }) {
  const [sidebarOpen, setSidebarOpen] = useState(true);
  const pathname = usePathname();

  // Determine page title
  const getPageTitle = () => {
    if (pathname.includes("/admin/products")) return "Sản phẩm";
    if (pathname.includes("/admin/categories")) return "Danh mục";
    if (pathname.includes("/admin/orders")) return "Đơn hàng";
    return "Dashboard";
  };

  return (
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
  );
}

