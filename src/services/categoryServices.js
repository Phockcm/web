import axiosClient from "@/libs/axiosClient";

export async function getAllCategories() {
    const res = await axiosClient.get("/categories");
    return res.data.categories || res.data;
}

export async function getActiveCategories() {
    const res = await axiosClient.get("/activeCategories");
    return res.data;
}

export async function getParentCategories() {
    const res = await axiosClient.get("/parentCategories");
    return res.data;
}

export async function getCategoryById(id) {
    const res = await axiosClient.get(`/showById/${id}`);
    return res.data.data || res.data;
}

export async function getCategoryBySlug(slug) {
    const res = await axiosClient.get(`/showBySlug/${slug}`);
    return res.data.data || res.data;
}

export async function createCategory(categoryData) {
    const res = await axiosClient.post("/categories", categoryData);
    return res.data;
}

export async function updateCategory(id, categoryData) {
    // Laravel requires _method: 'PUT' if there is any multipart upload, but for simple JSON PUT is fine.
    // However, to be safe and consistent, let's pass it in the body.
    const res = await axiosClient.put(`/categories/${id}`, categoryData);
    return res.data;
}

export async function deleteCategory(id) {
    const res = await axiosClient.delete(`/categories/${id}`);
    return res.data;
}
