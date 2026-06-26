import axiosClient from "@/libs/axiosClient";

export async function getAllOrders() {
    const res = await axiosClient.get("/orders");
    return res.data.orders || res.data;
}

export async function updateOrderStatus(id, status) {
    const res = await axiosClient.patch(`/updateStatusOrder/${id}`, { status });
    return res.data;
}
