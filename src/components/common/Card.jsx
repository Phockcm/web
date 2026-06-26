export default function Card({ 
  children, 
  title, 
  headerAction,
  className = "",
  bodyClassName = "",
  ...props 
}) {
  return (
    <div 
      className={`bg-white rounded-2xl border border-gray-150 shadow-sm overflow-hidden transition-all duration-300 hover:shadow-md ${className}`}
      {...props}
    >
      {title && (
        <div className="px-6 py-5 border-b border-gray-100 flex items-center justify-between">
          <h3 className="text-sm font-semibold text-gray-700">{title}</h3>
          {headerAction && <div>{headerAction}</div>}
        </div>
      )}
      <div className={`p-6 ${bodyClassName}`}>
        {children}
      </div>
    </div>
  );
}
