"use client";

export default function CartItem({ item, onUpdateQuantity, onRemove }) {
  if (!item) return null;

  const { id, name, price, image, quantity, brand } = item;

  const formattedPrice = typeof price === 'number'
    ? new Intl.NumberFormat('vi-VN').format(price) + 'đ'
    : price;

  const formattedTotal = typeof price === 'number'
    ? new Intl.NumberFormat('vi-VN').format(price * quantity) + 'đ'
    : price;

  const imageSrc = image && (image.startsWith('http://') || image.startsWith('https://') || image.startsWith('/'))
    ? image
    : `/shop/images/${image}`;

  return (
    <tr className="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
      <td className="py-4 px-4">
        <div className="flex items-center gap-4">
          <img 
            src={imageSrc} 
            alt={name}
            className="w-16 h-16 object-cover rounded-xl border border-gray-150 bg-gray-50"
          />
          <div>
            {brand && (
              <span className="text-xs font-bold text-blue-600 uppercase tracking-wider block mb-0.5">
                {brand}
              </span>
            )}
            <h4 className="font-semibold text-gray-800 text-sm leading-snug">
              {name}
            </h4>
          </div>
        </div>
      </td>
      <td className="py-4 px-4 text-gray-700 font-medium text-sm">
        {formattedPrice}
      </td>
      <td className="py-4 px-4">
        <div className="flex items-center border border-gray-200 rounded-lg bg-gray-50 p-0.5 w-fit">
          <button
            onClick={() => onUpdateQuantity(id, Math.max(1, quantity - 1))}
            className="w-8 h-8 flex items-center justify-center text-gray-600 font-bold hover:bg-white rounded transition-colors border-0 cursor-pointer"
          >
            -
          </button>
          <span className="w-10 text-center font-semibold text-gray-800 text-sm">
            {quantity}
          </span>
          <button
            onClick={() => onUpdateQuantity(id, quantity + 1)}
            className="w-8 h-8 flex items-center justify-center text-gray-600 font-bold hover:bg-white rounded transition-colors border-0 cursor-pointer"
          >
            +
          </button>
        </div>
      </td>
      <td className="py-4 px-4 text-red-500 font-bold text-sm">
        {formattedTotal}
      </td>
      <td className="py-4 px-4">
        <button
          onClick={() => onRemove(id)}
          className="bg-red-50 hover:bg-red-150 text-red-600 hover:text-red-800 px-3 py-1.5 rounded-lg border-0 cursor-pointer transition-colors text-xs font-semibold flex items-center gap-1"
        >
          <i className="fa fa-trash"></i>
          <span>Xóa</span>
        </button>
      </td>
    </tr>
  );
}
