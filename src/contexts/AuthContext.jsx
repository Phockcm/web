"use client";

import { createContext, useContext, useState, useEffect } from "react";
import { login as apiLogin, loginAdmin as apiLoginAdmin, register as apiRegister, logout as apiLogout, getCurrentUser } from "@/services/authServices";
import { useRouter } from "next/navigation";

const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const router = useRouter();

  const reloadUser = async () => {
    if (typeof window !== "undefined") {
      const token = localStorage.getItem("token");
      if (token) {
        try {
          const userData = await getCurrentUser();
          setUser(userData);
          localStorage.setItem("user", JSON.stringify(userData));
          return userData;
        } catch (error) {
          console.error("Failed to load user with token", error);
          // If token is invalid or expired, clear it
          localStorage.removeItem("token");
          localStorage.removeItem("user");
          setUser(null);
        }
      }
    }
    return null;
  };

  // Load user from token on mount / reload
  useEffect(() => {
    reloadUser().finally(() => setLoading(false));
  }, []);

  const login = async (username, password) => {
    try {
      setLoading(true);
      const res = await apiLogin({ username, password });
      if (res.access_token) {
        localStorage.setItem("token", res.access_token);
        localStorage.setItem("user", JSON.stringify(res.data));
        setUser(res.data);
        router.push("/");
        return { success: true };
      }
      return { success: false, message: "Không nhận được mã xác thực (Access Token)" };
    } catch (error) {
      console.error("Login error in AuthContext", error);
      let errMsg = error.response?.data?.message || "Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.";
      if (errMsg === "Invalid credentials") {
        errMsg = "Tài khoản hoặc mật khẩu không chính xác!";
      } else if (errMsg === "Access denied. Admin only.") {
        errMsg = "Từ chối truy cập. Tài khoản này không có quyền Admin!";
      }
      return { success: false, message: errMsg };
    } finally {
      setLoading(false);
    }
  };

  const loginAdmin = async (username, password) => {
    try {
      setLoading(true);
      const res = await apiLoginAdmin({ username, password });
      if (res.access_token) {
        localStorage.setItem("token", res.access_token);
        localStorage.setItem("user", JSON.stringify(res.data));
        setUser(res.data);
        router.push("/admin");
        return { success: true };
      }
      return { success: false, message: "Không nhận được mã xác thực (Access Token)" };
    } catch (error) {
      console.error("Admin login error in AuthContext", error);
      let errMsg = error.response?.data?.message || "Đăng nhập admin thất bại.";
      if (errMsg === "Invalid credentials") {
        errMsg = "Tài khoản hoặc mật khẩu admin không chính xác!";
      } else if (errMsg === "Access denied. Admin only.") {
        errMsg = "Từ chối truy cập. Tài khoản này không có quyền Admin!";
      }
      return { success: false, message: errMsg };
    } finally {
      setLoading(false);
    }
  };

  const register = async (formData) => {
    try {
      setLoading(true);
      const res = await apiRegister(formData);
      if (res.access_token) {
        localStorage.setItem("token", res.access_token);
        localStorage.setItem("user", JSON.stringify(res.data));
        setUser(res.data);
        if (res.data.role === "admin") {
          router.push("/admin");
        } else {
          router.push("/");
        }
        return { success: true };
      }
      return { success: false, message: "Không nhận được mã xác thực (Access Token)" };
    } catch (error) {
      console.error("Registration error in AuthContext", error);
      const errors = error.response?.data?.errors;
      let errMsg = error.response?.data?.message || "Đăng ký thất bại.";
      if (errors) {
        // Collect validation error messages
        const firstErrorKey = Object.keys(errors)[0];
        if (errors[firstErrorKey] && errors[firstErrorKey].length > 0) {
          errMsg = errors[firstErrorKey][0];
        }
      } else {
        if (errMsg === "Validation failed") {
          errMsg = "Đăng ký thất bại. Vui lòng điền đầy đủ và đúng định dạng các trường thông tin!";
        }
      }
      return { success: false, message: errMsg };
    } finally {
      setLoading(false);
    }
  };

  const logout = async () => {
    try {
      // Best effort logout on server
      await apiLogout();
    } catch (error) {
      console.error("Server logout error", error);
    } finally {
      localStorage.removeItem("token");
      localStorage.removeItem("user");
      setUser(null);
      router.push("/login");
    }
  };

  const isAuthenticated = !!user;

  return (
    <AuthContext.Provider
      value={{
        user,
        loading,
        isAuthenticated,
        login,
        loginAdmin,
        register,
        logout,
        reloadUser,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
}
