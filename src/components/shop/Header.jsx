"use client";

import Menu from "@/components/shop/Menu";
import Link from "next/link";
import { useAuth } from "@/contexts/AuthContext";
import { useCart } from "@/contexts/CartContext";

export default function Header() {
  const { user, isAuthenticated, logout } = useAuth();
  const { cartCount } = useCart();

  return (
    <nav className="bg-white shadow sticky top-0 z-40 border-b border-gray-100">
      <div className="container mx-auto px-6 flex justify-between items-center py-4">
        <Link href="/" className="text-2xl font-bold text-blue-600 no-underline">
          Shop <span className="text-gray-800">Khoa</span>
        </Link>
        
        <div className="hidden md:flex">
          <Menu />
        </div>
        
        <div className="flex items-center gap-4">
          {isAuthenticated ? (
            <div className="flex items-center gap-3">
              <Link href="/account" className="flex items-center gap-2 no-underline group cursor-pointer">
                <div className="w-8 h-8 rounded-full overflow-hidden border border-gray-200 bg-gray-50 flex items-center justify-center font-bold text-xs text-blue-600 transition-all group-hover:border-blue-400">
                  {user?.image ? (
                    <img 
                      src={user.image.startsWith("http") ? user.image : `${process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000"}/storage/${user.image}`} 
                      alt={user.name || user.username} 
                      className="w-full h-full object-cover" 
                    />
                  ) : (
                    (user?.name || user?.username || "U").substring(0, 1).toUpperCase()
                  )}
                </div>
                <span className="text-sm font-semibold text-gray-700 group-hover:text-blue-600 transition-colors">
                  Hi, {user.name || user.username}
                </span>
              </Link>
              {user?.role === "admin" && (
                <Link 
                  href="/admin/products"
                  className="text-xs text-blue-600 hover:text-blue-800 font-bold border border-blue-200 px-2.5 py-1.5 rounded-lg hover:bg-blue-50 transition-all no-underline"
                >
                  Quản trị
                </Link>
              )}
              <button 
                onClick={logout}
                className="text-xs text-red-500 hover:text-red-700 font-bold border border-red-200 px-2.5 py-1.5 rounded-lg hover:bg-red-50 transition-all cursor-pointer"
              >
                Đăng xuất
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-3">
              <Link href="/login" className="text-sm text-gray-600 hover:text-blue-600 no-underline font-semibold transition-colors">
                Đăng nhập
              </Link>
              <span className="text-gray-300">|</span>
              <Link href="/register" className="text-sm text-gray-600 hover:text-blue-600 no-underline font-semibold transition-colors">
                Đăng ký
              </Link>
              <span className="text-gray-300">|</span>
              <Link href="/login/admin" className="text-sm text-amber-605 hover:text-amber-800 no-underline font-semibold transition-colors">
                Admin
              </Link>
            </div>
          )}
          
          <Link 
            href="/cart" 
            className="relative flex items-center gap-1.5 px-3.5 py-2 bg-blue-50 text-blue-600 hover:bg-blue-100 rounded-xl text-sm font-bold no-underline transition-all duration-200"
          >
            <span>🛒</span>
            {cartCount > 0 && (
              <span className="absolute -top-1.5 -right-1.5 bg-red-500 text-white text-[10px] min-w-[18px] h-[18px] rounded-full flex items-center justify-center font-bold px-1">
                {cartCount > 99 ? "99+" : cartCount}
              </span>
            )}
          </Link>
        </div>
      </div>
    </nav>
  );
}