"use client";

export default function CategoryFilter({ categories = [], value, onChange }) {
  return (
    <div className="flex flex-col gap-3 w-full">
      {/* Label */}
      <div className="flex items-center justify-between">
        <span className="text-sm font-bold text-gray-700 tracking-wide uppercase">Danh mục sản phẩm</span>
        {value && (
          <button 
            onClick={() => onChange("")} 
            className="text-xs text-blue-600 hover:text-blue-800 font-semibold transition-colors cursor-pointer"
          >
            Xóa bộ lọc
          </button>
        )}
      </div>

      {/* Select Dropdown (Visible on Mobile) */}
      <div className="block md:hidden w-full">
        <select
          value={value || ""}
          onChange={(e) => onChange(e.target.value)}
          className="w-full border border-gray-200 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 bg-white transition-all duration-200 shadow-sm text-gray-700 font-medium"
        >
          <option value="">Tất cả danh mục</option>
          {categories.map((cat) => (
            <option key={cat.id} value={cat.id}>
              {cat.category_name}
            </option>
          ))}
        </select>
      </div>

      {/* Premium Horizontal Tabs (Visible on Desktop/Tablet) */}
      <div className="hidden md:flex flex-wrap gap-2">
        <button
          onClick={() => onChange("")}
          className={`px-5 py-2.5 rounded-xl text-sm font-semibold transition-all duration-300 cursor-pointer border shadow-sm ${
            !value
              ? "bg-blue-600 border-blue-600 text-white shadow-blue-100 scale-[1.02]"
              : "bg-white border-gray-200 text-gray-600 hover:border-gray-300 hover:bg-gray-50"
          }`}
        >
          Tất cả sản phẩm
        </button>
        
        {categories.map((cat) => {
          const isSelected = String(value) === String(cat.id);
          return (
            <button
              key={cat.id}
              onClick={() => onChange(cat.id)}
              className={`px-5 py-2.5 rounded-xl text-sm font-semibold transition-all duration-300 cursor-pointer border shadow-sm ${
                isSelected
                  ? "bg-blue-600 border-blue-600 text-white shadow-blue-100 scale-[1.02]"
                  : "bg-white border-gray-200 text-gray-600 hover:border-gray-300 hover:bg-gray-50"
              }`}
            >
              {cat.category_name}
            </button>
          );
        })}
      </div>
    </div>
  );
}
