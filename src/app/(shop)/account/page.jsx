"use client";
import { useState } from 'react';
import Link from 'next/link';

export default function AccountPage() {
  const [activeTab, setActiveTab] = useState('profile');
  const [profile, setProfile] = useState({
    name: 'John Doe',
    email: 'john@example.com',
    phone: '010-020-0340',
    address: '123 Main Street'
  });

  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>My Account</h2>
              <span>Manage your account information</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-3">
              <div className="account-menu">
                <ul>
                  <li>
                    <button 
                      onClick={() => setActiveTab('profile')}
                      className={activeTab === 'profile' ? 'active' : ''}
                    >
                      My Profile
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('orders')}
                      className={activeTab === 'orders' ? 'active' : ''}
                    >
                      My Orders
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('wishlist')}
                      className={activeTab === 'wishlist' ? 'active' : ''}
                    >
                      Wishlist
                    </button>
                  </li>
                  <li>
                    <button 
                      onClick={() => setActiveTab('settings')}
                      className={activeTab === 'settings' ? 'active' : ''}
                    >
                      Settings
                    </button>
                  </li>
                </ul>
              </div>
            </div>

            <div className="col-lg-9">
              {activeTab === 'profile' && (
                <div className="account-content">
                  <h3>My Profile</h3>
                  <div className="profile-form">
                    <div className="row">
                      <div className="col-lg-6">
                        <div className="form-group">
                          <label>Name</label>
                          <p>{profile.name}</p>
                        </div>
                      </div>
                      <div className="col-lg-6">
                        <div className="form-group">
                          <label>Email</label>
                          <p>{profile.email}</p>
                        </div>
                      </div>
                      <div className="col-lg-6">
                        <div className="form-group">
                          <label>Phone</label>
                          <p>{profile.phone}</p>
                        </div>
                      </div>
                      <div className="col-lg-6">
                        <div className="form-group">
                          <label>Address</label>
                          <p>{profile.address}</p>
                        </div>
                      </div>
                    </div>
                    <button className="main-border-button">Edit Profile</button>
                  </div>
                </div>
              )}

              {activeTab === 'orders' && (
                <div className="account-content">
                  <h3>My Orders</h3>
                  <div className="orders-list">
                    <p>No orders yet. Start shopping to see your orders here!</p>
                    <div className="main-border-button" style={{ marginTop: '20px' }}>
                      <Link href="/products">Shop Now</Link>
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'wishlist' && (
                <div className="account-content">
                  <h3>My Wishlist</h3>
                  <div className="wishlist">
                    <p>Your wishlist is empty. Add items to your wishlist to see them here!</p>
                  </div>
                </div>
              )}

              {activeTab === 'settings' && (
                <div className="account-content">
                  <h3>Account Settings</h3>
                  <div className="settings-form">
                    <div className="setting-item">
                      <h4>Change Password</h4>
                      <form>
                        <input type="password" placeholder="Current Password" required />
                        <input type="password" placeholder="New Password" required />
                        <input type="password" placeholder="Confirm Password" required />
                        <button type="submit" className="main-border-button">Update Password</button>
                      </form>
                    </div>
                    <div className="setting-item">
                      <h4>Notifications</h4>
                      <label>
                        <input type="checkbox" defaultChecked /> Email me about special offers
                      </label>
                      <label>
                        <input type="checkbox" defaultChecked /> Email me order updates
                      </label>
                      <button className="main-border-button">Save Preferences</button>
                    </div>
                    <div className="setting-item">
                      <h4>Danger Zone</h4>
                      <button className="main-border-button" style={{ backgroundColor: '#ff6b6b' }}>
                        Delete Account
                      </button>
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
