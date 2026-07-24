"use client";

import Link from "next/link";
import Image from "next/image";
import { useCart } from "@/contexts/CartContext";
import { useToast } from "@/contexts/ToastContext";

export default function ProductCard({ product }) {
  if (!product) return null;
  const { id, name, product_name, price, image, slug } = product;
  const displayName = name || product_name || "Sản phẩm";

  const { addToCart } = useCart();
  const { showToast } = useToast();

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

  const formattedPrice = typeof price === "number"
    ? price.toLocaleString("vi-VN")
    : price;

  const handleAddToCart = (e) => {
    e.preventDefault();
    e.stopPropagation();
    const result = addToCart(product, 1);
    if (result.success) {
      showToast(result.message, "success");
    } else {
      showToast(result.message, "error");
    }
  };

  return (
    <Link
      href={`/products/${slug}`}
      className="bg-white p-4 rounded-2xl border border-gray-150 shadow-xs hover:shadow-md transition-all duration-300 group block no-underline"
    >
      {/* Image Section */}
      <div className="relative w-full aspect-square mb-3 overflow-hidden rounded-xl bg-gray-50">
        <Image
          src={imageSrc}
          alt={displayName}
          fill
          className="object-cover group-hover:scale-105 transition-transform duration-300"
          unoptimized
        />
      </div>

      <h4 className="font-semibold text-gray-800 text-sm truncate leading-snug">
        {displayName}
      </h4>

      <div className="mt-2 flex flex-col gap-0.5">
        <span className="text-red-500 font-bold text-base">
          {formattedPrice}đ
        </span>
      </div>
      <button
        onClick={handleAddToCart}
        className="mt-3.5 w-full py-2 bg-blue-50 text-blue-600 hover:bg-blue-600 hover:text-white rounded-xl text-xs font-bold transition-colors duration-200 cursor-pointer"
      >
        Thêm vào giỏ
      </button>
    </Link>
  );
}
