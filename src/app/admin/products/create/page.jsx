"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import ProductForm from "@/components/admin/ProductForm";
import { createProduct } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

export default function AddProductPage() {
  const router = useRouter();
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  // Fetch categories on page load
  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const catData = await getAllCategories();
        setCategories(catData || []);
      } catch (error) {
        console.error("Error loading categories:", error);
      } finally {
        setLoading(false);
      }
    };
    fetchCategories();
  }, []);

  const handleCreateProduct = async (formData, selectedFile) => {
    try {
      const data = new FormData();
      data.append("product_name", formData.product_name);
      data.append("slug", formData.slug);
      data.append("price", formData.price);
      data.append("qty", formData.qty);
      data.append("cat_id", formData.cat_id);
      data.append("status", formData.status);
      data.append("brand_id", formData.brand_id || 1);
      
      if (formData.description) {
        data.append("description", formData.description);
      }
      
      if (selectedFile) {
        data.append("image", selectedFile);
      }

      await createProduct(data);
      alert("Thêm sản phẩm mới thành công!");
      router.push("/admin/products");
    } catch (error) {
      console.error("Error creating product:", error);
      alert("Đã xảy ra lỗi khi thêm sản phẩm. Vui lòng kiểm tra lại!");
      throw error;
    }
  };

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Header section with back navigation */}
      <div className="flex items-center justify-between bg-white p-6 rounded-2xl border border-gray-150 shadow-xs">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Thêm sản phẩm mới</h2>
          <p className="text-xs text-gray-400 mt-1">Điền đầy đủ thông tin để tạo sản phẩm mới trong hệ thống.</p>
        </div>
        <Link href="/admin/products" className="shrink-0 px-4 py-2 text-xs font-semibold text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-xl transition-all no-underline">
          ← Quay lại
        </Link>
      </div>

      {loading ? (
        <div className="bg-white p-10 rounded-2xl border border-gray-150 text-center text-gray-500">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-3"></div>
          Đang tải danh mục...
        </div>
      ) : (
        <ProductForm 
          categories={categories} 
          onSubmit={handleCreateProduct} 
          isEdit={false} 
        />
      )}
    </div>
  );
}
