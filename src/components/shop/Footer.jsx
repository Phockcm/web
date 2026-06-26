import Link from "next/link";

export default function Footer() {
  return (
    <footer className="bg-gray-900 text-white mt-auto border-t border-gray-800">
      <div className="container mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8 py-12">
        <div className="space-y-3">
          <h3 className="text-lg font-bold text-white">
            Shop <span className="text-blue-500">Khoa</span>
          </h3>
          <p className="text-sm text-gray-400 leading-relaxed">
            Nền tảng mua sắm online hiện đại, tối ưu và nhanh chóng được xây dựng bằng Next.js và Tailwind CSS.
          </p>
        </div>
        <div>
          <h3 className="font-semibold text-sm uppercase text-gray-300 tracking-wider mb-4">Liên kết</h3>
          <ul className="text-sm text-gray-400 space-y-2.5 list-none p-0">
            <li><Link href="/" className="hover:text-blue-500 transition-colors no-underline">Trang chủ</Link></li>
            <li><Link href="/products" className="hover:text-blue-500 transition-colors no-underline">Sản phẩm</Link></li>
            <li><Link href="/posts" className="hover:text-blue-500 transition-colors no-underline">Bài viết</Link></li>
          </ul>
        </div>
        <div>
          <h3 className="font-semibold text-sm uppercase text-gray-300 tracking-wider mb-4">Hỗ trợ</h3>
          <ul className="text-sm text-gray-400 space-y-2.5 list-none p-0">
            <li><a href="#" className="hover:text-blue-500 transition-colors no-underline">Chính sách bảo mật</a></li>
            <li><a href="#" className="hover:text-blue-500 transition-colors no-underline">Điều khoản dịch vụ</a></li>
            <li><a href="#" className="hover:text-blue-500 transition-colors no-underline">FAQ</a></li>
          </ul>
        </div>
        <div>
          <h3 className="font-semibold text-sm uppercase text-gray-300 tracking-wider mb-4">Liên hệ</h3>
          <p className="text-sm text-gray-400">Email: support@ShopKhoa.vn</p>
          <p className="text-sm text-gray-400 mt-1">Hotline: 1900 1234</p>
        </div>
      </div>
      <div className="border-t border-gray-800 py-6 text-center text-xs text-gray-500">
        © 2026 Shop Khoa. Tất cả quyền được bảo lưu.
      </div>
    </footer>
  );
}
