"use client";

import { useState, useEffect, useMemo } from "react";
import Link from "next/link";
import { useCart } from "@/contexts/CartContext";
import { useToast } from "@/contexts/ToastContext";
import { getNewProducts, getHotProducts, getAllProducts } from "@/services/productServices";

// ───────────────────────────────────────────
// Utility: resolve image URL
// ───────────────────────────────────────────
function resolveImage(image) {
  if (!image) return "https://via.placeholder.com/220";
  if (image.startsWith("http://") || image.startsWith("https://")) return image;
  if (image.startsWith("products/")) {
    const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
    return `${backendUrl}/storage/${image}`;
  }
  return `/shop/images/${image}`;
}

// ───────────────────────────────────────────
// Utility: format price
// ───────────────────────────────────────────
function formatPrice(price) {
  return typeof price === "number" ? price.toLocaleString("vi-VN") + "đ" : price;
}

// ───────────────────────────────────────────
// Seeded pseudo-random (stable per product id)
// so discount % won't flicker on re-render
// ───────────────────────────────────────────
function seededDiscount(seed) {
  // Discount range: 20% – 55%
  const discounts = [20, 25, 28, 30, 33, 35, 38, 40, 42, 45, 48, 50, 55];
  return discounts[seed % discounts.length];
}

// ───────────────────────────────────────────
// Mini ProductCard shared by all sections
// ───────────────────────────────────────────
function MiniCard({ product, discountPct = null }) {
  const { addToCart } = useCart();
  const { showToast } = useToast();

  const originalPrice = product.price;
  const salePrice = discountPct
    ? Math.round(originalPrice * (1 - discountPct / 100))
    : null;

  const handleAdd = (e) => {
    e.preventDefault();
    e.stopPropagation();
    const result = addToCart(product, 1);
    if (result.success) showToast(result.message, "success");
    else showToast(result.message, "error");
  };

  return (
    <Link
      href={`/products/${product.slug}`}
      className="bg-white rounded-2xl border border-gray-150 shadow-xs hover:shadow-md transition-all duration-300 group block no-underline overflow-hidden"
    >
      {/* Discount badge */}
      {discountPct && (
        <div className="absolute top-3 left-3 z-10 bg-red-500 text-white text-[10px] font-extrabold px-2 py-0.5 rounded-full">
          -{discountPct}%
        </div>
      )}

      {/* Image */}
      <div className="relative w-full aspect-square overflow-hidden bg-gray-50">
        <img
          src={resolveImage(product.image)}
          alt={product.product_name || product.name}
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
        />
      </div>

      {/* Info */}
      <div className="p-3.5">
        <h4 className="font-semibold text-gray-800 text-sm truncate leading-snug">
          {product.product_name || product.name}
        </h4>

        {salePrice ? (
          <div className="mt-1.5 flex flex-col gap-0.5">
            <span className="text-red-500 font-extrabold text-base">{formatPrice(salePrice)}</span>
            <span className="text-gray-400 text-xs line-through">{formatPrice(originalPrice)}</span>
          </div>
        ) : (
          <span className="mt-1.5 block text-red-500 font-bold text-base">{formatPrice(originalPrice)}</span>
        )}

        <button
          onClick={handleAdd}
          className="mt-3 w-full py-2 bg-blue-50 text-blue-600 hover:bg-blue-600 hover:text-white rounded-xl text-xs font-bold transition-colors duration-200 cursor-pointer"
        >
          Thêm vào giỏ
        </button>
      </div>
    </Link>
  );
}

// ───────────────────────────────────────────
// Skeleton loader card
// ───────────────────────────────────────────
function SkeletonCard() {
  return (
    <div className="bg-white rounded-2xl border border-gray-150 overflow-hidden animate-pulse">
      <div className="w-full aspect-square bg-gray-100" />
      <div className="p-3.5 space-y-2">
        <div className="h-3.5 bg-gray-100 rounded-full w-4/5" />
        <div className="h-4 bg-gray-100 rounded-full w-1/2" />
        <div className="h-8 bg-gray-100 rounded-xl mt-3" />
      </div>
    </div>
  );
}

