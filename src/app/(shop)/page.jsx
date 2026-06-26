"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import ProductList from "@/components/shop/product/ProductList";
import { getNewProducts } from "@/services/productServices";

export default function ShopIndex() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchLatestProducts = async () => {
      try {
        setLoading(true);
        const data = await getNewProducts(8); // get top 8 new products
        setProducts(data);
      } catch (error) {
        console.error("Error fetching home page products:", error);
      } finally {
        setLoading(false);
      }
    };
    fetchLatestProducts();
  }, []);

  return (
    <div className="space-y-10 pb-16">
      {/* ===== BANNER ===== */}
      <section className="container mx-auto px-6 mt-6">
        <div className="bg-linear-to-r from-blue-600 to-indigo-700 text-white py-12 md:py-16 px-8 rounded-3xl text-center shadow-lg relative overflow-hidden">
          <div className="absolute inset-0 opacity-10 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-white via-transparent to-transparent"></div>
          <h2 className="text-3xl md:text-5xl font-extrabold tracking-tight">Big Sale 50%</h2>
          <p className="mt-3 text-base md:text-lg text-blue-100 font-medium">Giảm giá cực sốc hôm nay! Ưu đãi ngập tràn, mua ngay kẻo lỡ.</p>
          <div className="mt-6.5">
            <Link 
              href="/products" 
              className="inline-block px-6.5 py-3 bg-white text-blue-600 font-bold rounded-xl hover:bg-blue-50 transition-all duration-200 no-underline text-sm shadow-md"
            >
              Mua Sắm Ngay
            </Link>
          </div>
        </div>
      </section>

      {/* ===== CATEGORIES ===== */}
      <section className="container mx-auto px-6">
        <h3 className="text-xl font-bold text-gray-800 mb-6 flex items-center gap-2">
          <span>📁</span> Danh mục nổi bật
        </h3>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          <Link href="/products?category=phone" className="bg-white p-5 rounded-2xl border border-gray-150 text-center hover:bg-blue-50/50 hover:border-blue-300 transition-all duration-300 cursor-pointer no-underline block group">
            <div className="text-3xl mb-2.5 transition-transform duration-300 group-hover:scale-110">📱</div>
            <span className="font-semibold text-gray-700 text-sm">Điện thoại</span>
          </Link>
          <Link href="/products?category=laptop" className="bg-white p-5 rounded-2xl border border-gray-150 text-center hover:bg-blue-50/50 hover:border-blue-300 transition-all duration-300 cursor-pointer no-underline block group">
            <div className="text-3xl mb-2.5 transition-transform duration-300 group-hover:scale-110">💻</div>
            <span className="font-semibold text-gray-700 text-sm">Laptop</span>
          </Link>
          <Link href="/products?category=accessory" className="bg-white p-5 rounded-2xl border border-gray-150 text-center hover:bg-blue-50/50 hover:border-blue-300 transition-all duration-300 cursor-pointer no-underline block group">
            <div className="text-3xl mb-2.5 transition-transform duration-300 group-hover:scale-110">🎧</div>
            <span className="font-semibold text-gray-700 text-sm">Phụ kiện</span>
          </Link>
          <Link href="/products?category=fashion" className="bg-white p-5 rounded-2xl border border-gray-150 text-center hover:bg-blue-50/50 hover:border-blue-300 transition-all duration-300 cursor-pointer no-underline block group">
            <div className="text-3xl mb-2.5 transition-transform duration-300 group-hover:scale-110">👕</div>
            <span className="font-semibold text-gray-700 text-sm">Thời trang</span>
          </Link>
        </div>
      </section>

      {/* ===== NEW PRODUCTS ===== */}
      <section className="container mx-auto px-6">
        <div className="flex items-center justify-between mb-6">
          <h3 className="text-xl font-bold text-gray-800 flex items-center gap-2">
            <span>🔥</span> Sản phẩm mới nhất
          </h3>
          <Link href="/products" className="text-sm font-semibold text-blue-600 hover:underline">
            Xem tất cả
          </Link>
        </div>
        
        {loading ? (
          <p className="text-center py-10 text-gray-500 animate-pulse">Đang tải sản phẩm mới...</p>
        ) : (
          <ProductList products={products} />
        )}
      </section>

      {/* ===== SPECIAL PROMOTION SECTION ===== */}
      <section className="container mx-auto px-6">
        <div className="bg-gray-900 rounded-3xl p-8 md:p-12 flex flex-col md:flex-row items-center justify-between gap-8 text-white relative overflow-hidden">
          <div className="space-y-3.5 z-10 max-w-xl">
            <span className="text-xs uppercase font-extrabold tracking-wider text-blue-400 bg-blue-500/10 px-3.5 py-1 rounded-full">
              Khuyến mãi giới hạn
            </span>
            <h3 className="text-2xl md:text-3.5xl font-extrabold leading-tight">Nhận Voucher Giảm Thêm 100k Cho Khách Hàng Mới</h3>
            <p className="text-sm text-gray-400">Đăng ký tài khoản ShopX ngay hôm nay để nhận mã giảm giá 100.000đ áp dụng cho đơn hàng đầu tiên từ 500k.</p>
          </div>
          <div className="flex gap-3 shrink-0 z-10">
            <Link href="/register" className="px-5.5 py-3 bg-blue-600 text-white font-bold rounded-xl hover:bg-blue-700 transition-colors no-underline text-sm shadow-md">
              Đăng ký ngay
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}

