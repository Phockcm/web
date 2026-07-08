"use client";

import { useState, useEffect } from "react";
import AdminTable from "@/components/admin/Table/AdminTable";
import Modal from "@/components/common/Modal";
import Input from "@/components/common/Input";
import Button from "@/components/common/Button";
import { getAllCategories, createCategory, updateCategory, deleteCategory } from "@/services/categoryServices";

const convertToSlug = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");

export default function CategoriesManagement() {
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showModal, setShowModal] = useState(false);
  const [editCategory, setEditCategory] = useState(null);

  const [formData, setFormData] = useState({
    name: "",
    slug: "",
    parent_id: 0,
    status: 1,
  });

  const fetchCategories = async () => {
    try {
      const data = await getAllCategories();
      setCategories(data);
    } catch (error) {
      console.error("Error loading categories:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  const handleOpenAdd = () => {
    setEditCategory(null);
    setFormData({
      name: "",
      slug: "",
      parent_id: 0,
      status: 1,
    });
    setShowModal(true);
  };

  const handleOpenEdit = (category) => {
    setEditCategory(category);
    setFormData({
      name: category.category_name,
      slug: category.slug,
      parent_id: category.parent_id,
      status: category.status,
    });
    setShowModal(true);
  };

  const handleNameChange = (e) => {
    const name = e.target.value;
    setFormData((prev) => ({
      ...prev,
      name,
      slug: convertToSlug(name),
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const payload = {
        category_name: formData.name,
        slug: formData.slug,
        parent_id: parseInt(formData.parent_id) || 0,
        status: parseInt(formData.status),
      };

      if (editCategory) {
        await updateCategory(editCategory.id, payload);
      } else {
        await createCategory(payload);
      }
      
      setShowModal(false);
      setLoading(true);
      fetchCategories();
    } catch (error) {
      console.error("Error saving category:", error);
      alert("Đã xảy ra lỗi khi lưu danh mục. Vui lòng kiểm tra lại!");
    }
  };

  const handleDeleteCategory = async (category) => {
    if (confirm(`Bạn chắc chắn muốn xóa danh mục ${category.category_name}?`)) {
      try {
        setLoading(true);
        await deleteCategory(category.id);
        fetchCategories();
      } catch (error) {
        console.error("Error deleting category:", error);
        alert("Lỗi khi xóa danh mục.");
      }
    }
  };

  const tableColumns = [
    { key: "id", label: "Mã" },
    { key: "category_name", label: "Tên danh mục" },
    { key: "slug", label: "Đường dẫn tĩnh (Slug)" },
    {
      key: "parent_id",
      label: "Danh mục cha",
      render: (row) => {
        if (!row.parent_id || String(row.parent_id) === "0") return "Danh mục gốc";
        const parent = categories.find((c) => String(c.id) === String(row.parent_id));
        return parent ? parent.category_name : `Mã: ${row.parent_id}`;
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
            {isActive ? "Kích hoạt" : "Khóa"}
          </span>
        );
      },
    },
  ];

  // Filter possible parent categories (exclude the category itself when editing to avoid circular references)
  const availableParents = categories.filter((c) => !editCategory || String(c.id) !== String(editCategory.id));

  return (
    <div className="space-y-6">
      {/* Header section */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 bg-white p-6 rounded-2xl border border-gray-150">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Danh mục sản phẩm</h2>
          <p className="text-xs text-gray-400 mt-1">Quản lý cây danh mục sản phẩm, phân loại danh mục cha/con.</p>
        </div>
        <Button onClick={handleOpenAdd} className="shrink-0 font-semibold flex items-center gap-1.5 h-11 px-5 rounded-xl cursor-pointer">
          <span className="text-base font-bold">+</span> Thêm danh mục
        </Button>
      </div>

      {/* AdminTable wrapper */}
      <div className="bg-white rounded-2xl border border-gray-150 p-6 shadow-xs">
        {loading ? (
          <p className="text-center py-10 text-gray-500">Đang tải danh sách danh mục...</p>
        ) : (
          <AdminTable
            columns={tableColumns}
            products={categories}
            onEdit={handleOpenEdit}
            onDelete={handleDeleteCategory}
            rowKey="id"
          />
        )}
      </div>

      {/* CRUD Modal Form */}
      <Modal
        isOpen={showModal}
        onClose={() => setShowModal(false)}
        title={editCategory ? "Cập nhật danh mục" : "Thêm danh mục mới"}
      >
        <form onSubmit={handleSubmit} className="space-y-4">
          <Input
            label="Tên danh mục"
            value={formData.name}
            onChange={handleNameChange}
            placeholder="Ví dụ: Áo thun nam, Laptop..."
            required
          />

          <Input
            label="Đường dẫn tĩnh (Slug)"
            value={formData.slug}
            onChange={(e) => setFormData({ ...formData, slug: e.target.value })}
            placeholder="vi-du-ao-thun-nam..."
            required
          />

          <div className="grid grid-cols-2 gap-4">
            <div className="flex flex-col gap-1.5 w-full">
              <label className="text-xs font-semibold text-gray-650">Danh mục cha</label>
              <select
                value={formData.parent_id}
                onChange={(e) => setFormData({ ...formData, parent_id: e.target.value })}
                className="w-full border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              >
                <option value="0">Không có (Danh mục gốc)</option>
                {availableParents.map((cat) => (
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
                <option value="1">Kích hoạt (Active)</option>
                <option value="0">Khóa (Inactive)</option>
              </select>
            </div>
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
              {editCategory ? "Lưu thay đổi" : "Tạo danh mục"}
            </Button>
          </div>
        </form>
      </Modal>
    </div>
  );
}
