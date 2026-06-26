import Menu from "@/components/shop/Menu";
import Link from "next/link";

export default function Header() {
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
          <Link href="/login" className="text-sm text-gray-600 hover:text-blue-600 no-underline font-semibold transition-colors">
            Đăng nhập
          </Link>
          <Link 
            href="/cart" 
            className="flex items-center gap-1.5 px-3.5 py-2 bg-blue-50 text-blue-600 hover:bg-blue-100 rounded-xl text-sm font-bold no-underline transition-all duration-200"
          >
            <span>🛒</span>
            <span className="bg-blue-600 text-white text-[10px] w-4.5 h-4.5 rounded-full flex items-center justify-center font-bold">0</span>
          </Link>
        </div>
      </div>
    </nav>
  );
}