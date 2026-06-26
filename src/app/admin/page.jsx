import Card from "@/components/common/Card";
import Table from "@/components/common/Table";

export default function AdminDashboard() {
  const stats = [
    { label: "Doanh thu", value: "120.000.000₫", icon: "💰", change: "+12%", color: "text-green-600 bg-green-50" },
    { label: "Đơn hàng", value: "340", icon: "📋", change: "+5%", color: "text-blue-600 bg-blue-50" },
    { label: "Sản phẩm", value: "86", icon: "📦", change: "+2", color: "text-indigo-600 bg-indigo-50" },
    { label: "Khách hàng", value: "1.240", icon: "👥", change: "+8%", color: "text-purple-600 bg-purple-50" },
  ];

  const recentOrders = [
    { id: "DH001", customer: "Nguyễn Văn A", product: "Áo thun basic × 2", amount: "450.000₫", status: "Hoàn thành" },
    { id: "DH002", customer: "Trần Thị B", product: "Quần jeans slim × 1", amount: "320.000₫", status: "Đang xử lý" },
    { id: "DH003", customer: "Lê Minh C", product: "Giày sneaker × 1", amount: "890.000₫", status: "Đang giao" },
    { id: "DH004", customer: "Phạm Thu D", product: "Túi xách × 1", amount: "1.200.000₫", status: "Đã hủy" },
  ];

  const columns = [
    {
      key: "id",
      label: "Mã đơn",
      render: (row) => <span className="font-mono text-blue-600 font-semibold">#{row.id}</span>
    },
    { key: "customer", label: "Khách hàng" },
    { key: "product", label: "Sản phẩm" },
    {
      key: "amount",
      label: "Tổng tiền",
      render: (row) => <span className="font-semibold text-gray-800">{row.amount}</span>
    },
    {
      key: "status",
      label: "Trạng thái",
      render: (row) => {
        const isCompleted = row.status === "Hoàn thành";
        const isPending = row.status === "Đang xử lý";
        const isShipping = row.status === "Đang giao";

        const badgeClass = isCompleted
          ? "bg-green-50 text-green-600"
          : isPending
            ? "bg-yellow-50 text-yellow-600"
            : isShipping
              ? "bg-blue-50 text-blue-600"
              : "bg-red-50 text-red-500";

        return (
          <span className={`px-2.5 py-1 rounded-full text-xs font-semibold ${badgeClass}`}>
            {row.status}
          </span>
        );
      }
    }
  ];

  return (
    <div className="space-y-6">
      {/* Stat Cards Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
        {stats.map((stat, index) => (
          <div
            key={index}
            className="bg-white rounded-2xl border border-gray-150 p-5 shadow-xs flex flex-col justify-between hover:shadow-md transition-shadow duration-300"
          >
            <div className="flex items-start justify-between">
              <span className="text-3xl">{stat.icon}</span>
              <span className={`px-2 py-0.5 rounded-full text-[10px] font-bold ${stat.color}`}>
                {stat.change}
              </span>
            </div>
            <div className="mt-4">
              <p className="text-xs font-semibold text-gray-400 uppercase tracking-wider">{stat.label}</p>
              <p className="text-2xl font-extrabold text-gray-850 mt-1">{stat.value}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Recent Orders table inside Card */}
      <Card title="Đơn hàng gần đây" bodyClassName="!p-0">
        <Table columns={columns} data={recentOrders} rowKey="id" />
      </Card>
    </div>
  );
}

