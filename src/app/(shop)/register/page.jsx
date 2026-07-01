"use client";

import { useState } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import Link from 'next/link';

export default function RegisterPage() {
  const { register } = useAuth();
  const [formData, setFormData] = useState({
    username: '',
    name: '',
    email: '',
    phone: '',
    gender: '1', // 1: Male, 0: Female
    password: '',
    confirmPassword: ''
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    // Client-side validations
    if (formData.password !== formData.confirmPassword) {
      setError('Mật khẩu và xác nhận mật khẩu không khớp!');
      return;
    }
    if (formData.phone.length > 10) {
      setError('Số điện thoại không được quá 10 chữ số!');
      return;
    }
    if (!/^\d+$/.test(formData.phone)) {
      setError('Số điện thoại chỉ được chứa chữ số!');
      return;
    }

    setLoading(true);
    const result = await register({
      username: formData.username,
      name: formData.name,
      email: formData.email,
      phone: formData.phone,
      gender: formData.gender,
      password: formData.password
    });

    if (result.success) {
      setSuccess('Đăng ký tài khoản thành công!');
      setFormData({
        username: '',
        name: '',
        email: '',
        phone: '',
        gender: '1',
        password: '',
        confirmPassword: ''
      });
    } else {
      setError(result.message || 'Đăng ký thất bại. Vui lòng kiểm tra lại!');
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Đăng ký tài khoản
        </h2>
        <p className="mt-2 text-center text-sm text-gray-655">
          Hoặc{' '}
          <Link href="/login" className="font-semibold text-blue-600 hover:text-blue-500 transition-colors">
            đăng nhập tại đây
          </Link>
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow-sm border border-gray-150 rounded-2xl sm:px-10">
          {error && (
            <div className="mb-4 bg-red-50 border-l-4 border-red-500 p-3 rounded-lg text-sm text-red-800">
              ⚠️ {error}
            </div>
          )}
          {success && (
            <div className="mb-4 bg-green-50 border-l-4 border-green-500 p-3 rounded-lg text-sm text-green-800">
              🎉 {success}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label htmlFor="username" className="block text-xs font-bold text-gray-700">
                Tên đăng nhập
              </label>
              <input
                type="text"
                id="username"
                name="username"
                value={formData.username}
                onChange={handleChange}
                placeholder="Nhập tên đăng nhập"
                className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div>
              <label htmlFor="name" className="block text-xs font-bold text-gray-700">
                Họ và tên
              </label>
              <input
                type="text"
                id="name"
                name="name"
                value={formData.name}
                onChange={handleChange}
                placeholder="Nhập họ và tên"
                className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div>
              <label htmlFor="email" className="block text-xs font-bold text-gray-700">
                Địa chỉ Email
              </label>
              <input
                type="email"
                id="email"
                name="email"
                value={formData.email}
                onChange={handleChange}
                placeholder="example@domain.com"
                className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label htmlFor="phone" className="block text-xs font-bold text-gray-700">
                  Số điện thoại
                </label>
                <input
                  type="text"
                  id="phone"
                  name="phone"
                  value={formData.phone}
                  onChange={handleChange}
                  placeholder="0xxxxxxxxx"
                  className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                  required
                />
              </div>

              <div>
                <label htmlFor="gender" className="block text-xs font-bold text-gray-700">
                  Giới tính
                </label>
                <select
                  id="gender"
                  name="gender"
                  value={formData.gender}
                  onChange={handleChange}
                  className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                  required
                >
                  <option value="1">Nam</option>
                  <option value="0">Nữ</option>
                </select>
              </div>
            </div>

            <div>
              <label htmlFor="password" className="block text-xs font-bold text-gray-700">
                Mật khẩu
              </label>
              <input
                type="password"
                id="password"
                name="password"
                value={formData.password}
                onChange={handleChange}
                placeholder="Tối thiểu 6 ký tự"
                className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div>
              <label htmlFor="confirmPassword" className="block text-xs font-bold text-gray-700">
                Xác nhận mật khẩu
              </label>
              <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                value={formData.confirmPassword}
                onChange={handleChange}
                placeholder="Nhập lại mật khẩu"
                className="mt-1 block w-full text-gray-900 bg-white border border-gray-250 rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                required
              />
            </div>

            <div className="pt-2">
              <button
                type="submit"
                disabled={loading}
                className="w-full flex justify-center py-3 px-4 border border-transparent rounded-xl shadow-xs text-sm font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200 cursor-pointer disabled:bg-blue-300"
              >
                {loading ? 'Đang tạo tài khoản...' : 'Đăng ký'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