// ───────────────────────────────────────────
// Section header
// ───────────────────────────────────────────
function SectionHeader({ icon, title, link, linkLabel = "Xem tất cả" }) {
  return (
    <div className="flex items-center justify-between mb-6">
      <h3 className="text-xl font-bold text-gray-800 flex items-center gap-2">
        <span>{icon}</span> {title}
      </h3>
      {link && (
        <Link href={link} className="text-sm font-semibold text-blue-600 hover:underline no-underline">
          {linkLabel} →
        </Link>
      )}
    </div>
  );
}

// ───────────────────────────────────────────
// Main Page
// ───────────────────────────────────────────
export default function ShopIndex() {
  const [newProducts, setNewProducts] = useState([]);
  const [hotProducts, setHotProducts] = useState([]);
  const [saleProducts, setSaleProducts] = useState([]);
  const [loading, setLoading] = useState({ new: true, hot: true, sale: true });

  useEffect(() => {
    // New products
    getNewProducts(8)
      .then((data) => setNewProducts(Array.isArray(data) ? data : data?.data || []))
      .catch(() => { })
      .finally(() => setLoading((p) => ({ ...p, new: false })));

    // Hot products (most viewed / featured by backend)
    getHotProducts(6)
      .then((data) => setHotProducts(Array.isArray(data) ? data : data?.data || []))
      .catch(() => { })
      .finally(() => setLoading((p) => ({ ...p, hot: false })));

    // Sale products: fetch all, shuffle deterministically, pick 8
    getAllProducts()
      .then((data) => {
        const all = Array.isArray(data) ? data : data?.data || [];
        // Filter active products only
        const active = all.filter((p) => p.status === 1 || p.status === "1");
        // Sort by id to get stable order, then pick every Nth
        const sorted = [...active].sort((a, b) => a.id - b.id);
        // Interleaved pick: every 3rd starting from index 1
        const picked = [];
        for (let i = 0; i < sorted.length && picked.length < 8; i++) {
          if (i % 3 === 1) picked.push(sorted[i]);
        }
        // Fallback if less than 8
        if (picked.length < 8) {
          for (let i = 0; i < sorted.length && picked.length < 8; i++) {
            if (!picked.find((p) => p.id === sorted[i].id)) {
              picked.push(sorted[i]);
            }
          }
        }
        setSaleProducts(picked.slice(0, 8));
      })
      .catch(() => { })
      .finally(() => setLoading((p) => ({ ...p, sale: false })));
  }, []);

  // Stable discount per product id
  const saleProductsWithDiscount = useMemo(
    () => saleProducts.map((p) => ({ ...p, discountPct: seededDiscount(p.id) })),
    [saleProducts]
  );

  return (
    <div className="space-y-12 pb-20">

      {/* ===== HERO BANNER ===== */}
      <section className="container mx-auto px-6 mt-6">
        <div className="bg-linear-to-r from-blue-600 to-indigo-700 text-white py-12 md:py-16 px-8 rounded-3xl text-center shadow-lg relative overflow-hidden">
          <div className="absolute inset-0 opacity-10 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-white via-transparent to-transparent" />
          <h2 className="text-3xl md:text-5xl font-extrabold tracking-tight">Big Sale 50%</h2>
          <p className="mt-3 text-base md:text-lg text-blue-100 font-medium">
            Giảm giá cực sốc hôm nay! Ưu đãi ngập tràn, mua ngay kẻo lỡ.
          </p>
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
          <span>📁</span> Danh mục
        </h3>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[
            { href: "/products?category=phone", icon: "📱", label: "Điện thoại" },
            { href: "/products?category=laptop", icon: "💻", label: "Laptop" },
            { href: "/products?category=accessory", icon: "🎧", label: "Phụ kiện" },
            { href: "/products?category=fashion", icon: "👕", label: "Thời trang" },
          ].map((cat) => (
            <Link
              key={cat.href}
              href={cat.href}
              className="bg-white p-5 rounded-2xl border border-gray-150 text-center hover:bg-blue-50/50 hover:border-blue-300 transition-all duration-300 cursor-pointer no-underline block group"
            >
              <div className="text-3xl mb-2.5 transition-transform duration-300 group-hover:scale-110">{cat.icon}</div>
              <span className="font-semibold text-gray-700 text-sm">{cat.label}</span>
            </Link>
          ))}
        </div>
      </section>

      {/* ===== HOT / MOST VIEWED PRODUCTS ===== */}
      <section className="container mx-auto px-6">
        <SectionHeader icon="👁️" title="Sản phẩm nổi bật" link="/products" />
        {loading.hot ? (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-4">
            {Array.from({ length: 6 }).map((_, i) => <SkeletonCard key={i} />)}
          </div>
        ) : hotProducts.length === 0 ? (
          <p className="text-center py-10 text-gray-400">Không có dữ liệu</p>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-4">
            {hotProducts.map((p) => (
              <div key={p.id} className="relative">
                <MiniCard product={p} />
              </div>
            ))}
          </div>
        )}
      </section>

      {/* ===== FLASH SALE / DISCOUNT SECTION ===== */}
      <section className="container mx-auto px-6">
        {/* Section header with countdown style */}
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-3">
            <div className="flex items-center gap-2">
              <span className="text-2xl">⚡</span>
              <h3 className="text-xl font-bold text-gray-800">Flash Sale</h3>
            </div>
            <div className="flex items-center gap-1.5 bg-red-500 text-white text-xs font-bold px-3 py-1 rounded-full">
              <span className="animate-pulse">🔥</span>
              <span>Giảm đến 55%</span>
            </div>
          </div>
          <Link href="/products" className="text-sm font-semibold text-blue-600 hover:underline no-underline">
            Xem tất cả →
          </Link>
        </div>

        {/* Orange gradient top bar */}
        <div className="w-full h-1.5 bg-linear-to-r from-orange-400 via-red-500 to-pink-500 rounded-full mb-5" />

        {loading.sale ? (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
            {Array.from({ length: 8 }).map((_, i) => <SkeletonCard key={i} />)}
          </div>
        ) : saleProductsWithDiscount.length === 0 ? (
          <p className="text-center py-10 text-gray-400">Không có sản phẩm khuyến mãi</p>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
            {saleProductsWithDiscount.map((p) => (
              <div key={p.id} className="relative">
                <MiniCard product={p} discountPct={p.discountPct} />
              </div>
            ))}
          </div>
        )}
      </section>

      {/* ===== NEW PRODUCTS ===== */}
      <section className="container mx-auto px-6">
        <SectionHeader icon="🔥" title="Sản phẩm mới nhất" link="/products" />
        {loading.new ? (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
            {Array.from({ length: 8 }).map((_, i) => <SkeletonCard key={i} />)}
          </div>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
            {newProducts.map((p) => (
              <div key={p.id} className="relative">
                <MiniCard product={p} />
              </div>
            ))}
          </div>
        )}
      </section>

      {/* ===== CTA BANNER ===== */}
      <section className="container mx-auto px-6">
        <div className="bg-gray-900 rounded-3xl p-8 md:p-12 flex flex-col md:flex-row items-center justify-between gap-8 text-white relative overflow-hidden">
          <div className="space-y-3.5 z-10 max-w-xl">
            <span className="text-xs uppercase font-extrabold tracking-wider text-blue-400 bg-blue-500/10 px-3.5 py-1 rounded-full">
              Khuyến mãi giới hạn
            </span>
            <h3 className="text-2xl md:text-3xl font-extrabold leading-tight">
              Nhận Voucher Giảm Thêm 100k Cho Khách Hàng Mới
            </h3>
            <p className="text-sm text-gray-400">
              Đăng ký tài khoản Shop Khoa ngay hôm nay để nhận mã giảm giá 100.000đ áp dụng cho đơn hàng đầu tiên từ 500k.
            </p>
          </div>
          <div className="flex gap-3 shrink-0 z-10">
            <Link
              href="/register"
              className="px-5.5 py-3 bg-blue-600 text-white font-bold rounded-xl hover:bg-blue-700 transition-colors no-underline text-sm shadow-md"
            >
              Đăng ký ngay
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
