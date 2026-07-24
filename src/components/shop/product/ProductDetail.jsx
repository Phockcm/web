"use client";

import { useState } from "react";
import Link from "next/link";
import { useCart } from "@/contexts/CartContext";
import { useToast } from "@/contexts/ToastContext";
import { useRouter } from "next/navigation";

export default function ProductDetail({ product }) {
  const [quantity, setQuantity] = useState(1);
  const { addToCart } = useCart();
  const { showToast } = useToast();
  const router = useRouter();

  if (!product) {
    return (
      <div className="text-center py-20 bg-white border border-gray-150 rounded-2xl">
        <span className="text-4xl">🔍</span>
        <p className="text-gray-400 mt-2">Không tìm thấy sản phẩm</p>
        <Link href="/products" className="inline-block mt-4 text-blue-600 hover:underline">
          Quay lại trang sản phẩm
        </Link>
      </div>
    );
  }

  const { id, name, product_name, price, image, category, description, qty } = product;
  const displayName = name || product_name || "Sản phẩm";
  const stock = Number(qty ?? 9999);

  // Format price
  const formattedPrice = typeof price === "number"
    ? price.toLocaleString("vi-VN") + "đ"
    : price;

  // Resolve image source
  let imageSrc = "https://via.placeholder.com/200";
  if (image) {
    if (image.startsWith("http://") || image.startsWith("https://")) {
      imageSrc = image;
    } else if (image.startsWith("products/")) {
      const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
      imageSrc = `${backendUrl}/storage/${image}`;
    } else {
      imageSrc = `/shop/images/${image}`;
    }
  }

  const handleAddToCart = () => {
    const result = addToCart(product, quantity);
    if (result.success) {
      showToast(result.message, "success");
    } else {
      showToast(result.message, "error");
    }
  };

  const handleBuyNow = () => {
    const result = addToCart(product, quantity);
    if (result.success) {
      showToast("Đang chuyển đến trang thanh toán...", "info");
      router.push("/cart");
    } else {
      showToast(result.message, "error");
    }
  };

  return (
    <div className="bg-white rounded-3xl border border-gray-150 shadow-xs p-6 md:p-10">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-10">

        {/* Left Column: Image */}
        <div className="bg-gray-50 rounded-2xl overflow-hidden aspect-square border border-gray-100 flex items-center justify-center">
          <img
            src={imageSrc}
            alt={displayName}
            className="w-full h-full object-cover max-h-[500px]"
            loading="eager"
          />
        </div>

        {/* Right Column: Content */}
        <div className="flex flex-col justify-between">
          <div className="space-y-4">
            <span className="inline-block text-xs uppercase font-bold tracking-wider text-blue-650 bg-blue-50 px-3 py-1 rounded-full">
              {category || "General"}
            </span>

            <h1 className="text-2xl md:text-3xl font-extrabold text-gray-800 leading-tight">
              {displayName}
            </h1>

            {/* Stars UI */}
            <div className="flex items-center gap-1.5">
              <div className="flex text-yellow-400 text-sm">
                <span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
              </div>
              <span className="text-xs text-gray-400 font-medium">(4.8 / 5 - 120 đánh giá)</span>
            </div>

            <div className="border-t border-b border-gray-100 py-4.5 my-2">
              <span className="text-3xl font-extrabold text-red-500">{formattedPrice}</span>
              <span className="text-xs text-gray-400 ml-2.5 line-through">
                {typeof price === "number" ? (price * 1.25).toLocaleString("vi-VN") + "đ" : ""}
              </span>
            </div>

            <p className="text-sm text-gray-500 leading-relaxed">
              {description || "Sản phẩm chính hãng với thiết kế hiện đại, cấu hình mạnh mẽ đáp ứng tốt mọi tác vụ của bạn. Bảo hành 12 tháng chính hãng và miễn phí giao hàng toàn quốc."}
            </p>
          </div>

          <div className="space-y-6 mt-8">
            {/* Quantity Selector */}
            <div className="flex items-center gap-3.5">
              <span className="text-xs font-semibold text-gray-650">Số lượng:</span>
              <div className="flex items-center border border-gray-250 rounded-xl overflow-hidden h-10 w-28 shrink-0">
                <button
                  onClick={() => setQuantity(Math.max(1, quantity - 1))}
                  className="w-8.5 h-full hover:bg-gray-50 font-bold transition-colors border-r border-gray-250 cursor-pointer"
                >
                  -
                </button>
                <span className="flex-1 text-center text-sm font-semibold text-gray-700">
                  {quantity}
                </span>
                <button
                  onClick={() => setQuantity(Math.min(stock, quantity + 1))}
                  disabled={quantity >= stock}
                  className="w-8.5 h-full hover:bg-gray-50 font-bold transition-colors border-l border-gray-250 cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed"
                >
                  +
                </button>
              </div>
              <span className={`text-xs font-medium ${stock <= 5 ? "text-red-500" : "text-gray-400"}`}>
                {stock <= 0
                  ? "Hết hàng"
                  : stock <= 5
                  ? `⚠️ Chỉ còn ${stock} sản phẩm`
                  : `Còn ${stock} sản phẩm`}
              </span>
            </div>

            {/* Action Buttons */}
            {stock <= 0 ? (
              <div className="h-12 rounded-xl bg-gray-100 text-gray-400 font-bold flex items-center justify-center text-sm">
                Hết hàng
              </div>
            ) : (
              <div className="grid grid-cols-2 gap-4">
                <button
                  onClick={handleAddToCart}
                  className="h-12 rounded-xl border-2 border-blue-600 text-blue-600 font-bold hover:bg-blue-50 transition-colors text-sm cursor-pointer"
                >
                  Thêm vào giỏ
                </button>
                <button
                  onClick={handleBuyNow}
                  className="h-12 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-bold transition-colors text-sm cursor-pointer"
                >
                  Mua ngay
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
