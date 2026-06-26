"use client";

import ProductDetail from "@/components/shop/product/ProductDetail";
import { getProductBySlug } from "@/services/productServices";
import { useEffect, useState, use } from "react";

export default function Page({ params }) {
  const resolvedParams = use(params);
  const slug = resolvedParams.slug;
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!slug) return;
    const fetchProduct = async () => {
      try {
        setLoading(true);
        const data = await getProductBySlug(slug);
        setProduct(data);
      } catch (error) {
        console.error("Error fetching product detail: ", error);
      } finally {
        setLoading(false);
      }
    };
    fetchProduct();
  }, [slug]);

  if (loading) {
    return (
      <div className="container mx-auto px-6 py-20 text-center">
        <p className="text-gray-500 font-medium animate-pulse">Đang tải chi tiết sản phẩm...</p>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-6 py-10">
      <ProductDetail product={product} />
    </div>
  );
}