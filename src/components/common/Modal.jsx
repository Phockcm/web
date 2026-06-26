export default function Modal({ isOpen, onClose, title, children }) {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-gray-900/60 backdrop-blur-xs transition-opacity duration-300">
      <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg overflow-hidden transform scale-100 transition-transform duration-300">
        <header className="px-6 py-5 border-b border-gray-100 flex items-center justify-between">
          <h3 className="text-base font-semibold text-gray-800">{title}</h3>
          <button 
            onClick={onClose} 
            className="text-2xl text-gray-400 hover:text-gray-650 transition-colors focus:outline-none"
          >
            &times;
          </button>
        </header>

        <div className="p-6">
          {children}
        </div>
      </div>
    </div>
  );
}
