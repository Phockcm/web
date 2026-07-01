"use client";

import { useAuth } from "@/contexts/AuthContext";
import { useRouter, usePathname } from "next/navigation";
import { useEffect } from "react";

export default function ProtectedRoute({ children }) {
  const { isAuthenticated, loading } = useAuth();
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    if (!loading && !isAuthenticated) {
      if (pathname && pathname.startsWith("/admin")) {
        router.push("/login/admin");
      } else {
        router.push("/login");
      }
    }
  }, [isAuthenticated, loading, pathname, router]);

  if (loading) {
    return (
      <div className="min-h-screen flex flex-col justify-center items-center bg-gray-50">
        <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-blue-600"></div>
        <p className="mt-4 text-sm text-gray-500 font-medium animate-pulse">Đang tải...</p>
      </div>
    );
  }

  if (!isAuthenticated) {
    return null; // Prevents flashing protected content before redirect
  }

  return <>{children}</>;
}
