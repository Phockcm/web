import ProductCard from "@/components/shop/product/ProductCard";

export default function ProductList({ data, products }) {
  const items = products || data || [];
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {items.map((product, index) => (
        <ProductCard key={product.id || index} product={product} />
      ))}
    </div>
  );
}
