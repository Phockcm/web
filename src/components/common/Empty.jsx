export default function Empty({ message = "Không có dữ liệu" }) {
  return (
    <div className="flex flex-col items-center justify-center p-8 text-center bg-white border border-dashed border-gray-200 rounded-2xl">
      <span className="text-4xl mb-3">📭</span>
      <p className="text-sm font-medium text-gray-400">{message}</p>
    </div>
  );
}
