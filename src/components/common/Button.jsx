export default function Button({ 
  children, 
  onClick, 
  type = "button", 
  variant = "primary", 
  size = "md",
  className = "",
  disabled = false,
  ...props 
}) {
  const baseStyle = "inline-flex items-center justify-center font-medium rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2";
  
  const variants = {
    primary: "bg-blue-600 hover:bg-blue-700 text-white focus:ring-blue-500 disabled:bg-blue-300",
    secondary: "bg-gray-200 hover:bg-gray-300 text-gray-850 focus:ring-gray-400 disabled:bg-gray-100 disabled:text-gray-400",
    danger: "bg-red-600 hover:bg-red-700 text-white focus:ring-red-500 disabled:bg-red-300",
    success: "bg-green-600 hover:bg-green-700 text-white focus:ring-green-500 disabled:bg-green-300",
    outline: "border border-gray-300 hover:bg-gray-50 text-gray-700 focus:ring-blue-500 disabled:bg-transparent disabled:text-gray-300",
  };

  const sizes = {
    sm: "px-3 py-1.5 text-xs",
    md: "px-4 py-2 text-sm",
    lg: "px-5 py-2.5 text-base",
  };

  const combinedClass = `${baseStyle} ${variants[variant] || variants.primary} ${sizes[size] || sizes.md} ${className} ${disabled ? "cursor-not-allowed opacity-60" : ""}`;

  return (
    <button 
      type={type} 
      onClick={onClick} 
      className={combinedClass} 
      disabled={disabled}
      {...props}
    >
      {children}
    </button>
  );
}