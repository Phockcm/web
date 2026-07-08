import { useAuth } from "@/contexts/AuthContext";
import Link from "next/link";

export default function AdminHeader({ title = "Dashboard" }) {
  const { user, logout } = useAuth();

  // Map avatar image
  let avatarSrc = "";
  if (user?.image) {
    avatarSrc = user.image.startsWith("http")
      ? user.image
      : `http://127.0.0.1:8000/storage/${user.image}`;
  }

  return (
    <header className="bg-white border-b border-gray-200 px-8 py-4 flex items-center justify-between flex-shrink-0 h-16">
      <h1 className="text-lg font-semibold text-gray-800">{title}</h1>
      <div className="flex items-center gap-4">
        {/* Avatar & Info linked to shop account page */}
        {user && (
          <Link href="/account" className="flex items-center gap-2 no-underline group cursor-pointer">
            <div className="w-9 h-9 rounded-full overflow-hidden border border-gray-200 bg-gray-50 flex items-center justify-center font-bold text-xs text-blue-650 transition-all group-hover:border-blue-500">
              {user.image ? (
                <img src={avatarSrc} alt={user.name} className="w-full h-full object-cover" />
              ) : (
                (user.name || user.username || "A").substring(0, 1).toUpperCase()
              )}
            </div>
            <span className="text-sm font-semibold text-gray-700 group-hover:text-blue-650 transition-colors">
              {user.name || user.username}
            </span>
          </Link>
        )}
        
        {/* Logout Button */}
        <button
          onClick={logout}
          className="text-xs text-red-500 hover:text-red-700 font-bold border border-red-200 px-2.5 py-1.5 rounded-lg hover:bg-red-50 transition-all cursor-pointer bg-white"
        >
          Đăng xuất
        </button>
      </div>
    </header>
  );
}
