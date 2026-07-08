"use client";

import { useState, useEffect } from "react";
import { useRouter, useParams } from "next/navigation";
import Link from "next/link";
import ProductForm from "@/components/admin/ProductForm";
import { getProductById, updateProduct } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

export default function EditProductPage() {
  const router = useRouter();
  const params = useParams();
  const id = params?.id;

  const [product, setProduct] = useState(null);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    if (!id) return;

    const fetchData = async () => {
      try {
        const [prodData, catData] = await Promise.all([
          getProductById(id),
          getAllCategories(),
        ]);
        
        if (prodData) {
          setProduct(prodData);
        } else {
          setError("Không tìm thấy thông tin sản phẩm.");
        }
        setCategories(catData || []);
      } catch (err) {
        console.error("Error loading edit product data:", err);
        setError("Có lỗi xảy ra khi tải thông tin sản phẩm.");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [id]);

  const handleUpdateProduct = async (formData, selectedFile) => {
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
      } else {
        data.append("description", "");
      }
      
      if (selectedFile) {
        data.append("image", selectedFile);
      }

      await updateProduct(id, data);
      alert("Cập nhật sản phẩm thành công!");
      router.push("/admin/products");
    } catch (err) {
      console.error("Error updating product:", err);
      alert("Đã xảy ra lỗi khi cập nhật sản phẩm. Vui lòng kiểm tra lại!");
      throw err;
    }
  };

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Header section with back navigation */}
      <div className="flex items-center justify-between bg-white p-6 rounded-2xl border border-gray-150 shadow-xs">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Cập nhật sản phẩm</h2>
          <p className="text-xs text-gray-400 mt-1">Chỉnh sửa thông tin chi tiết của sản phẩm.</p>
        </div>
        <Link href="/admin/products" className="shrink-0 px-4 py-2 text-xs font-semibold text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-xl transition-all no-underline">
          ← Quay lại
        </Link>
      </div>

      {loading ? (
        <div className="bg-white p-10 rounded-2xl border border-gray-150 text-center text-gray-500">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-3"></div>
          Đang tải thông tin sản phẩm...
        </div>
      ) : error ? (
        <div className="bg-red-50 text-red-600 p-6 rounded-2xl border border-red-200 text-center">
          <p className="font-semibold">{error}</p>
          <Link href="/admin/products" className="mt-4 inline-block text-xs font-semibold underline text-red-700 hover:text-red-800">
            Quay lại danh sách sản phẩm
          </Link>
        </div>
      ) : (
        <ProductForm 
          initialValues={product}
          categories={categories} 
          onSubmit={handleUpdateProduct} 
          isEdit={true} 
        />
      )}
    </div>
  );
}
