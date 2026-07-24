"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import AdminTable from "@/components/admin/Table/AdminTable";
import Button from "@/components/common/Button";
import Modal from "@/components/common/Modal";
import { getAdminProducts, deleteProduct } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

export default function ProductsManagement() {
  const router = useRouter();
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [viewingProduct, setViewingProduct] = useState(null);

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
    router.push("/admin/products/create");
  };

  const handleOpenEdit = (product) => {
    router.push(`/admin/products/edit/${product.id}`);
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
      } finally {
        setLoading(false);
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
            const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
            imageSrc = `${backendUrl}/storage/${row.image}`;
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
      key: "description",
      label: "Mô tả",
      render: (row) => {
        const desc = row.description || "";
        return (
          <div className="max-w-[180px] truncate text-xs text-gray-500 font-medium" title={desc}>
            {desc || "—"}
          </div>
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
        <div className="flex items-center gap-3">
          <Link href="/admin/products/trash" className="shrink-0 px-4 h-11 text-sm font-semibold text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-xl transition-all no-underline flex items-center gap-1.5 cursor-pointer">
            🗑️ Thùng rác
          </Link>
          <Button onClick={handleOpenAdd} className="shrink-0 font-semibold flex items-center gap-1.5 h-11 px-5 rounded-xl cursor-pointer">
            <span className="text-base font-bold">+</span> Thêm sản phẩm
          </Button>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-gray-150 p-6 shadow-xs">
        {loading ? (
          <p className="text-center py-10 text-gray-500">Đang tải danh sách sản phẩm...</p>
        ) : (
          <AdminTable
            columns={tableColumns}
            products={products}
            onView={setViewingProduct}
            onEdit={handleOpenEdit}
            onDelete={handleDeleteProduct}
            rowKey="id"
          />
        )}
      </div>

      {viewingProduct && (
        <Modal
          isOpen={!!viewingProduct}
          onClose={() => setViewingProduct(null)}
          title="Chi tiết sản phẩm"
        >
          <div className="space-y-6">
            {/* Details Layout */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {/* Left column: image */}
              <div className="md:col-span-1 border border-gray-200 rounded-xl overflow-hidden bg-gray-50 flex items-center justify-center aspect-square">
                <img
                  src={
                    viewingProduct.image
                      ? viewingProduct.image.startsWith("http")
                        ? viewingProduct.image
                        : viewingProduct.image.startsWith("products/")
                        ? `${process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000"}/storage/${viewingProduct.image}`
                        : `/shop/images/${viewingProduct.image}`
                      : "https://via.placeholder.com/150"
                  }
                  alt={viewingProduct.product_name}
                  className="w-full h-full object-cover"
                />
              </div>
              {/* Right column: general specs */}
              <div className="md:col-span-2 space-y-3.5">
                <div>
                  <span className="text-xs font-bold text-blue-650 bg-blue-50 px-2.5 py-1 rounded-full uppercase">
                    {categories.find(c => String(c.id) === String(viewingProduct.cat_id))?.category_name || "Chưa phân loại"}
                  </span>
                </div>
                <h3 className="text-lg font-bold text-gray-800">{viewingProduct.product_name}</h3>
                
                <div className="grid grid-cols-2 gap-4 border-t border-b border-gray-100 py-3 text-sm">
                  <div>
                    <p className="text-xs text-gray-400 font-medium">Giá bán</p>
                    <p className="font-bold text-red-500">
                      {typeof viewingProduct.price === "number" ? viewingProduct.price.toLocaleString("vi-VN") + "đ" : viewingProduct.price}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-400 font-medium">Tồn kho</p>
                    <p className="font-semibold text-gray-700">{viewingProduct.qty} sản phẩm</p>
                  </div>
                </div>

                <div className="grid grid-cols-2 gap-4 text-xs">
                  <div>
                    <p className="text-gray-400 font-medium">Đường dẫn tĩnh (Slug)</p>
                    <p className="text-gray-650 font-mono mt-0.5">{viewingProduct.slug}</p>
                  </div>
                  <div>
                    <p className="text-gray-400 font-medium">Trạng thái</p>
                    <span className={`inline-block px-2.5 py-0.5 rounded-full text-[10px] font-bold mt-1 ${
                      viewingProduct.status === 1 || viewingProduct.status === "1"
                        ? "bg-green-50 text-green-600"
                        : "bg-red-50 text-red-600"
                    }`}>
                      {viewingProduct.status === 1 || viewingProduct.status === "1" ? "Đang bán" : "Ngưng bán"}
                    </span>
                  </div>
                </div>
              </div>
            </div>

            {/* Bottom: Description */}
            <div className="border-t border-gray-150 pt-4 space-y-1.5">
              <h4 className="text-sm font-semibold text-gray-700">Mô tả sản phẩm</h4>
              <div className="text-sm text-gray-500 bg-gray-50 p-4 rounded-xl border border-gray-150 leading-relaxed max-h-[200px] overflow-y-auto whitespace-pre-wrap">
                {viewingProduct.description || "Không có mô tả cho sản phẩm này."}
              </div>
            </div>

            {/* Footer */}
            <div className="flex justify-end pt-2 border-t border-gray-100">
              <Button onClick={() => setViewingProduct(null)} className="h-10 px-5 rounded-xl cursor-pointer">
                Đóng
              </Button>
            </div>
          </div>
        </Modal>
      )}
    </div>
  );
}

