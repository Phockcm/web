"use client";
import { useState } from 'react';

export default function CheckoutPage() {
  const [shippingInfo, setShippingInfo] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    address: '',
    city: '',
    state: '',
    zipCode: ''
  });

  const [paymentInfo, setPaymentInfo] = useState({
    cardName: '',
    cardNumber: '',
    expiryDate: '',
    cvv: ''
  });

  const handleShippingChange = (e) => {
    const { name, value } = e.target;
    setShippingInfo(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handlePaymentChange = (e) => {
    const { name, value } = e.target;
    setPaymentInfo(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Order submitted:', { shippingInfo, paymentInfo });
    alert('Order placed successfully! Thank you for your purchase.');
  };

  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>Checkout</h2>
              <span>Complete your purchase</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-8">
              <div className="checkout-form">
                <h3>Shipping Information</h3>
                <form onSubmit={handleSubmit}>
                  <div className="row">
                    <div className="col-lg-6">
                      <input 
                        type="text" 
                        name="firstName" 
                        placeholder="First Name"
                        value={shippingInfo.firstName}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="text" 
                        name="lastName" 
                        placeholder="Last Name"
                        value={shippingInfo.lastName}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="email" 
                        name="email" 
                        placeholder="Email Address"
                        value={shippingInfo.email}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="tel" 
                        name="phone" 
                        placeholder="Phone Number"
                        value={shippingInfo.phone}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-12">
                      <input 
                        type="text" 
                        name="address" 
                        placeholder="Street Address"
                        value={shippingInfo.address}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-4">
                      <input 
                        type="text" 
                        name="city" 
                        placeholder="City"
                        value={shippingInfo.city}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-4">
                      <input 
                        type="text" 
                        name="state" 
                        placeholder="State"
                        value={shippingInfo.state}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-4">
                      <input 
                        type="text" 
                        name="zipCode" 
                        placeholder="ZIP Code"
                        value={shippingInfo.zipCode}
                        onChange={handleShippingChange}
                        required 
                      />
                    </div>
                  </div>

                  <h3 style={{ marginTop: '30px' }}>Payment Information</h3>
                  
                  <div className="row">
                    <div className="col-lg-12">
                      <input 
                        type="text" 
                        name="cardName" 
                        placeholder="Name on Card"
                        value={paymentInfo.cardName}
                        onChange={handlePaymentChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-12">
                      <input 
                        type="text" 
                        name="cardNumber" 
                        placeholder="Card Number"
                        value={paymentInfo.cardNumber}
                        onChange={handlePaymentChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="text" 
                        name="expiryDate" 
                        placeholder="MM/YY"
                        value={paymentInfo.expiryDate}
                        onChange={handlePaymentChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="text" 
                        name="cvv" 
                        placeholder="CVV"
                        value={paymentInfo.cvv}
                        onChange={handlePaymentChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-12">
                      <button type="submit" className="main-border-button">Place Order</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

            <div className="col-lg-4">
              <div className="checkout-summary">
                <h3>Order Summary</h3>
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
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
