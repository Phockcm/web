export default function AdminHeader({ title = "Dashboard" }) {
  return (
    <header className="bg-white border-b border-gray-200 px-8 py-4 flex items-center justify-between flex-shrink-0 h-16">
      <h1 className="text-lg font-semibold text-gray-800">{title}</h1>
      <div className="flex items-center gap-3">
        {/* Notification Bell */}
        <button className="relative w-9 h-9 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors focus:outline-none">
          <span className="text-lg">🔔</span>
          <span className="absolute top-1.5 right-1.5 w-2 h-2 bg-yellow-450 rounded-full"></span>
        </button>
        {/* Avatar & Info */}
        <div className="flex items-center gap-2">
          <div className="w-9 h-9 rounded-full bg-blue-650 flex items-center justify-center text-white font-bold text-sm">
            A
          </div>
          <span className="text-sm font-semibold text-gray-700">Admin</span>
        </div>
      </div>
    </header>
  );
}
