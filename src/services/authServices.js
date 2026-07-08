import axiosClient from "@/libs/axiosClient";

export async function register(data) {
  const res = await axiosClient.post("/auth/local/register", data);
  return res.data;
}

export async function login(data) {
  const res = await axiosClient.post("/auth/local", data);
  return res.data;
}

export async function loginAdmin(data) {
  const res = await axiosClient.post("/admin/login", data);
  return res.data;
}

export async function getCurrentUser() {
  const res = await axiosClient.get("/auth/me");
  return res.data.data || res.data;
}

export async function logout() {
  const res = await axiosClient.post("/auth/logout");
  return res.data;
}

export async function updateMe(formData) {
  // Use POST with _method=PUT to allow file uploads over PUT in Laravel
  const res = await axiosClient.post("/auth/me", formData, {
    headers: {
      "Content-Type": "multipart/form-data",
    },
  });
  return res.data;
}
