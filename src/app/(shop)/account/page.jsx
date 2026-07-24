"use client";

import { useState, useEffect } from "react";
import { useAuth } from "@/contexts/AuthContext";
import ProtectedRoute from "@/components/common/ProtectedRoute";
import { updateMe } from "@/services/authServices";
import Input from "@/components/common/Input";
import Button from "@/components/common/Button";

export default function AccountPage() {
  const { user, reloadUser } = useAuth();
  const [isEditing, setIsEditing] = useState(false);

  // Form State
  const [formData, setFormData] = useState({
    name: "",
    username: "",
    email: "",
    phone: "",
    address: "",
    password: "",
    confirmPassword: "",
  });
  const [selectedFile, setSelectedFile] = useState(null);
  const [imagePreview, setImagePreview] = useState("");
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Load user data on mount and whenever user context updates
  useEffect(() => {
    if (user) {
      setFormData({
        name: user.name || "",
        username: user.username || "",
        email: user.email || "",
        phone: user.phone || "",
        address: user.address || "",
        password: "",
        confirmPassword: "",
      });
      if (user.image) {
        const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
        setImagePreview(
          user.image.startsWith("http")
            ? user.image
            : `${backendUrl}/storage/${user.image}`
        );
      } else {
        setImagePreview("");
      }
    }
  }, [user, isEditing]);

  const handleFormChange = (key, value) => {
    setFormData((prev) => ({ ...prev, [key]: value }));
    if (errors[key]) {
      setErrors((prev) => ({ ...prev, [key]: "" }));
    }
  };

  const handleFileChange = (e) => {
    const file = e.target.files?.[0] || null;
    setSelectedFile(file);
    if (file) {
      const previewUrl = URL.createObjectURL(file);
      setImagePreview(previewUrl);
    } else {
      // Revert to original database image
      if (user?.image) {
        const backendUrl = process.env.NEXT_PUBLIC_BACKEND_URL || "http://127.0.0.1:8000";
        setImagePreview(
          user.image.startsWith("http")
            ? user.image
            : `${backendUrl}/storage/${user.image}`
        );
      } else {
        setImagePreview("");
      }
    }
  };

  const validateForm = () => {
    const newErrors = {};
    if (!formData.name.trim()) newErrors.name = "Họ và tên không được để trống.";
    if (!formData.username.trim()) newErrors.username = "Tên đăng nhập không được để trống.";
    
    // Email Validation
    if (!formData.email.trim()) {
      newErrors.email = "Email không được để trống.";
    } else {
      const emailVal = formData.email.trim();
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(emailVal)) {
        newErrors.email = "Email không đúng định dạng.";
      } else {
        const parts = emailVal.split("@");
        const domain = parts[1];

        if (!domain.endsWith(".com")) {
          newErrors.email = "Email phải có đuôi là .com (ví dụ: @gmail.com hoặc @hotmail.com).";
        } else {
          const provider = domain.substring(0, domain.length - 4); // Remove ".com"
          if (provider !== "gmail" && provider !== "hotmail") {
            newErrors.email = "Email chỉ chấp nhận @gmail.com hoặc @hotmail.com.";
          }
        }
      }
    }

    // Phone Validation
    if (!formData.phone || !formData.phone.trim()) {
      newErrors.phone = "Số điện thoại không được để trống.";
    } else {
      const phoneVal = formData.phone.trim();
      const phoneRegex = /^\d{10}$/;
      if (!phoneRegex.test(phoneVal)) {
        if (!/^\d+$/.test(phoneVal)) {
          newErrors.phone = "Số điện thoại chỉ được chứa chữ số (0–9).";
        } else {
          newErrors.phone = "Số điện thoại phải đúng 10 chữ số.";
        }
      }
    }

    // Password Validation
    if (formData.password) {
      if (formData.password.length < 6) {
        newErrors.password = "Mật khẩu mới phải có ít nhất 6 ký tự.";
      }
      if (formData.password !== formData.confirmPassword) {
        newErrors.confirmPassword = "Xác nhận mật khẩu mới không trùng khớp.";
      }
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    setIsSubmitting(true);
    try {
      const data = new FormData();
      data.append("_method", "PUT"); // Method override for multipart requests
      data.append("name", formData.name);
      data.append("username", formData.username);
      data.append("email", formData.email);
      data.append("phone", formData.phone);
      data.append("address", formData.address);
      
      // Preserve current user's gender and birthday to satisfy UpdateUserRequest backend validation
      const genderVal = user?.gender !== undefined && user?.gender !== null ? user.gender : 1;
      data.append("gender", genderVal);
      if (user?.birthday) {
        data.append("birthday", user.birthday);
      }

      // Append password if provided
      if (formData.password) {
        data.append("password", formData.password);
      }

      if (selectedFile) {
        data.append("image", selectedFile);
      }

      await updateMe(data);
      await reloadUser();
      alert("Cập nhật thông tin tài khoản thành công!");
      setIsEditing(false);
    } catch (error) {
      console.error("Error updating profile:", error);
      const backendMessage = error.response?.data?.message || "";
      if (backendMessage.includes("username")) {
        setErrors((prev) => ({ ...prev, username: "Tên đăng nhập đã tồn tại trong hệ thống." }));
      } else if (backendMessage.includes("email")) {
        setErrors((prev) => ({ ...prev, email: "Email đã tồn tại trong hệ thống." }));
      } else {
        alert("Đã xảy ra lỗi khi cập nhật thông tin!");
      }
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleCancelEdit = () => {
    setIsEditing(false);
    setSelectedFile(null);
    setErrors({});
  };

  // Safely fallback user properties for default display
  const userProfile = {
    name: user?.name || "Chưa cập nhật",
    username: user?.username || "Chưa cập nhật",
    email: user?.email || "Chưa cập nhật",
    phone: user?.phone || "Chưa cập nhật",
    address: user?.address || "Chưa cập nhật",
  };

  return (
    <ProtectedRoute>
      <div className="page-heading" id="top">
        <div className="container mx-auto px-6 py-10">
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl font-extrabold text-gray-900 font-['Be_Vietnam_Pro']">Tài khoản của tôi</h2>
            <span className="text-sm text-gray-500 mt-1 block">Quản lý và chỉnh sửa thông tin cá nhân của bạn</span>
          </div>
        </div>
      </div>

      <section className="section py-8 font-['Be_Vietnam_Pro']">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto">
            <div className="bg-white border border-gray-150 rounded-2xl p-6 md:p-8 shadow-sm">
              <div className="flex items-center justify-between mb-6 border-b border-gray-100 pb-4">
                <h3 className="text-xl font-bold text-gray-800 m-0">Thông tin cá nhân</h3>
                {!isEditing && (
                  <button
                    onClick={() => setIsEditing(true)}
                    className="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-xl text-xs font-bold transition-colors cursor-pointer border-0"
                  >
                    Chỉnh sửa thông tin
                  </button>
                )}
              </div>

              {!isEditing ? (
                /* Default Info View */
                <div className="flex flex-col sm:flex-row gap-8 items-start">
                  {/* Avatar preview */}
                  <div className="flex flex-col items-center gap-3 shrink-0 mx-auto sm:mx-0">
                    <div className="w-24 h-24 rounded-full overflow-hidden border border-gray-200 bg-gray-50 flex items-center justify-center font-bold text-2xl text-blue-600">
                      {imagePreview ? (
                        <img src={imagePreview} alt={userProfile.name} className="w-full h-full object-cover" />
                      ) : (
                        userProfile.name.substring(0, 1).toUpperCase()
                      )}
                    </div>
                    <span className="text-[10px] uppercase font-bold tracking-wider px-2 py-0.5 rounded-md bg-gray-100 text-gray-550">
                      Ảnh đại diện
                    </span>
                  </div>

                  {/* Info grid */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 w-full">
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Họ và tên</label>
                      <p className="text-sm font-bold text-gray-800 m-0">{userProfile.name}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Tên đăng nhập</label>
                      <p className="text-sm font-bold text-gray-800 m-0">{userProfile.username}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Địa chỉ Email</label>
                      <p className="text-sm font-bold text-gray-800 m-0">{userProfile.email}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Số điện thoại</label>
                      <p className="text-sm font-bold text-gray-800 m-0">{userProfile.phone}</p>
                    </div>
                    <div className="space-y-1 bg-gray-50 p-4 rounded-xl border border-gray-100 sm:col-span-2">
                      <label className="text-xs font-semibold text-gray-450 uppercase tracking-wider">Địa chỉ</label>
                      <p className="text-sm font-bold text-gray-800 m-0">{userProfile.address}</p>
                    </div>
                  </div>
                </div>
              ) : (
                /* Edit Profile Mode with Split-Preview Layout */
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                  {/* Left Side: Live Preview Box */}
                  <div className="lg:col-span-1 bg-gray-50/50 border border-gray-200/80 rounded-2xl p-5 flex flex-col items-center text-center shadow-xs pt-8">
                    
                    {/* Live Avatar Preview */}
                    <div className="relative group w-24 h-24 rounded-full overflow-hidden border border-gray-250 bg-white flex items-center justify-center font-bold text-3xl text-blue-600 shadow-xs mb-4">
                      {imagePreview ? (
                        <img src={imagePreview} alt="Live avatar preview" className="w-full h-full object-cover" />
                      ) : (
                        (formData.name || "U").substring(0, 1).toUpperCase()
                      )}
                    </div>

                    <h4 className="text-base font-bold text-gray-800 truncate max-w-full m-0">
                      {formData.name.trim() || "Chưa nhập tên"}
                    </h4>
                    <span className="text-xs text-gray-450 font-semibold mb-6">
                      @{formData.username.trim() || "username"}
                    </span>

                    <div className="w-full text-left space-y-3.5 border-t border-gray-200 pt-5">
                      <div>
                        <span className="block text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-0.5">Email</span>
                        <span className="text-xs font-semibold text-gray-700 block truncate">{formData.email.trim() || "email@example.com"}</span>
                      </div>
                      <div>
                        <span className="block text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-0.5">Số điện thoại</span>
                        <span className="text-xs font-semibold text-gray-700 block">{formData.phone.trim() || "Chưa cập nhật"}</span>
                      </div>
                      <div>
                        <span className="block text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-0.5">Địa chỉ</span>
                        <span className="text-xs font-semibold text-gray-700 block truncate" title={formData.address.trim()}>{formData.address.trim() || "Chưa cập nhật"}</span>
                      </div>
                    </div>
                  </div>

                  {/* Right Side: Edit Form Fields */}
                  <form onSubmit={handleSubmit} className="lg:col-span-2 space-y-4">
                    {/* File Upload for Avatar */}
                    <div className="flex flex-col gap-1.5 w-full">
                      <label className="text-xs font-semibold text-gray-650">Thay đổi ảnh đại diện</label>
                      <input
                        type="file"
                        accept="image/*"
                        onChange={handleFileChange}
                        className="w-full text-sm file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-xs file:font-semibold file:bg-blue-50 file:text-blue-600 hover:file:bg-blue-100 cursor-pointer"
                      />
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <Input
                        label="Họ và tên"
                        value={formData.name}
                        onChange={(e) => handleFormChange("name", e.target.value)}
                        placeholder="Nguyễn Văn A..."
                        error={errors.name}
                        required
                      />
                      <Input
                        label="Tên đăng nhập"
                        value={formData.username}
                        onChange={(e) => handleFormChange("username", e.target.value)}
                        placeholder="username..."
                        error={errors.username}
                        required
                      />
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <Input
                        label="Địa chỉ Email"
                        type="email"
                        value={formData.email}
                        onChange={(e) => handleFormChange("email", e.target.value)}
                        placeholder="email@example.com..."
                        error={errors.email}
                        required
                      />
                      <Input
                        label="Số điện thoại"
                        value={formData.phone}
                        onChange={(e) => handleFormChange("phone", e.target.value)}
                        placeholder="Ví dụ: 0987654321..."
                        error={errors.phone}
                        required
                      />
                    </div>

                    <Input
                      label="Địa chỉ nhà"
                      value={formData.address}
                      onChange={(e) => handleFormChange("address", e.target.value)}
                      placeholder="Nhập số nhà, tên đường, quận/huyện..."
                      error={errors.address}
                    />

                    {/* Password Section */}
                    <div className="border-t border-gray-150 pt-4 space-y-3">
                      <h4 className="text-sm font-bold text-gray-700 m-0">Thay đổi mật khẩu</h4>
                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <Input
                          label="Mật khẩu mới (Bỏ trống nếu không đổi)"
                          type="password"
                          value={formData.password}
                          onChange={(e) => handleFormChange("password", e.target.value)}
                          placeholder="Nhập mật khẩu mới..."
                          error={errors.password}
                        />
                        <Input
                          label="Xác nhận mật khẩu mới"
                          type="password"
                          value={formData.confirmPassword}
                          onChange={(e) => handleFormChange("confirmPassword", e.target.value)}
                          placeholder="Nhập lại mật khẩu mới..."
                          error={errors.confirmPassword}
                        />
                      </div>
                    </div>

                    {/* Submit Buttons */}
                    <div className="flex gap-3 pt-6 justify-end border-t border-gray-150">
                      <Button
                        type="button"
                        variant="outline"
                        onClick={handleCancelEdit}
                        className="h-10 px-5 rounded-xl cursor-pointer"
                        disabled={isSubmitting}
                      >
                        Hủy bỏ
                      </Button>
                      <Button
                        type="submit"
                        className="h-10 px-6 rounded-xl cursor-pointer font-bold"
                        disabled={isSubmitting}
                      >
                        {isSubmitting ? "Đang lưu..." : "Lưu thay đổi"}
                      </Button>
                    </div>
                  </form>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>
    </ProtectedRoute>
  );
}
