"use client";

export default function Pagination({ currentPage, totalPage, onPageChange }) {
  if (totalPage <= 1) return null;

  const pages = Array.from({ length: totalPage }, (_, i) => i + 1);

  return (
    <div className="flex items-center justify-center gap-2 mt-10">
      {/* Previous Button */}
      <button
        onClick={() => onPageChange(currentPage - 1)}
        disabled={currentPage === 1}
        className={`w-10 h-10 rounded-xl flex items-center justify-center border transition-all duration-200 cursor-pointer text-sm font-bold shadow-sm ${
          currentPage === 1
            ? "border-gray-100 text-gray-300 bg-gray-50/50 cursor-not-allowed"
            : "border-gray-250 text-gray-600 bg-white hover:border-gray-300 hover:bg-gray-50"
        }`}
        aria-label="Trang trước"
      >
        &larr;
      </button>

      {/* Page Numbers */}
      {pages.map((page) => {
        const isCurrent = page === currentPage;
        return (
          <button
            key={page}
            onClick={() => onPageChange(page)}
            className={`w-10 h-10 rounded-xl flex items-center justify-center text-sm font-bold border transition-all duration-300 cursor-pointer shadow-sm ${
              isCurrent
                ? "bg-blue-600 border-blue-600 text-white shadow-blue-100 scale-105"
                : "bg-white border-gray-250 text-gray-600 hover:border-gray-300 hover:bg-gray-50"
            }`}
          >
            {page}
          </button>
        );
      })}

      {/* Next Button */}
      <button
        onClick={() => onPageChange(currentPage + 1)}
        disabled={currentPage === totalPage}
        className={`w-10 h-10 rounded-xl flex items-center justify-center border transition-all duration-200 cursor-pointer text-sm font-bold shadow-sm ${
          currentPage === totalPage
            ? "border-gray-100 text-gray-300 bg-gray-50/50 cursor-not-allowed"
            : "border-gray-250 text-gray-600 bg-white hover:border-gray-300 hover:bg-gray-50"
        }`}
        aria-label="Trang sau"
      >
        &rarr;
      </button>
    </div>
  );
}
