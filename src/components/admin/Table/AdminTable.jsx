import Table from "@/components/common/Table";

export default function AdminTable({ 
  columns = [], 
  data = [], 
  products,
  onView,
  onEdit, 
  onDelete, 
  rowKey = "id",
  ...props 
}) {
  const items = products || data || [];
  // Append an Action column
  const actionColumn = {
    key: "actions",
    label: "Hành động",
    render: (row) => (
      <div className="flex items-center gap-2.5">
        {onView && (
          <button
            onClick={() => onView(row)}
            className="text-xs font-semibold text-green-600 hover:text-green-800 transition-colors bg-green-50 hover:bg-green-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Chi tiết
          </button>
        )}
        {onEdit && (
          <button
            onClick={() => onEdit(row)}
            className="text-xs font-semibold text-blue-650 hover:text-blue-800 transition-colors bg-blue-50 hover:bg-blue-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Sửa
          </button>
        )}
        {onDelete && (
          <button
            onClick={() => onDelete(row)}
            className="text-xs font-semibold text-red-600 hover:text-red-800 transition-colors bg-red-50 hover:bg-red-100 px-3 py-1.5 rounded-lg cursor-pointer"
          >
            Xóa
          </button>
        )}
      </div>
    )
  };

  const adminColumns = [...columns, actionColumn];

  return (
    <Table 
      columns={adminColumns} 
      data={items} 
      rowKey={rowKey}
      {...props} 
    />
  );
}