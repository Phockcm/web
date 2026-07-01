"use client";

import { useState } from 'react';
import Link from 'next/link';
import { useAuth } from '@/contexts/AuthContext';
import ProtectedRoute from '@/components/common/ProtectedRoute';

export default function AccountPage() {
  const { user } = useAuth();
  const [activeTab, setActiveTab] = useState('profile');

  // Safely fallback user properties
  const userProfile = {
    name: user?.name || 'Chưa cập nhật',
    email: user?.email || 'Chưa cập nhật',
    phone: user?.phone || 'Chưa cập nhật',
    address: user?.address || 'Chưa cập nhật',
  };

  return (
    <ProtectedRoute>
      <div className="page-heading" id="top">
        <div className="container mx-auto px-6 py-10">
          <div className="row">
            <div className="col-lg-12">
              <h2 className="text-3xl font-extrabold text-gray-900">Tài khoản của tôi</h2>
              <span className="text-sm text-gray-500 mt-1 block">Quản lý thông tin cá nhân của bạn</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section py-8">
        <div className="container mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div className="col-span-1">
              <div className="bg-white border border-gray-150 rounded-2xl p-4 shadow-sm">
                <ul className="space-y-1">
                  <li>
                    <button 
                      onClick={() => setActiveTab('profile')}
                      className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-semibold transition-colors cursor-pointer ${
                        activeTab === 'profile' 
                          ? 'bg-blue-50 text-blue-650' 
                          : 'text-gray-650 hover:bg-gray-50'
                      }`}
                    >
                      Thông tin cá nhân
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('orders')}
                      className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-semibold transition-colors cursor-pointer ${
                        activeTab === 'orders' 
                          ? 'bg-blue-50 text-blue-650' 
                          : 'text-gray-650 hover:bg-gray-50'
                      }`}
                    >
                      Đơn hàng của tôi
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('wishlist')}
                      className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-semibold transition-colors cursor-pointer ${
                        activeTab === 'wishlist' 
                          ? 'bg-blue-50 text-blue-650' 
                          : 'text-gray-650 hover:bg-gray-50'
                      }`}
                    >
                      Sản phẩm yêu thích
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('settings')}
                      className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-semibold transition-colors cursor-pointer ${
                        activeTab === 'settings' 
                          ? 'bg-blue-50 text-blue-650' 
                          : 'text-gray-650 hover:bg-gray-50'
                      }`}
                    >
                      Cài đặt bảo mật
                    </button>
                  </li>
                </ul>
              </div>
            </div>

            <div className="col-span-1 md:col-span-3">
              {activeTab === 'profile' && (
                <div className="bg-white border border-gray-150 rounded-2xl p-6 shadow-sm">
                  <h3 className="text-xl font-bold text-gray-800 mb-6">Thông tin cá nhân</h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Họ và tên</label>
                      <p className="text-sm font-bold text-gray-800">{userProfile.name}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Địa chỉ Email</label>
                      <p className="text-sm font-bold text-gray-800">{userProfile.email}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Số điện thoại</label>
                      <p className="text-sm font-bold text-gray-800">{userProfile.phone}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Địa chỉ</label>
                      <p className="text-sm font-bold text-gray-800">{userProfile.address}</p>
                    </div>
                  </div>
                  <button className="mt-6 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-sm font-bold transition-colors cursor-pointer">
                    Chỉnh sửa thông tin
                  </button>
                </div>
              )}

              {activeTab === 'orders' && (
                <div className="bg-white border border-gray-150 rounded-2xl p-6 shadow-sm">
                  <h3 className="text-xl font-bold text-gray-800 mb-6">Đơn hàng của tôi</h3>
                  <div className="text-center py-10">
                    <span className="text-3xl">📦</span>
                    <p className="text-gray-400 mt-2 text-sm">Chưa có đơn hàng nào. Hãy khám phá và mua sắm ngay!</p>
                    <Link href="/products" className="inline-block mt-4 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-sm font-bold transition-colors no-underline">
                      Mua sắm ngay
                    </Link>
                  </div>
                </div>
              )}

              {activeTab === 'wishlist' && (
                <div className="bg-white border border-gray-150 rounded-2xl p-6 shadow-sm">
                  <h3 className="text-xl font-bold text-gray-800 mb-6">Sản phẩm yêu thích</h3>
                  <div className="text-center py-10">
                    <span className="text-3xl">❤️</span>
                    <p className="text-gray-400 mt-2 text-sm">Danh sách yêu thích trống.</p>
                  </div>
                </div>
              )}

              {activeTab === 'settings' && (
                <div className="bg-white border border-gray-150 rounded-2xl p-6 shadow-sm space-y-8">
                  <div className="space-y-4">
                    <h4 className="text-lg font-bold text-gray-850">Đổi mật khẩu</h4>
                    <form className="max-w-md space-y-4">
                      <div className="space-y-1">
                        <label className="text-xs font-semibold text-gray-650">Mật khẩu hiện tại</label>
                        <input type="password" placeholder="••••••••" className="w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150" required />
                      </div>
                      <div className="space-y-1">
                        <label className="text-xs font-semibold text-gray-650">Mật khẩu mới</label>
                        <input type="password" placeholder="Tối thiểu 6 ký tự" className="w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150" required />
                      </div>
                      <div className="space-y-1">
                        <label className="text-xs font-semibold text-gray-650">Xác nhận mật khẩu mới</label>
                        <input type="password" placeholder="Nhập lại mật khẩu mới" className="w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150" required />
                      </div>
                      <button type="submit" className="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-sm font-bold transition-colors cursor-pointer">
                        Cập nhật mật khẩu
                      </button>
                    </form>
                  </div>

                  <div className="border-t border-gray-100 pt-6 space-y-4">
                    <h4 className="text-lg font-bold text-red-650">Khu vực nguy hiểm</h4>
                    <p className="text-xs text-gray-400">Một khi bạn xóa tài khoản, mọi thông tin và lịch sử mua hàng sẽ không thể khôi phục.</p>
                    <button className="px-5 py-2.5 bg-red-50 hover:bg-red-100 text-red-600 rounded-xl text-sm font-bold transition-colors cursor-pointer">
                      Xóa tài khoản
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>
    </ProtectedRoute>
  );
}
