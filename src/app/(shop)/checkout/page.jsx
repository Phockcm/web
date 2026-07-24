"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useCart } from "@/contexts/CartContext";
import { useAuth } from "@/contexts/AuthContext";
import { useToast } from "@/contexts/ToastContext";
import ProtectedRoute from "@/components/common/ProtectedRoute";
import { saveOrder } from "@/services/cartServices";

function resolveImage(image) {
  if (!image) return "https://via.placeholder.com/80";
  if (image.startsWith("http://") || image.startsWith("https://")) return image;
  if (image.startsWith("products/")) {
    const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
    return `${backendUrl}/storage/${image}`;
  }
  return `/shop/images/${image}`;
}

export default function CheckoutPage() {
  const { cartItems, cartTotal, updateQuantity, removeFromCart, clearCart } = useCart();
  const { user } = useAuth();
  const { showToast } = useToast();
  const router = useRouter();

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [orderSuccess, setOrderSuccess] = useState(false);
  const [localItems, setLocalItems] = useState([]);

  // Sync localItems with cartItems for local editable copy
  useEffect(() => {
    setLocalItems(cartItems.map((item) => ({ ...item })));
  }, [cartItems]);

  // Form state — pre-fill from user account
  const [form, setForm] = useState({
    name: "",
    phone: "",
    address: "",
    note: "",
  });

  useEffect(() => {
    if (user) {
      setForm((prev) => ({
        ...prev,
        name: user.name || "",
        phone: user.phone || "",
        address: user.address || "",
      }));
    }
  }, [user]);

  // Compute local total (for realtime update while editing in checkout)
  const localTotal = localItems.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );

  const handleLocalQty = (productId, newQty) => {
    setLocalItems((prev) =>
      prev.map((item) => {
        if (item.id !== productId) return item;
        const clamped = Math.max(1, Math.min(newQty, item.qty));
        return { ...item, quantity: clamped };
      })
    );
    // Also update global cart
    updateQuantity(productId, newQty);
  };

  const handleLocalRemove = (productId) => {
    setLocalItems((prev) => prev.filter((item) => item.id !== productId));
    removeFromCart(productId);
  };

  const handleFormChange = (key, value) => {
    setForm((prev) => ({ ...prev, [key]: value }));
  };

  const handlePlaceOrder = async () => {
    if (localItems.length === 0) {
      showToast("Giỏ hàng trống, không thể đặt hàng!", "error");
      return;
    }
    if (!form.name.trim()) {
      showToast("Vui lòng nhập họ và tên người nhận!", "error");
      return;
    }
    if (!form.phone.trim()) {
      showToast("Vui lòng nhập số điện thoại!", "error");
      return;
    }
    if (!form.address.trim()) {
      showToast("Vui lòng nhập địa chỉ giao hàng!", "error");
      return;
    }

    setIsSubmitting(true);
    try {
      const orderData = {
        user_id: user.id,
        items: localItems.map((item) => ({
          product_id: item.id,
          qty: item.quantity,
          price: item.price,
        })),
      };

      await saveOrder(orderData);
      clearCart();
      setOrderSuccess(true);
      showToast("Đặt hàng thành công! Cảm ơn bạn đã mua sắm. 🎉", "success", 5000);
    } catch (err) {
      console.error("Order error:", err);
      showToast("Đặt hàng thất bại. Vui lòng thử lại!", "error");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (orderSuccess) {
    return (
      <ProtectedRoute>
        <div className="min-h-screen flex items-center justify-center py-20 font-['Be_Vietnam_Pro']">
          <div className="text-center max-w-md mx-auto px-6">
            <div className="text-7xl mb-6 animate-bounce">🎉</div>
            <h2 className="text-3xl font-extrabold text-gray-800 mb-3">Đặt hàng thành công!</h2>
            <p className="text-gray-500 mb-8 leading-relaxed">
              Cảm ơn bạn đã mua sắm tại Shop Khoa. Chúng tôi sẽ liên hệ xác nhận đơn hàng sớm nhất!
            </p>
            <div className="flex flex-col sm:flex-row gap-3 justify-center">
              <Link
                href="/products"
                className="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition-colors no-underline"
              >
                Tiếp tục mua sắm
              </Link>
              <Link
                href="/"
                className="px-6 py-3 border border-gray-250 hover:bg-gray-50 text-gray-700 font-bold rounded-xl text-sm transition-colors no-underline"
              >
                Về trang chủ
              </Link>
            </div>
          </div>
        </div>
      </ProtectedRoute>
    );
  }

  return (
    <ProtectedRoute>
      <div className="page-heading" id="top">
        <div className="container mx-auto px-6 py-8">
          <h2 className="text-3xl font-extrabold text-gray-900">Thanh toán</h2>
          <span className="text-sm text-gray-500 mt-1 block">Kiểm tra đơn hàng và xác nhận thông tin giao hàng</span>
        </div>
      </div>

      <section className="section py-4 pb-16 font-['Be_Vietnam_Pro']">
        <div className="container mx-auto px-6">
          {localItems.length === 0 ? (
            <div className="text-center py-24 bg-white rounded-3xl border border-gray-150 shadow-xs">
              <div className="text-6xl mb-4">🛒</div>
              <h3 className="text-xl font-bold text-gray-700 mb-2">Giỏ hàng trống</h3>
              <p className="text-gray-400 text-sm mb-6">Vui lòng thêm sản phẩm trước khi thanh toán.</p>
              <Link
                href="/products"
                className="inline-block px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-sm transition-colors no-underline"
              >
                Khám phá sản phẩm
              </Link>
            </div>
          ) : (
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">

              {/* Left: Delivery Info + Items */}
              <div className="lg:col-span-2 space-y-5">

                {/* Delivery Info Form */}
                <div className="bg-white rounded-2xl border border-gray-150 shadow-xs p-6">
                  <h3 className="font-bold text-gray-800 text-base mb-5">📦 Thông tin giao hàng</h3>
                  <div className="space-y-4">
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-semibold text-gray-650">Họ và tên *</label>
                        <input
                          type="text"
                          value={form.name}
                          onChange={(e) => handleFormChange("name", e.target.value)}
                          placeholder="Nguyễn Văn A"
                          className="border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all"
                        />
                      </div>
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-semibold text-gray-650">Số điện thoại *</label>
                        <input
                          type="tel"
                          value={form.phone}
                          onChange={(e) => handleFormChange("phone", e.target.value)}
                          placeholder="0987654321"
                          className="border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all"
                        />
                      </div>
                    </div>
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-semibold text-gray-650">Địa chỉ giao hàng *</label>
                      <input
                        type="text"
                        value={form.address}
                        onChange={(e) => handleFormChange("address", e.target.value)}
                        placeholder="Số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố"
                        className="border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all"
                      />
                    </div>
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-semibold text-gray-650">Ghi chú đơn hàng (tuỳ chọn)</label>
                      <textarea
                        value={form.note}
                        onChange={(e) => handleFormChange("note", e.target.value)}
                        placeholder="Ví dụ: Giao giờ hành chính, gọi trước khi giao..."
                        rows={2}
                        className="border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all resize-none"
                      />
                    </div>
                  </div>
                </div>

                {/* Items list — editable */}
                <div className="bg-white rounded-2xl border border-gray-150 shadow-xs overflow-hidden">
                  <div className="px-6 py-4 border-b border-gray-100">
                    <h3 className="font-bold text-gray-800 text-base">🛍️ Sản phẩm đặt mua ({localItems.length})</h3>
                  </div>
                  <div className="divide-y divide-gray-50">
                    {localItems.map((item) => (
                      <div key={item.id} className="flex items-center gap-4 px-6 py-4">
                        <div className="w-16 h-16 rounded-xl overflow-hidden border border-gray-100 bg-gray-50 shrink-0">
                          <img
                            src={resolveImage(item.image)}
                            alt={item.product_name}
                            className="w-full h-full object-cover"
                          />
                        </div>

                        <div className="flex-1 min-w-0">
                          <p className="font-semibold text-gray-800 text-sm truncate">{item.product_name}</p>
                          <p className="text-red-500 font-bold text-sm mt-0.5">
                            {typeof item.price === "number"
                              ? item.price.toLocaleString("vi-VN") + "đ"
                              : item.price}
                          </p>
                        </div>

                        {/* Quantity control */}
                        <div className="flex items-center border border-gray-250 rounded-xl overflow-hidden h-9 w-24 shrink-0">
                          <button
                            onClick={() => handleLocalQty(item.id, item.quantity - 1)}
                            disabled={item.quantity <= 1}
                            className="w-8 h-full hover:bg-gray-50 font-bold transition-colors border-r border-gray-250 cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed text-sm"
                          >
                            -
                          </button>
                          <span className="flex-1 text-center text-sm font-semibold text-gray-700">
                            {item.quantity}
                          </span>
                          <button
                            onClick={() => handleLocalQty(item.id, item.quantity + 1)}
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

                        <button
                          onClick={() => handleLocalRemove(item.id)}
                          className="text-gray-300 hover:text-red-500 transition-colors text-lg cursor-pointer shrink-0"
                        >
                          ✕
                        </button>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* Right: Payment Summary */}
              <div className="lg:col-span-1">
                <div className="bg-white rounded-2xl border border-gray-150 shadow-xs p-6 sticky top-24">
                  <h3 className="font-bold text-gray-800 text-lg mb-5">💳 Tổng thanh toán</h3>

                  <div className="space-y-2.5 text-sm">
                    {localItems.map((item) => (
                      <div key={item.id} className="flex justify-between text-gray-600">
                        <span className="truncate max-w-[55%]">
                          {item.product_name}{" "}
                          <span className="text-gray-400">×{item.quantity}</span>
                        </span>
                        <span className="font-medium text-gray-800">
                          {(item.price * item.quantity).toLocaleString("vi-VN")}đ
                        </span>
                      </div>
                    ))}
                  </div>

                  <div className="border-t border-gray-100 mt-5 pt-4 space-y-2">
                    <div className="flex justify-between text-sm text-gray-500">
                      <span>Tạm tính</span>
                      <span>{localTotal.toLocaleString("vi-VN")}đ</span>
                    </div>
                    <div className="flex justify-between text-sm text-gray-500">
                      <span>Phí vận chuyển</span>
                      <span className="text-green-600 font-semibold">Miễn phí</span>
                    </div>
                    <div className="flex justify-between font-extrabold text-gray-900 text-xl border-t border-gray-100 pt-3 mt-2">
                      <span>Tổng cộng</span>
                      <span className="text-red-500">{localTotal.toLocaleString("vi-VN")}đ</span>
                    </div>
                  </div>

                  <div className="mt-4 bg-blue-50 rounded-xl px-4 py-3 text-xs text-blue-700 font-medium">
                    💳 Thanh toán khi nhận hàng (COD)
                  </div>

                  <button
                    onClick={handlePlaceOrder}
                    disabled={isSubmitting || localItems.length === 0}
                    className="w-full mt-5 py-3.5 bg-blue-600 hover:bg-blue-700 disabled:bg-gray-300 disabled:cursor-not-allowed text-white font-bold rounded-xl text-sm transition-colors cursor-pointer"
                  >
                    {isSubmitting ? "Đang xử lý..." : "🎯 Đặt hàng ngay"}
                  </button>

                  <Link
                    href="/cart"
                    className="block text-center mt-3 text-xs text-gray-400 hover:text-gray-600 no-underline"
                  >
                    ← Quay lại giỏ hàng
                  </Link>
                </div>
              </div>
            </div>
          )}
        </div>
      </section>
    </ProtectedRoute>
  );
}
