"use client";
import { useState } from 'react';

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    subject: '',
    message: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Form submitted:', formData);
    alert('Thank you for your message! We will get back to you soon.');
    setFormData({ name: '', email: '', subject: '', message: '' });
  };

  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>Contact Us</h2>
              <span>Get in touch with our team</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-8 offset-lg-2">
              <div className="contact-content">
                <h3>Send us a Message</h3>
                <form onSubmit={handleSubmit}>
                  <div className="row">
                    <div className="col-lg-6">
                      <input 
                        type="text" 
                        name="name" 
                        placeholder="Your Name" 
                        value={formData.name}
                        onChange={handleChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-6">
                      <input 
                        type="email" 
                        name="email" 
                        placeholder="Your Email" 
                        value={formData.email}
                        onChange={handleChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-12">
                      <input 
                        type="text" 
                        name="subject" 
                        placeholder="Subject" 
                        value={formData.subject}
                        onChange={handleChange}
                        required 
                      />
                    </div>
                    <div className="col-lg-12">
                      <textarea 
                        name="message" 
                        placeholder="Your Message" 
                        rows="5"
                        value={formData.message}
                        onChange={handleChange}
                        required
                      ></textarea>
                    </div>
                    <div className="col-lg-12">
                      <button type="submit" className="main-border-button">Send Message</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-4">
              <div className="contact-item">
                <h4><i className="fa fa-map-marker"></i> Our Location</h4>
                <p>16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</p>
              </div>
            </div>
            <div className="col-lg-4">
              <div className="contact-item">
                <h4><i className="fa fa-phone"></i> Phone</h4>
                <p>010-020-0340</p>
              </div>
            </div>
            <div className="col-lg-4">
              <div className="contact-item">
                <h4><i className="fa fa-envelope"></i> Email</h4>
                <p><a href="mailto:khoa@company.com">khoa@company.com</a></p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
