"use client";

import { useState, useEffect } from "react";
import ProductList from "@/components/shop/product/ProductList";
import CategoryFilter from "@/components/shop/product/CategoryFilter";
import Pagination from "@/components/shop/product/Pagination";
import { getProducts } from "@/services/productServices";
import { getAllCategories } from "@/services/categoryServices";

export default function ProductsPage() {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  // Filter and pagination state
  const [currentCategory, setCurrentCategory] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPage, setTotalPage] = useState(1);
  const [search, setSearch] = useState("");
  const [debouncedSearch, setDebouncedSearch] = useState("");
  const [sortBy, setSortBy] = useState("default");

  // Load all categories on mount
  useEffect(() => {
    const fetchCats = async () => {
      try {
        const catData = await getAllCategories();
        setCategories(catData);
      } catch (error) {
        console.error("Error loading categories:", error);
      }
    };
    fetchCats();
  }, []);

  // Debounce search query by 400ms
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedSearch(search);
    }, 400);
    return () => clearTimeout(timer);
  }, [search]);

  // Load products when filters change
  useEffect(() => {
    const fetchProduct = async () => {
      try {
        setLoading(true);
        const res = await getProducts({
          page: currentPage,
          pageSize: 8, // 8 items per page
          categoryId: currentCategory,
          search: debouncedSearch,
          sortBy: sortBy,
        });
        setProducts(res.products);
        setTotalPage(res.totalPage);
      } catch (error) {
        console.error("Error fetching products: ", error);
      } finally {
        setLoading(false);
      }
    };
    fetchProduct();
  }, [currentCategory, currentPage, debouncedSearch, sortBy]);

  // Reset page when filters change
  const handleCategoryChange = (catId) => {
    setCurrentCategory(catId);
    setCurrentPage(1);
  };

  const handleSearchChange = (e) => {
    setSearch(e.target.value);
    setCurrentPage(1);
  };

  const handleSortChange = (e) => {
    setSortBy(e.target.value);
    setCurrentPage(1);
  };

  return (
    <div className="container mx-auto px-6 py-10 space-y-8">
      {/* Header section */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-6 bg-white p-6 md:p-8 rounded-3xl border border-gray-150">
        <div>
          <h1 className="text-3xl font-extrabold text-gray-800 tracking-tight">Cửa hàng</h1>
          <p className="text-sm text-gray-400 mt-1.5">Khám phá các sản phẩm công nghệ chất lượng cao của chúng tôi.</p>
        </div>

        {/* Search & Sort Section */}
        <div className="flex flex-col sm:flex-row gap-3 w-full md:w-auto shrink-0">
          {/* Search bar */}
          <div className="relative w-full sm:w-64">
            <span className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-sm pointer-events-none">🔍</span>
            <input
              type="text"
              value={search}
              onChange={handleSearchChange}
              placeholder="Tìm kiếm sản phẩm..."
              className="w-full pl-10 pr-10 py-3 text-sm border border-gray-250 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all duration-200"
            />
            {search && (
              <button
                onClick={() => handleSearchChange({ target: { value: "" } })}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 font-bold text-xs p-1 cursor-pointer"
              >
                ✕
              </button>
            )}
          </div>

          {/* Sort selection */}
          <select
            value={sortBy}
            onChange={handleSortChange}
            className="w-full sm:w-44 border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 bg-white transition-all duration-200 text-gray-600 font-medium"
          >
            <option value="default">Sắp xếp: Mặc định</option>
            <option value="price_asc">Giá: Thấp đến Cao</option>
            <option value="price_desc">Giá: Cao đến Thấp</option>
            <option value="newest">Mới nhất</option>
          </select>
        </div>
      </div>

      {/* Category filter */}
      <div className="bg-white rounded-3xl border border-gray-150 p-6 shadow-xs">
        <CategoryFilter
          categories={categories}
          value={currentCategory}
          onChange={handleCategoryChange}
        />
      </div>

      {/* Product list */}
      <div className="bg-white rounded-3xl border border-gray-150 p-6 md:p-8 shadow-xs minimum-height-[300px]">
        {loading ? (
          <div className="flex flex-col items-center justify-center py-20 space-y-3">
            <div className="w-10 h-10 border-4 border-blue-500 border-t-transparent rounded-full animate-spin"></div>
            <p className="text-sm font-semibold text-gray-500 animate-pulse">Đang tải danh sách sản phẩm...</p>
          </div>
        ) : products.length === 0 ? (
          <div className="text-center py-20">
            <span className="text-5xl">📦</span>
            <h3 className="text-lg font-bold text-gray-800 mt-4">Không tìm thấy sản phẩm nào</h3>
            <p className="text-sm text-gray-400 mt-1">Thử thay đổi bộ lọc hoặc từ khóa tìm kiếm của bạn.</p>
          </div>
        ) : (
          <>
            <ProductList products={products} />
            <Pagination
              currentPage={currentPage}
              totalPage={totalPage}
              onPageChange={setCurrentPage}
            />
          </>
        )}
      </div>
    </div>
  );
}
