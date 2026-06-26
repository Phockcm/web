export default function Table({ 
  columns = [], 
  data = [], 
  rowKey = "id",
  className = "" 
}) {
  return (
    <div className={`overflow-x-auto w-full rounded-xl border border-gray-150 ${className}`}>
      <table className="w-full text-sm text-left text-gray-750 border-collapse">
        <thead className="text-xs text-gray-400 uppercase bg-gray-50 border-b border-gray-200">
          <tr>
            {columns.map((col) => (
              <th 
                key={col.key} 
                className="px-6 py-4 font-semibold text-gray-700 tracking-wider"
              >
                {col.label}
              </th>
            ))}
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100 bg-white">
          {data.length === 0 ? (
            <tr>
              <td 
                colSpan={columns.length} 
                className="px-6 py-10 text-center text-gray-400 bg-white"
              >
                Không có dữ liệu
              </td>
            </tr>
          ) : (
            data.map((row, rowIndex) => (
              <tr 
                key={row[rowKey] || rowIndex} 
                className="hover:bg-gray-50 transition-colors duration-150"
              >
                {columns.map((col) => (
                  <td key={col.key} className="px-6 py-4.5 whitespace-nowrap text-gray-800">
                    {col.render ? col.render(row, rowIndex) : row[col.key]}
                  </td>
                ))}
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}

