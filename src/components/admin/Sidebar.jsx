"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { adminMenu } from "@/data/adminMenu";

export default function Sidebar({ isOpen }) {
  const pathname = usePathname();

  // Helper to map icons based on label (matching shop-admin.html emojis)
  const getIcon = (label) => {
    switch (label.toLowerCase()) {
      case "dashboard":
        return "🟦";
      case "products":
        return "📦";
      case "categories":
        return "🟨";
      case "orders":
        return "📋";
      default:
        return "⚙️";
    }
  };

  return (
    <aside 
      className={`bg-gray-900 text-white flex flex-col h-screen transition-all duration-300 z-30 shrink-0 sticky top-0 border-r border-gray-800 ${
        isOpen ? "w-64" : "w-0 overflow-hidden"
      }`}
    >
      <div className="px-6 py-5 border-b border-gray-750 flex items-center justify-between h-16 shrink-0">
        <span className="text-xl font-bold text-white">
          Shop<span className="text-blue-500">Khoa</span>
          <span className="text-gray-400 font-normal text-sm ml-1">Admin</span>
        </span>
      </div>
      
      <nav className="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
        {adminMenu && adminMenu.map((item, index) => {
          const isActive = pathname === item.href;
          return (
            <Link 
              key={index}
              href={item.href} 
              className={`flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm font-medium transition-all no-underline ${
                isActive 
                  ? "bg-blue-600 text-white" 
                  : "text-gray-400 hover:bg-white/8 hover:text-white"
              }`}
            >
              <span className="text-lg">{getIcon(item.label)}</span>
              <span>{item.label === "Products" ? "Sản phẩm" : item.label === "Categories" ? "Danh mục" : item.label === "Orders" ? "Đơn hàng" : item.label}</span>
            </Link>
          );
        })}
      </nav>

      <div className="px-4 py-4 border-t border-gray-800 shrink-0">
        <Link 
          href="/" 
          className="flex items-center justify-center gap-2 px-4 py-2.5 bg-gray-800 hover:bg-gray-700 text-gray-300 hover:text-white rounded-xl text-sm font-medium no-underline transition-colors duration-200"
        >
          <span className="text-base">🏠</span>
          <span>Về trang Shop</span>
        </Link>
      </div>
    </aside>
  );
}
