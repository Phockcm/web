"use client";

import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useCart } from "@/contexts/CartContext";
import { useAuth } from "@/contexts/AuthContext";

function resolveImage(image) {
  if (!image) return "https://via.placeholder.com/80";
  if (image.startsWith("http://") || image.startsWith("https://")) return image;
  if (image.startsWith("products/")) {
    const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
    return `${backendUrl}/storage/${image}`;
  }
  return `/shop/images/${image}`;
}

export default function CartPage() {
  const { cartItems, cartTotal, updateQuantity, removeFromCart, clearCart } = useCart();
  const { isAuthenticated } = useAuth();
  const router = useRouter();
  const [showLoginGate, setShowLoginGate] = useState(false);

  const handleCheckout = () => {
    if (!isAuthenticated) {
      setShowLoginGate(true);
    } else {
      router.push("/checkout");
    }
  };

  const isEmpty = cartItems.length === 0;

  return (
    <>
      {/* Login Gate Modal */}
      {showLoginGate && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm">
          <div className="bg-white rounded-3xl shadow-2xl p-8 mx-4 max-w-sm w-full text-center">
            <div className="text-5xl mb-4">🔐</div>
            <h2 className="text-xl font-extrabold text-gray-800 mb-2">Bạn chưa đăng nhập</h2>
            <p className="text-sm text-gray-500 mb-6">
              Vui lòng đăng nhập hoặc tạo tài khoản để tiến hành thanh toán.
            </p>
            <div className="flex flex-col gap-3">
              <Link
                href="/login"
                className="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition-colors no-underline block"
              >
                Đăng nhập
              </Link>
              <Link
                href="/register"
                className="w-full py-3 border-2 border-blue-600 text-blue-600 hover:bg-blue-50 font-bold rounded-xl text-sm transition-colors no-underline block"
              >
                Đăng ký tài khoản
              </Link>
              <button
                onClick={() => setShowLoginGate(false)}
                className="text-sm text-gray-400 hover:text-gray-600 cursor-pointer mt-1"
              >
                Tiếp tục mua sắm
              </button>
            </div>
          </div>
        </div>
      )}

      <div className="page-heading" id="top">
        <div className="container mx-auto px-6 py-8">
          <h2 className="text-3xl font-extrabold text-gray-900">Giỏ hàng của bạn</h2>
          <span className="text-sm text-gray-500 mt-1 block">
            {isEmpty ? "Giỏ hàng đang trống" : `${cartItems.length} loại sản phẩm`}
          </span>
        </div>
      </div>

      <section className="section py-4 pb-16 font-['Be_Vietnam_Pro']">
        <div className="container mx-auto px-6">
          {isEmpty ? (
            <div className="text-center py-24 bg-white rounded-3xl border border-gray-150 shadow-xs">
              <div className="text-6xl mb-4">🛒</div>
              <h3 className="text-xl font-bold text-gray-700 mb-2">Giỏ hàng đang trống</h3>
              <p className="text-gray-400 text-sm mb-6">
                Bạn chưa thêm sản phẩm nào vào giỏ hàng.
              </p>
              <Link
                href="/products"
                className="inline-block px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition-colors no-underline"
              >
                Khám phá sản phẩm
              </Link>
            </div>
          ) : (
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              {/* Left: Cart Items */}
              <div className="lg:col-span-2 space-y-4">
                {/* Header Row */}
                <div className="bg-white rounded-2xl border border-gray-150 shadow-xs overflow-hidden">
                  <div className="flex items-center justify-between px-6 py-4 border-b border-gray-100">
                    <h3 className="font-bold text-gray-800">Sản phẩm ({cartItems.length})</h3>
                    <button
                      onClick={clearCart}
                      className="text-xs text-red-500 hover:text-red-700 font-semibold cursor-pointer"
                    >
                      Xóa tất cả
                    </button>
                  </div>

                  {/* Items */}
                  <div className="divide-y divide-gray-50">
                    {cartItems.map((item) => (
                      <div key={item.id} className="flex items-center gap-4 px-6 py-4">
                        {/* Image */}
                        <div className="w-20 h-20 rounded-xl overflow-hidden border border-gray-100 bg-gray-50 shrink-0">
                          <img
                            src={resolveImage(item.image)}
                            alt={item.product_name}
                            className="w-full h-full object-cover"
                          />
                        </div>

                        {/* Info */}
                        <div className="flex-1 min-w-0">
                          <Link
                            href={`/products/${item.slug}`}
                            className="font-semibold text-gray-800 text-sm truncate block hover:text-blue-600 no-underline transition-colors"
                          >
                            {item.product_name}
                          </Link>
                          <span className="text-red-500 font-bold text-sm mt-0.5 block">
                            {typeof item.price === "number"
                              ? item.price.toLocaleString("vi-VN") + "đ"
                              : item.price}
                          </span>
                          <span className="text-xs text-gray-400">Còn {item.qty} trong kho</span>
                        </div>

                        {/* Quantity Control */}
                        <div className="flex items-center border border-gray-250 rounded-xl overflow-hidden h-9 w-24 shrink-0">
                          <button
                            onClick={() => updateQuantity(item.id, item.quantity - 1)}
                            disabled={item.quantity <= 1}
                            className="w-8 h-full hover:bg-gray-50 font-bold transition-colors border-r border-gray-250 cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed text-sm"
                          >
                            -
                          </button>
                          <span className="flex-1 text-center text-sm font-semibold text-gray-700">
                            {item.quantity}
                          </span>
                          <button
                            onClick={() => updateQuantity(item.id, item.quantity + 1)}
                            disabled={item.quantity >= item.qty}
                            className="w-8 h-full hover:bg-gray-50 font-bold transition-colors border-l border-gray-250 cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed text-sm"
                          >
                            +
                          </button>
                        </div>

                        {/* Item total */}
                        <div className="text-right shrink-0 w-24">
                          <span className="font-bold text-gray-800 text-sm">
                            {(item.price * item.quantity).toLocaleString("vi-VN")}đ
                          </span>
                        </div>

                        {/* Remove */}
                        <button
                          onClick={() => removeFromCart(item.id)}
                          className="text-gray-300 hover:text-red-500 transition-colors text-lg cursor-pointer shrink-0"
                          title="Xóa sản phẩm"
                        >
                          ✕
                        </button>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Continue shopping */}
                <Link
                  href="/products"
                  className="inline-flex items-center gap-2 text-sm text-blue-600 hover:text-blue-800 font-semibold no-underline transition-colors"
                >
                  ← Tiếp tục mua sắm
                </Link>
              </div>

              {/* Right: Order Summary */}
              <div className="lg:col-span-1">
                <div className="bg-white rounded-2xl border border-gray-150 shadow-xs p-6 sticky top-24">
                  <h3 className="font-bold text-gray-800 text-lg mb-5">Tóm tắt đơn hàng</h3>

                  <div className="space-y-3 text-sm">
                    {cartItems.map((item) => (
                      <div key={item.id} className="flex justify-between text-gray-600">
                        <span className="truncate max-w-[55%]">
                          {item.product_name} <span className="text-gray-400">×{item.quantity}</span>
                        </span>
                        <span className="font-medium text-gray-800">
                          {(item.price * item.quantity).toLocaleString("vi-VN")}đ
                        </span>
                      </div>
                    ))}
                  </div>

                  <div className="border-t border-gray-100 mt-5 pt-4">
                    <div className="flex justify-between text-sm text-gray-500 mb-2">
                      <span>Tạm tính</span>
                      <span>{cartTotal.toLocaleString("vi-VN")}đ</span>
                    </div>
                    <div className="flex justify-between text-sm text-gray-500 mb-4">
                      <span>Phí vận chuyển</span>
                      <span className="text-green-600 font-semibold">Miễn phí</span>
                    </div>
                    <div className="flex justify-between font-extrabold text-gray-900 text-lg border-t border-gray-100 pt-4">
                      <span>Tổng cộng</span>
                      <span className="text-red-500">{cartTotal.toLocaleString("vi-VN")}đ</span>
                    </div>
                  </div>

                  <button
                    onClick={handleCheckout}
                    className="w-full mt-6 py-3.5 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition-colors cursor-pointer"
                  >
                    Tiến hành thanh toán →
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      </section>
    </>
  );
}
