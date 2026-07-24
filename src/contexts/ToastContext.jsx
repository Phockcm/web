"use client";

import { createContext, useContext, useState, useCallback } from "react";

const ToastContext = createContext();

export function ToastProvider({ children }) {
  const [toasts, setToasts] = useState([]);

  const showToast = useCallback((message, type = "success", duration = 3000) => {
    const id = Date.now() + Math.random();
    setToasts((prev) => [...prev, { id, message, type }]);
    setTimeout(() => {
      setToasts((prev) => prev.filter((t) => t.id !== id));
    }, duration);
  }, []);

  const removeToast = useCallback((id) => {
    setToasts((prev) => prev.filter((t) => t.id !== id));
  }, []);

  return (
    <ToastContext.Provider value={{ showToast }}>
      {children}
      {/* Toast container */}
      <div className="fixed top-5 right-5 z-[9999] flex flex-col gap-2.5 pointer-events-none">
        {toasts.map((toast) => (
          <div
            key={toast.id}
            className={`pointer-events-auto flex items-start gap-3 px-4 py-3.5 rounded-2xl shadow-xl border text-sm font-medium max-w-[340px] animate-slide-in
              ${toast.type === "success" ? "bg-white border-green-200 text-gray-800" : ""}
              ${toast.type === "error"   ? "bg-white border-red-200   text-gray-800" : ""}
              ${toast.type === "info"    ? "bg-white border-blue-200  text-gray-800" : ""}
            `}
          >
            <span className="text-lg shrink-0">
              {toast.type === "success" && "✅"}
              {toast.type === "error"   && "❌"}
              {toast.type === "info"    && "ℹ️"}
            </span>
            <span className="leading-relaxed">{toast.message}</span>
            <button
              onClick={() => removeToast(toast.id)}
              className="ml-auto text-gray-400 hover:text-gray-600 shrink-0 font-bold cursor-pointer"
            >
              ✕
            </button>
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  );
}

export function useToast() {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error("useToast must be used within a ToastProvider");
  }
  return context;
}
