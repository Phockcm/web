"use client";

import { useState, useEffect } from "react";
import AdminTable from "@/components/admin/Table/AdminTable";
import Modal from "@/components/common/Modal";
import Input from "@/components/common/Input";
import Button from "@/components/common/Button";
import { getAdminProducts, createProduct, updateProduct, deleteProduct } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

const convertToSlug = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");

export default function ProductsManagement() {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);
  const [editProduct, setEditProduct] = useState(null);

  const [formData, setFormData] = useState({
    product_name: "",
    slug: "",
    price: "",
    qty: "",
    cat_id: "",
    status: 1,
  });
  const [selectedFile, setSelectedFile] = useState(null);

  const fetchProductsAndCategories = async () => {
    try {
      const [prodData, catData] = await Promise.all([
        getAdminProducts(),
        getAllCategories(),
      ]);
      setProducts(prodData);
      setCategories(catData);
    } catch (error) {
      console.error("Error loading admin products/categories:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchProductsAndCategories();
  }, []);

  const handleOpenAdd = () => {
    setEditProduct(null);
    setFormData({
      product_name: "",
      slug: "",
      price: "",
      qty: "",
      cat_id: categories[0]?.id || "",
      status: 1,
    });
    setSelectedFile(null);
    setShowModal(true);
  };

  const handleOpenEdit = (product) => {
    setEditProduct(product);
    setFormData({
      product_name: product.product_name,
      slug: product.slug,
      price: product.price,
      qty: product.qty,
      cat_id: product.cat_id,
      status: product.status,
    });
    setSelectedFile(null);
    setShowModal(true);
  };

  const handleNameChange = (e) => {
    const name = e.target.value;
    setFormData((prev) => ({
      ...prev,
      product_name: name,
      slug: editProduct ? prev.slug : convertToSlug(name),
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const data = new FormData();
      data.append("product_name", formData.product_name);
      data.append("slug", formData.slug);
      data.append("price", formData.price);
      data.append("qty", formData.qty);
      data.append("cat_id", formData.cat_id);
      data.append("status", formData.status);
      data.append("brand_id", 1);
      
      if (selectedFile) {
        data.append("image", selectedFile);
      }

      if (editProduct) {
        await updateProduct(editProduct.id, data);
      } else {
        await createProduct(data);
      }
      
      setShowModal(false);
      setLoading(true);
      fetchProductsAndCategories();
    } catch (error) {
      console.error("Error saving product:", error);
      alert("Đã xảy ra lỗi khi lưu sản phẩm. Vui lòng kiểm tra lại!");
    }
  };

  const handleDeleteProduct = async (product) => {
    if (confirm(`Bạn chắc chắn muốn xóa sản phẩm ${product.product_name}?`)) {
      try {
        setLoading(true);
        await deleteProduct(product.id);
        fetchProductsAndCategories();
      } catch (error) {
        console.error("Error deleting product:", error);
        alert("Lỗi khi xóa sản phẩm.");
      }
    }
  };

  const tableColumns = [
    {
      key: "image",
      label: "Hình ảnh",
      render: (row) => {
        let imageSrc = "https://via.placeholder.com/50";
        if (row.image) {
          if (row.image.startsWith("http://") || row.image.startsWith("https://")) {
            imageSrc = row.image;
          } else if (row.image.startsWith("products/")) {
            imageSrc = `http://127.0.0.1:8000/storage/${row.image}`;
          } else {
            imageSrc = `/shop/images/${row.image}`;
          }
        }
        return (
          <img
            src={imageSrc}
            alt={row.product_name}
            className="w-10 h-10 object-cover rounded-lg border border-gray-200"
          />
        );
      },
    },
    { key: "product_name", label: "Tên sản phẩm" },
    {
      key: "price",
      label: "Giá bán",
      render: (row) =>
        typeof row.price === "number"
          ? row.price.toLocaleString("vi-VN") + "đ"
          : row.price,
    },
    { key: "qty", label: "Tồn kho" },
    {
      key: "cat_id",
      label: "Danh mục",
      render: (row) => {
        return (
          categories.find((c) => String(c.id) === String(row.cat_id))?.category_name ||
          row.cat_id ||
          "Chưa phân loại"
        );
      },
    },
    {
      key: "status",
      label: "Trạng thái",
      render: (row) => {
        const isActive = row.status === 1 || row.status === "1";
        return (
          <span
            className={`px-2.5 py-1 rounded-full text-xs font-semibold ${
              isActive ? "bg-green-50 text-green-600" : "bg-red-50 text-red-600"
            }`}
          >
            {isActive ? "Đang bán" : "Ngưng bán"}
          </span>
        );
      },
    },
  ];

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 bg-white p-6 rounded-2xl border border-gray-150">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Danh sách sản phẩm</h2>
          <p className="text-xs text-gray-400 mt-1">Quản lý kho hàng, cập nhật thông tin chi tiết các sản phẩm.</p>
        </div>
        <Button onClick={handleOpenAdd} className="shrink-0 font-semibold flex items-center gap-1.5 h-11 px-5 rounded-xl cursor-pointer">
          <span className="text-base font-bold">+</span> Thêm sản phẩm
        </Button>
      </div>

      <div className="bg-white rounded-2xl border border-gray-150 p-6 shadow-xs">
        {loading ? (
          <p className="text-center py-10 text-gray-500">Đang tải danh sách sản phẩm...</p>
        ) : (
          <AdminTable
            columns={tableColumns}
            products={products}
            onEdit={handleOpenEdit}
            onDelete={handleDeleteProduct}
            rowKey="id"
          />
        )}
      </div>

      <Modal
        isOpen={showModal}
        onClose={() => setShowModal(false)}
        title={editProduct ? "Cập nhật sản phẩm" : "Thêm sản phẩm mới"}
      >
        <form onSubmit={handleSubmit} className="space-y-4">
          <Input
            label="Tên sản phẩm"
            value={formData.product_name}
            onChange={handleNameChange}
            placeholder="Nhập tên sản phẩm..."
            required
          />

          <Input
            label="Đường dẫn tĩnh (Slug)"
            value={formData.slug}
            onChange={(e) => setFormData({ ...formData, slug: e.target.value })}
            placeholder="slug-san-pham..."
            required
          />

          <div className="grid grid-cols-2 gap-4">
            <Input
              label="Giá bán (VNĐ)"
              type="number"
              value={formData.price}
              onChange={(e) => setFormData({ ...formData, price: e.target.value })}
              placeholder="Ví dụ: 15000000"
              required
            />
            <Input
              label="Số lượng tồn kho"
              type="number"
              value={formData.qty}
              onChange={(e) => setFormData({ ...formData, qty: e.target.value })}
              placeholder="Ví dụ: 50"
              required
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-xs font-semibold text-gray-650">Danh mục</label>
              <select
                value={formData.cat_id}
                onChange={(e) => setFormData({ ...formData, cat_id: e.target.value })}
                className="w-full border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              >
                <option value="">Chọn danh mục</option>
                {categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>
                    {cat.category_name}
                  </option>
                ))}
              </select>
            </div>

            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-xs font-semibold text-gray-650">Trạng thái</label>
              <select
                value={formData.status}
                onChange={(e) => setFormData({ ...formData, status: parseInt(e.target.value) })}
                className="w-full border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              >
                <option value="1">Đang bán (Active)</option>
                <option value="0">Ngưng bán (Inactive)</option>
              </select>
            </div>
          </div>

          <div className="flex flex-col gap-1.5 w-full">
            <label className="text-xs font-semibold text-gray-650">Hình ảnh sản phẩm</label>
            <input
              type="file"
              accept="image/*"
              onChange={(e) => setSelectedFile(e.target.files?.[0] || null)}
              className="w-full border border-gray-250 rounded-xl px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
            />
          </div>

          <div className="flex gap-3 pt-4 justify-end">
            <Button
              type="button"
              variant="outline"
              onClick={() => setShowModal(false)}
              className="h-11 px-5 rounded-xl cursor-pointer"
            >
              Hủy bỏ
            </Button>
            <Button
              type="submit"
              className="h-11 px-5 rounded-xl cursor-pointer font-bold"
            >
              {editProduct ? "Lưu thay đổi" : "Tạo sản phẩm"}
            </Button>
          </div>
        </form>
      </Modal>
    </div>
  );
}

