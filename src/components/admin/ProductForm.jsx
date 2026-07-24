"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import Input from "@/components/common/Input";
import Button from "@/components/common/Button";

const convertToSlug = (text) => 
  text.toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/đ/g, "d")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");

export default function ProductForm({ initialValues, onSubmit, categories = [], isEdit = false }) {
  const defaultValues = {
    product_name: "",
    slug: "",
    price: "",
    qty: "",
    cat_id: "",
    status: 1,
    description: "",
    brand_id: 1,
  };

  const [formData, setFormData] = useState(defaultValues);
  const [selectedFile, setSelectedFile] = useState(null);
  const [imagePreview, setImagePreview] = useState("");
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Sync state if initialValues are fetched asynchronously
  useEffect(() => {
    if (initialValues) {
      setFormData((prev) => ({
        ...prev,
        ...initialValues,
      }));

      // Set initial image preview if available
      if (initialValues.image) {
        const img = initialValues.image;
        if (img.startsWith("http://") || img.startsWith("https://")) {
          setImagePreview(img);
        } else if (img.startsWith("products/")) {
          const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
          setImagePreview(`${backendUrl}/storage/${img}`);
        } else {
          setImagePreview(`/shop/images/${img}`);
        }
      }
    }
  }, [initialValues]);

  // Handle name input change to auto-generate slug
  const handleNameChange = (e) => {
    const name = e.target.value;
    setFormData((prev) => ({
      ...prev,
      product_name: name,
      slug: convertToSlug(name),
    }));

    if (errors.product_name) {
      setErrors((prev) => ({ ...prev, product_name: "" }));
    }
    if (errors.slug) {
      setErrors((prev) => ({ ...prev, slug: "" }));
    }
  };

  // Handle normal input changes
  const handleChange = (key, value) => {
    setFormData((prev) => ({
      ...prev,
      [key]: value,
    }));

    if (errors[key]) {
      setErrors((prev) => ({ ...prev, [key]: "" }));
    }
  };

  // Handle file input changes for image preview
  const handleFileChange = (e) => {
    const file = e.target.files?.[0] || null;
    setSelectedFile(file);
    if (file) {
      const previewUrl = URL.createObjectURL(file);
      setImagePreview(previewUrl);
    } else {
      // Revert to original image if cancelled
      if (initialValues?.image) {
        const img = initialValues.image;
        if (img.startsWith("http://") || img.startsWith("https://")) {
          setImagePreview(img);
        } else if (img.startsWith("products/")) {
          const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
          setImagePreview(`${backendUrl}/storage/${img}`);
        } else {
          setImagePreview(`/shop/images/${img}`);
        }
      } else {
        setImagePreview("");
      }
    }
  };

  // Form validation logic
  const validateForm = () => {
    const newErrors = {};

    if (!formData.product_name || !formData.product_name.trim()) {
      newErrors.product_name = "Tên sản phẩm không được để trống.";
    }

    if (!formData.slug || !formData.slug.trim()) {
      newErrors.slug = "Đường dẫn tĩnh (Slug) không được để trống.";
    }

    if (formData.price === "" || formData.price === null || formData.price === undefined) {
      newErrors.price = "Giá bán không được để trống.";
    } else {
      const priceNum = parseFloat(formData.price);
      if (isNaN(priceNum) || priceNum <= 0) {
        newErrors.price = "Giá bán phải là số lớn hơn 0.";
      }
    }

    if (formData.qty === "" || formData.qty === null || formData.qty === undefined) {
      newErrors.qty = "Số lượng tồn kho không được để trống.";
    } else {
      const qtyNum = parseInt(formData.qty);
      if (isNaN(qtyNum) || qtyNum < 0) {
        newErrors.qty = "Số lượng tồn kho phải lớn hơn hoặc bằng 0.";
      }
    }

    if (!formData.cat_id) {
      newErrors.cat_id = "Vui lòng chọn danh mục sản phẩm.";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    setIsSubmitting(true);
    try {
      await onSubmit(formData, selectedFile);
    } catch (err) {
      console.error("Form submit error:", err);
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6 bg-white p-6 md:p-8 rounded-2xl border border-gray-150 shadow-xs">
      <div className="space-y-4">
        {/* Product Name */}
        <Input
          label="Tên sản phẩm"
          value={formData.product_name}
          onChange={handleNameChange}
          placeholder="Nhập tên sản phẩm..."
          error={errors.product_name}
          required
        />

        {/* Slug */}
        <Input
          label="Đường dẫn tĩnh (Slug)"
          value={formData.slug}
          onChange={(e) => handleChange("slug", e.target.value)}
          placeholder="slug-san-pham..."
          error={errors.slug}
          required
        />

        {/* Price & Quantity */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Input
            label="Giá bán (VNĐ)"
            type="number"
            value={formData.price}
            onChange={(e) => handleChange("price", e.target.value)}
            placeholder="Ví dụ: 15000000"
            error={errors.price}
            required
          />
          <Input
            label="Số lượng tồn kho"
            type="number"
            value={formData.qty}
            onChange={(e) => handleChange("qty", e.target.value)}
            placeholder="Ví dụ: 50"
            error={errors.qty}
            required
          />
        </div>

        {/* Category & Status */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div className="flex flex-col gap-1.5 w-full">
            <label className="text-xs font-semibold text-gray-650">Danh mục</label>
            <select
              value={formData.cat_id}
              onChange={(e) => handleChange("cat_id", e.target.value)}
              className={`w-full border rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200 ${
                errors.cat_id ? "border-red-500 focus:ring-red-100 focus:border-red-500" : "border-gray-250"
              }`}
              required
            >
              <option value="">Chọn danh mục</option>
              {categories.map((cat) => (
                <option key={cat.id} value={cat.id}>
                  {cat.category_name}
                </option>
              ))}
            </select>
            {errors.cat_id && <span className="text-xs text-red-500 mt-0.5">{errors.cat_id}</span>}
          </div>

          <div className="flex flex-col gap-1.5 w-full">
            <label className="text-xs font-semibold text-gray-650">Trạng thái</label>
            <select
              value={formData.status}
              onChange={(e) => handleChange("status", parseInt(e.target.value))}
              className="w-full border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
              required
            >
              <option value="1">Đang bán (Active)</option>
              <option value="0">Ngưng bán (Inactive)</option>
            </select>
          </div>
        </div>

        {/* Description */}
        <div className="flex flex-col gap-1.5 w-full">
          <label className="text-xs font-semibold text-gray-650">Mô tả sản phẩm</label>
          <textarea
            value={formData.description || ""}
            onChange={(e) => handleChange("description", e.target.value)}
            placeholder="Nhập mô tả chi tiết sản phẩm..."
            className="w-full border border-gray-250 rounded-xl px-4.5 py-3 text-sm placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200 min-h-[120px]"
          />
        </div>

        {/* Image upload & preview */}
        <div className="flex flex-col gap-1.5 w-full">
          <label className="text-xs font-semibold text-gray-650">Hình ảnh sản phẩm</label>
          <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4 border border-gray-250 rounded-xl p-4">
            <input
              type="file"
              accept="image/*"
              onChange={handleFileChange}
              className="w-full text-sm file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-xs file:font-semibold file:bg-blue-50 file:text-blue-600 hover:file:bg-blue-100 cursor-pointer"
            />
            {imagePreview && (
              <div className="relative shrink-0 w-20 h-20 border border-gray-200 rounded-lg overflow-hidden bg-gray-50 flex items-center justify-center">
                <img
                  src={imagePreview}
                  alt="Xem trước hình ảnh"
                  className="w-full h-full object-cover"
                />
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Form Buttons */}
      <div className="flex gap-3 justify-end border-t border-gray-150 pt-6">
        <Link 
          href="/admin/products" 
          className="inline-flex items-center justify-center font-medium border border-gray-300 hover:bg-gray-50 text-gray-700 h-11 px-5 rounded-xl cursor-pointer transition-colors duration-200 no-underline text-sm"
        >
          Hủy bỏ
        </Link>
        <Button
          type="submit"
          className="h-11 px-6 rounded-xl cursor-pointer font-bold"
          disabled={isSubmitting}
        >
          {isSubmitting ? "Đang xử lý..." : isEdit ? "Lưu thay đổi" : "Tạo sản phẩm"}
        </Button>
      </div>
    </form>
  );
}
