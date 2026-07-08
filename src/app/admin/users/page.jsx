"use client";

import { useState, useEffect } from "react";
import { useAuth } from "@/contexts/AuthContext";
import Table from "@/components/common/Table";
import Button from "@/components/common/Button";
import Modal from "@/components/common/Modal";
import Input from "@/components/common/Input";
import Empty from "@/components/common/Empty";
import { getUsers, updateUser, deleteUser } from "@/services/userServices";

export default function UsersManagement() {
  const { user: currentAdmin } = useAuth();
  
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [showModal, setShowModal] = useState(false);
  const [editingUser, setEditingUser] = useState(null);

  // Form state
  const [formData, setFormData] = useState({
    name: "",
    username: "",
    email: "",
    phone: "",
    address: "",
    role: "user",
    password: "",
  });
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Fetch users from database
  const fetchUsers = async () => {
    try {
      setLoading(true);
      const data = await getUsers();
      setUsers(data || []);
    } catch (error) {
      console.error("Error loading users:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  // Filter users client-side
  const filteredUsers = users.filter((u) => {
    const term = search.toLowerCase();
    return (
      (u.name && u.name.toLowerCase().includes(term)) ||
      (u.username && u.username.toLowerCase().includes(term)) ||
      (u.email && u.email.toLowerCase().includes(term)) ||
      (u.phone && u.phone.includes(term))
    );
  });

  const handleOpenEdit = (userToEdit) => {
    setEditingUser(userToEdit);
    setFormData({
      name: userToEdit.name || "",
      username: userToEdit.username || "",
      email: userToEdit.email || "",
      phone: userToEdit.phone || "",
      address: userToEdit.address || "",
      role: userToEdit.role || "user",
      password: "", // empty to start, only filled if changing password
    });
    setErrors({});
    setShowModal(true);
  };

  const handleFormChange = (key, value) => {
    setFormData((prev) => ({ ...prev, [key]: value }));
    if (errors[key]) {
      setErrors((prev) => ({ ...prev, [key]: "" }));
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
          newErrors.email = "Email phải có đuôi là .com";
        } else {
          const provider = domain.substring(0, domain.length - 4); // Remove ".com"
          if (provider !== "gmail" && provider !== "outlook") {
            newErrors.email = "Sau ký tự @ phải là gmail hoặc outlook (ví dụ: @gmail.com hoặc @outlook.com)";
          }
        }
      }
    }

    // Phone Validation
    if (!formData.phone || !formData.phone.trim()) {
      newErrors.phone = "Số điện thoại không được để trống.";
    } else {
      const phoneRegex = /^\d{10}$/;
      if (!phoneRegex.test(formData.phone.trim())) {
        newErrors.phone = "Số điện thoại phải đủ 10 số và chỉ chứa chữ số.";
      }
    }

    if (formData.password && formData.password.length < 6) {
      newErrors.password = "Mật khẩu mới phải có ít nhất 6 ký tự.";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    setIsSubmitting(true);
    try {
      const payload = { ...formData };
      if (!payload.password) {
        delete payload.password; // do not update password if not provided
      }
      
      await updateUser(editingUser.id, payload);
      alert("Cập nhật thông tin tài khoản thành công!");
      setShowModal(false);
      fetchUsers();
    } catch (error) {
      console.error("Error updating user:", error);
      const backendMessage = error.response?.data?.message || "";
      if (backendMessage.includes("username")) {
        setErrors((prev) => ({ ...prev, username: "Tên đăng nhập đã tồn tại trong hệ thống." }));
      } else if (backendMessage.includes("email")) {
        setErrors((prev) => ({ ...prev, email: "Email đã tồn tại trong hệ thống." }));
      } else {
        alert("Đã xảy ra lỗi khi cập nhật tài khoản. Vui lòng kiểm tra lại!");
      }
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleDeleteUser = async (u) => {
    if (currentAdmin && String(u.id) === String(currentAdmin.id)) {
      alert("Bạn không thể tự xóa tài khoản của chính mình!");
      return;
    }

    if (confirm(`Bạn chắc chắn muốn xóa tài khoản ${u.username} (${u.name})?`)) {
      try {
        setLoading(true);
        await deleteUser(u.id);
        alert("Xóa tài khoản thành công!");
        fetchUsers();
      } catch (error) {
        console.error("Error deleting user:", error);
        alert("Đã xảy ra lỗi khi xóa tài khoản.");
        setLoading(false);
      }
    }
  };

  const tableColumns = [
    {
      key: "id",
      label: "Avatar",
      render: (row) => {
        let avatarSrc = "https://via.placeholder.com/40";
        if (row.image) {
          avatarSrc = row.image.startsWith("http")
            ? row.image
            : `http://127.0.0.1:8000/storage/${row.image}`;
        }
        return (
          <div className="w-9 h-9 rounded-full overflow-hidden border border-gray-200 bg-gray-50 flex items-center justify-center font-bold text-xs text-blue-650">
            {row.image ? (
              <img src={avatarSrc} alt={row.name} className="w-full h-full object-cover" />
            ) : (
              (row.name || "U").substring(0, 1).toUpperCase()
            )}
          </div>
        );
      },
    },
    { key: "name", label: "Họ và tên" },
    { key: "username", label: "Tên đăng nhập" },
    { key: "email", label: "Email" },
    { key: "phone", label: "Số điện thoại", render: (row) => row.phone || "—" },
    { key: "address", label: "Địa chỉ", render: (row) => row.address || "—" },
    {
      key: "role",
      label: "Quyền hạn",
      render: (row) => {
        const isAdmin = row.role === "admin";
        return (
          <span
            className={`px-2.5 py-1 rounded-full text-xs font-semibold ${
              isAdmin ? "bg-blue-50 text-blue-600" : "bg-gray-100 text-gray-600"
            }`}
          >
            {isAdmin ? "Admin" : "Khách hàng"}
          </span>
        );
      },
    },
    {
      key: "actions",
      label: "Hành động",
      render: (row) => (
        <div className="flex items-center gap-2.5">
          <button
            onClick={() => handleOpenEdit(row)}
            className="text-xs font-semibold text-blue-650 hover:text-blue-800 transition-colors bg-blue-50 hover:bg-blue-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Sửa
          </button>
          {currentAdmin && String(row.id) !== String(currentAdmin.id) && (
            <button
              onClick={() => handleDeleteUser(row)}
              className="text-xs font-semibold text-red-650 hover:text-red-800 transition-colors bg-red-50 hover:bg-red-100 px-3 py-1.5 rounded-lg cursor-pointer"
            >
              Xóa
            </button>
          )}
        </div>
      ),
    },
  ];

  return (
    <div className="space-y-6">
      {/* Header & Search */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 bg-white p-6 rounded-2xl border border-gray-150 shadow-xs">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Quản lý tài khoản</h2>
          <p className="text-xs text-gray-400 mt-1">
            Quản lý thông tin tài khoản Admin và Khách hàng đăng ký trên web shop.
          </p>
        </div>
        
        {/* Search bar */}
        <div className="relative w-full md:w-72 shrink-0">
          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-sm pointer-events-none">🔍</span>
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Tìm kiếm tài khoản..."
            className="w-full pl-10 pr-10 py-2.5 text-sm border border-gray-250 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500 transition-all duration-200"
          />
          {search && (
            <button
              onClick={() => setSearch("")}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 font-bold text-xs p-1 cursor-pointer"
            >
              ✕
            </button>
          )}
        </div>
      </div>

      {/* Users List Table */}
      <div className="bg-white rounded-2xl border border-gray-150 p-6 shadow-xs min-h-[300px] flex flex-col justify-center">
        {loading ? (
          <div className="text-center py-10 text-gray-500">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-3"></div>
            Đang tải danh sách tài khoản...
          </div>
        ) : filteredUsers.length === 0 ? (
          <Empty message={search ? "Không tìm thấy tài khoản phù hợp" : "Chưa có tài khoản nào"} />
        ) : (
          <Table columns={tableColumns} data={filteredUsers} rowKey="id" />
        )}
      </div>

      {/* Edit User Modal */}
      {showModal && (
        <Modal
          isOpen={showModal}
          onClose={() => setShowModal(false)}
          title="Chỉnh sửa tài khoản"
        >
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
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

            <div className="grid grid-cols-2 gap-4">
              <Input
                label="Email"
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
              />
            </div>

            <Input
              label="Địa chỉ"
              value={formData.address}
              onChange={(e) => handleFormChange("address", e.target.value)}
              placeholder="Nhập địa chỉ nhà..."
              error={errors.address}
            />

            <div className="grid grid-cols-2 gap-4">
              <div className="flex flex-col gap-1.5 w-full">
                <label className="text-xs font-semibold text-gray-650">Quyền hạn</label>
                <select
                  value={formData.role}
                  onChange={(e) => handleFormChange("role", e.target.value)}
                  className="w-full border border-gray-250 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
                  required
                >
                  <option value="user">Khách hàng (User)</option>
                  <option value="admin">Quản trị viên (Admin)</option>
                </select>
              </div>

              <Input
                label="Mật khẩu mới (Bỏ trống nếu không đổi)"
                type="password"
                value={formData.password}
                onChange={(e) => handleFormChange("password", e.target.value)}
                placeholder="Nhập mật khẩu mới..."
                error={errors.password}
              />
            </div>

            <div className="flex gap-3 pt-6 justify-end border-t border-gray-150">
              <Button
                type="button"
                variant="outline"
                onClick={() => setShowModal(false)}
                className="h-11 px-5 rounded-xl cursor-pointer"
                disabled={isSubmitting}
              >
                Hủy bỏ
              </Button>
              <Button
                type="submit"
                className="h-11 px-6 rounded-xl cursor-pointer font-bold"
                disabled={isSubmitting}
              >
                {isSubmitting ? "Đang lưu..." : "Lưu thay đổi"}
              </Button>
            </div>
          </form>
        </Modal>
      )}
    </div>
  );
}
