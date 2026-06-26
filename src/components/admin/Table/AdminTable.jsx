import Table from "@/components/common/Table";

export default function AdminTable({ 
  columns = [], 
  data = [], 
  products,
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
        {onEdit && (
          <button
            onClick={() => onEdit(row)}
            className="text-xs font-semibold text-blue-650 hover:text-blue-800 transition-colors bg-blue-50 hover:bg-blue-100 px-3 py-1.5 rounded-lg"
          >
            Sửa
          </button>
        )}
        {onDelete && (
          <button
            onClick={() => onDelete(row)}
            className="text-xs font-semibold text-red-600 hover:text-red-800 transition-colors bg-red-50 hover:bg-red-100 px-3 py-1.5 rounded-lg"
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