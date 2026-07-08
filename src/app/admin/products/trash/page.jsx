"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import Table from "@/components/common/Table";
import Button from "@/components/common/Button";
import Modal from "@/components/common/Modal";
import Empty from "@/components/common/Empty";
import { getTrashedProducts, restoreProduct, forceDeleteProduct } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

export default function TrashBinPage() {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [viewingProduct, setViewingProduct] = useState(null);

  const fetchTrashedData = async () => {
    try {
      setLoading(true);
      const [trashedData, catData] = await Promise.all([
        getTrashedProducts(),
        getAllCategories(),
      ]);
      setProducts(trashedData || []);
      setCategories(catData || []);
    } catch (error) {
      console.error("Error loading trashed products:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTrashedData();
  }, []);

  const handleRestore = async (product) => {
    if (confirm(`Bạn muốn khôi phục sản phẩm ${product.product_name}?`)) {
      try {
        setLoading(true);
        await restoreProduct(product.id);
        alert("Khôi phục sản phẩm thành công!");
        fetchTrashedData();
      } catch (error) {
        console.error("Error restoring product:", error);
        alert("Đã xảy ra lỗi khi khôi phục sản phẩm.");
        setLoading(false);
      }
    }
  };

  const handleForceDelete = async (product) => {
    if (
      confirm(
        `CẢNH BÁO: Bạn chắc chắn muốn xóa VĨNH VIỄN sản phẩm ${product.product_name}? Thao tác này không thể khôi phục.`
      )
    ) {
      try {
        setLoading(true);
        await forceDeleteProduct(product.id);
        alert("Đã xóa vĩnh viễn sản phẩm!");
        fetchTrashedData();
      } catch (error) {
        console.error("Error permanently deleting product:", error);
        alert("Đã xảy ra lỗi khi xóa vĩnh viễn sản phẩm.");
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
      key: "actions",
      label: "Hành động",
      render: (row) => (
        <div className="flex items-center gap-2.5">
          <button
            onClick={() => setViewingProduct(row)}
            className="text-xs font-semibold text-green-600 hover:text-green-800 transition-colors bg-green-50 hover:bg-green-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Chi tiết
          </button>
          <button
            onClick={() => handleRestore(row)}
            className="text-xs font-semibold text-blue-600 hover:text-blue-800 transition-colors bg-blue-50 hover:bg-blue-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Khôi phục
          </button>
          <button
            onClick={() => handleForceDelete(row)}
            className="text-xs font-semibold text-red-600 hover:text-red-800 transition-colors bg-red-50 hover:bg-red-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Xóa vĩnh viễn
          </button>
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      {/* Header section */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 bg-white p-6 rounded-2xl border border-gray-150 shadow-xs">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Thùng rác sản phẩm</h2>
          <p className="text-xs text-gray-400 mt-1">Danh sách sản phẩm đã bị xóa tạm thời. Bạn có thể khôi phục hoặc xóa vĩnh viễn.</p>
        </div>
        <Link
          href="/admin/products"
          className="shrink-0 px-4 py-2.5 text-xs font-semibold text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 rounded-xl transition-all no-underline flex items-center gap-1.5 cursor-pointer"
        >
          ← Quay lại
        </Link>
      </div>

      <div className="bg-white rounded-2xl border border-gray-150 p-6 shadow-xs min-h-[300px] flex flex-col justify-center">
        {loading ? (
          <div className="text-center py-10 text-gray-500">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-3"></div>
            Đang tải dữ liệu...
          </div>
        ) : products.length === 0 ? (
          <Empty message="Thùng rác trống" />
        ) : (
          <Table columns={tableColumns} data={products} rowKey="id" />
        )}
      </div>

      {viewingProduct && (
        <Modal
          isOpen={!!viewingProduct}
          onClose={() => setViewingProduct(null)}
          title="Chi tiết sản phẩm đã xóa tạm"
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
                        ? `http://127.0.0.1:8000/storage/${viewingProduct.image}`
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
                  <span className="text-xs font-bold text-red-650 bg-red-50 px-2.5 py-1 rounded-full uppercase">
                    {categories.find((c) => String(c.id) === String(viewingProduct.cat_id))?.category_name || "Chưa phân loại"}
                  </span>
                </div>
                <h3 className="text-lg font-bold text-gray-800">{viewingProduct.product_name}</h3>
                
                <div className="grid grid-cols-2 gap-4 border-t border-b border-gray-100 py-3 text-sm">
                  <div>
                    <p className="text-xs text-gray-400 font-medium">Giá bán</p>
                    <p className="font-bold text-red-500">
                      {typeof viewingProduct.price === "number"
                        ? viewingProduct.price.toLocaleString("vi-VN") + "đ"
                        : viewingProduct.price}
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
                    <p className="text-gray-400 font-medium">Trạng thái trước xóa</p>
                    <span
                      className={`inline-block px-2.5 py-0.5 rounded-full text-[10px] font-bold mt-1 ${
                        viewingProduct.status === 1 || viewingProduct.status === "1"
                          ? "bg-green-50 text-green-600"
                          : "bg-red-50 text-red-600"
                      }`}
                    >
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

            {/* Footer Actions */}
            <div className="flex justify-end gap-3 pt-2 border-t border-gray-100">
              <Button
                variant="outline"
                onClick={() => setViewingProduct(null)}
                className="h-10 px-5 rounded-xl cursor-pointer"
              >
                Đóng
              </Button>
              <Button
                variant="primary"
                onClick={async () => {
                  const prod = viewingProduct;
                  setViewingProduct(null);
                  await handleRestore(prod);
                }}
                className="h-10 px-5 rounded-xl cursor-pointer"
              >
                Khôi phục
              </Button>
              <Button
                variant="danger"
                onClick={async () => {
                  const prod = viewingProduct;
                  setViewingProduct(null);
                  await handleForceDelete(prod);
                }}
                className="h-10 px-5 rounded-xl cursor-pointer font-semibold"
              >
                Xóa vĩnh viễn
              </Button>
            </div>
          </div>
        </Modal>
      )}
    </div>
  );
}
