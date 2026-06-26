"use client";

import { useState, useEffect } from "react";
import Table from "@/components/common/Table";
import Card from "@/components/common/Card";
import { getAllOrders, updateOrderStatus } from "@/services/orderServices";

export default function OrdersManagement() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filterStatus, setFilterStatus] = useState("All");

  const fetchOrders = async () => {
    try {
      const data = await getAllOrders();
      setOrders(data);
    } catch (error) {
      console.error("Error loading orders:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchOrders();
  }, []);

  const handleStatusChange = async (id, newStatus) => {
    try {
      setLoading(true);
      await updateOrderStatus(id, newStatus);
      fetchOrders();
    } catch (error) {
      console.error("Error updating order status:", error);
      alert("Không thể cập nhật trạng thái đơn hàng.");
    }
  };

  const filteredOrders = filterStatus === "All"
    ? orders
    : orders.filter((order) => order.status?.toLowerCase() === filterStatus.toLowerCase());

  const columns = [
    {
      key: "id",
      label: "Mã đơn",
      render: (row) => <span className="font-mono text-blue-600 font-semibold">#{row.id}</span>
    },
    {
      key: "user_id",
      label: "Khách hàng",
      render: (row) => <span className="font-medium text-gray-700">Khách hàng #{row.user_id}</span>
    },
    {
      key: "total",
      label: "Tổng tiền",
      render: (row) => (
        <span className="font-semibold text-gray-800">
          {row.total ? parseFloat(row.total).toLocaleString("vi-VN") + "đ" : "0đ"}
        </span>
      )
    },
    {
      key: "status",
      label: "Trạng thái",
      render: (row) => {
        const status = row.status?.toLowerCase() || "pending";
        const badgeClass = status === "completed" || status === "delivered"
          ? "bg-green-50 text-green-600"
          : status === "pending"
            ? "bg-yellow-50 text-yellow-600"
            : status === "processing"
              ? "bg-blue-50 text-blue-600"
              : "bg-red-50 text-red-500";

        return (
          <span className={`px-2.5 py-1 rounded-full text-xs font-semibold capitalize ${badgeClass}`}>
            {status}
          </span>
        );
      }
    },
    {
      key: "actions",
      label: "Cập nhật trạng thái",
      render: (row) => (
        <select
          value={row.status || "pending"}
          onChange={(e) => handleStatusChange(row.id, e.target.value)}
          className="border border-gray-250 rounded-xl px-2.5 py-1.5 text-xs focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200"
        >
          <option value="pending">Chờ xử lý (Pending)</option>
          <option value="processing">Đang xử lý (Processing)</option>
          <option value="completed">Hoàn thành (Completed)</option>
          <option value="cancelled">Đã hủy (Cancelled)</option>
        </select>
      )
    }
  ];

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 bg-white p-6 rounded-2xl border border-gray-150">
        <div>
          <h2 className="text-xl font-bold text-gray-800">Quản lý đơn hàng</h2>
          <p className="text-xs text-gray-400 mt-1">Theo dõi, kiểm tra và cập nhật trạng thái đơn hàng của khách hàng.</p>
        </div>
        
        <div className="flex items-center gap-2 shrink-0">
          <span className="text-xs font-semibold text-gray-500">Lọc trạng thái:</span>
          <select 
            value={filterStatus}
            onChange={(e) => setFilterStatus(e.target.value)}
            className="border border-gray-250 rounded-xl px-4 py-2.5 text-xs focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 bg-white"
          >
            <option value="All">Tất cả</option>
            <option value="pending">Chờ xử lý</option>
            <option value="processing">Đang xử lý</option>
            <option value="completed">Hoàn thành</option>
            <option value="cancelled">Đã hủy</option>
          </select>
        </div>
      </div>

      <Card title="Danh sách đơn hàng" bodyClassName="!p-0">
        {loading ? (
          <p className="text-center py-10 text-gray-500">Đang tải danh sách đơn hàng...</p>
        ) : (
          <Table columns={columns} data={filteredOrders} rowKey="id" />
        )}
      </Card>
    </div>
  );
}
