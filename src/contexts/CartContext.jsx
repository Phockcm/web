"use client";

import { createContext, useContext, useState, useEffect, useCallback } from "react";

const CartContext = createContext();

const CART_KEY = "shop_cart";

function loadCart() {
  if (typeof window === "undefined") return [];
  try {
    const raw = localStorage.getItem(CART_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function saveCart(items) {
  if (typeof window === "undefined") return;
  localStorage.setItem(CART_KEY, JSON.stringify(items));
}

export function CartProvider({ children }) {
  const [cartItems, setCartItems] = useState([]);
  const [mounted, setMounted] = useState(false);

  // Load from localStorage on mount
  useEffect(() => {
    setCartItems(loadCart());
    setMounted(true);
  }, []);

  // Persist to localStorage on every change
  useEffect(() => {
    if (mounted) {
      saveCart(cartItems);
    }
  }, [cartItems, mounted]);

  /**
   * Add a product to cart. Respects stock limit (product.qty).
   * Returns: { success: boolean, message: string }
   */
  const addToCart = useCallback((product, quantity = 1) => {
    const stock = Number(product.qty ?? product.stock ?? 9999);
    const productId = product.id;

    let result = { success: false, message: "" };

    setCartItems((prev) => {
      const existing = prev.find((item) => item.id === productId);
      const currentQty = existing ? existing.quantity : 0;
      const newQty = currentQty + quantity;

      if (currentQty >= stock) {
        result = {
          success: false,
          message: `Sản phẩm "${product.product_name || product.name}" đã đạt số lượng tối đa trong kho (${stock} sản phẩm)`,
        };
        return prev;
      }

      const clampedQty = Math.min(newQty, stock);
      const added = clampedQty - currentQty;

      if (existing) {
        result = {
          success: true,
          message: `Đã thêm ${added} "${product.product_name || product.name}" vào giỏ hàng`,
          clampedQty,
          stock,
        };
        return prev.map((item) =>
          item.id === productId ? { ...item, quantity: clampedQty } : item
        );
      } else {
        result = {
          success: true,
          message: `Đã thêm "${product.product_name || product.name}" vào giỏ hàng`,
          clampedQty,
          stock,
        };
        return [
          ...prev,
          {
            id: productId,
            product_name: product.product_name || product.name,
            price: product.price,
            image: product.image,
            slug: product.slug,
            qty: stock,
            quantity: clampedQty,
          },
        ];
      }
    });

    return result;
  }, []);

  /**
   * Update the quantity of a specific item.
   * Clamps between 1 and stock.
   */
  const updateQuantity = useCallback((productId, newQty) => {
    setCartItems((prev) =>
      prev.map((item) => {
        if (item.id !== productId) return item;
        const clamped = Math.max(1, Math.min(newQty, item.qty));
        return { ...item, quantity: clamped };
      })
    );
  }, []);

  /**
   * Remove a single product from the cart.
   */
  const removeFromCart = useCallback((productId) => {
    setCartItems((prev) => prev.filter((item) => item.id !== productId));
  }, []);

  /**
   * Clear the entire cart.
   */
  const clearCart = useCallback(() => {
    setCartItems([]);
  }, []);

  // Total number of items (sum of quantities)
  const cartCount = cartItems.reduce((sum, item) => sum + item.quantity, 0);

  // Total price
  const cartTotal = cartItems.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );

  return (
    <CartContext.Provider
      value={{
        cartItems,
        cartCount,
        cartTotal,
        addToCart,
        updateQuantity,
        removeFromCart,
        clearCart,
        mounted,
      }}
    >
      {children}
    </CartContext.Provider>
  );
}

export function useCart() {
  const context = useContext(CartContext);
  if (!context) {
    throw new Error("useCart must be used within a CartProvider");
  }
  return context;
}
