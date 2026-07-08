import axiosClient from "@/libs/axiosClient";

export async function getUsers({ page = 1, pageSize = 100000, search } = {}) {
    const params = new URLSearchParams();
    params.append("pagination[page]", page);
    params.append("pagination[pageSize]", pageSize);
    if (search) {
        // AuthController only has 'role' in allowedFilters, so we will fetch 
        // the list and perform search filtering client-side for maximum flexibility.
    }
    const res = await axiosClient.get(`/usersByPageSize?${params.toString()}`);
    return res.data.data || res.data;
}

export async function updateUser(id, userData) {
    const res = await axiosClient.put(`/users/${id}`, userData);
    return res.data;
}

export async function deleteUser(id) {
    const res = await axiosClient.delete(`/users/${id}`);
    return res.data;
}
