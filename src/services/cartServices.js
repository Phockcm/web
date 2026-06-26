import axiosClient from "@/libs/axiosClient";

export async function saveOrder(orderData) {
    const res = await axiosClient.post("/saveOrder", orderData);
    return res.data;
}
