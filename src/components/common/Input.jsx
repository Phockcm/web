export default function Input({ 
  label, 
  error, 
  value, 
  onChange, 
  type = "text", 
  placeholder = "", 
  className = "",
  containerClassName = "",
  ...rest 
}) {
  return (
    <div className={`flex flex-col gap-1.5 w-full ${containerClassName}`}>
      {label && (
        <label className="text-xs font-semibold text-gray-650">
          {label}
        </label>
      )}
      <input
        type={type}
        value={value}
        onChange={onChange}
        placeholder={placeholder}
        className={`w-full border border-gray-250 rounded-xl px-4.5 py-3 text-sm placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-150 focus:border-blue-500 transition-all duration-200 disabled:bg-gray-50 disabled:text-gray-400 ${
          error ? "border-red-500 focus:ring-red-100 focus:border-red-500" : ""
        } ${className}`}
        {...rest}
      />
      {error && (
        <span className="text-xs text-red-500 mt-0.5">{error}</span>
      )}
    </div>
  );
}
