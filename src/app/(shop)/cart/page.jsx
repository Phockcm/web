import Link from "next/link";

export default function CartPage() {
  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>Shopping Cart</h2>
              <span>Review and manage your selected items</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <div className="cart-content">
                <table className="table">
                  <thead>
                    <tr>
                      <th>Product</th>
                      <th>Price</th>
                      <th>Quantity</th>
                      <th>Total</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Your cart is currently empty</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-6">
              <div className="continue-shopping">
                <div className="main-border-button">
                  <Link href="/products">Continue Shopping</Link>
                </div>
              </div>
            </div>
            <div className="col-lg-6">
              <div className="cart-summary">
                <h4>Cart Summary</h4>
                <div className="summary-item">
                  <span>Subtotal:</span>
                  <span>$0.00</span>
                </div>
                <div className="summary-item">
                  <span>Shipping:</span>
                  <span>$0.00</span>
                </div>
                <div className="summary-item">
                  <span>Tax:</span>
                  <span>$0.00</span>
                </div>
                <div className="summary-total">
                  <span>Total:</span>
                  <span>$0.00</span>
                </div>
                <div className="main-border-button">
                  <Link href="/checkout">Proceed to Checkout</Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
