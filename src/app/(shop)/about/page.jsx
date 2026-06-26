import Link from "next/link";

export default function AboutPage() {
  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>About Our Store</h2>
              <span>Learn more about Hexashop &amp; our amazing services</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section" id="about-us">
        <div className="container">
          <div className="row">
            <div className="col-lg-6">
              <div className="left-image">
                <img src="/shop/images/about-left-image.jpg" alt="About Us"/>
              </div>
            </div>
            <div className="col-lg-6">
              <div className="right-content">
                <h4>About Our Hexashop</h4>
                <span>Details to details is what makes Hexashop different from the other themes.</span>
                <div className="quote">
                  <i className="fa fa-quote-left"></i><p>Hexashop has been the best theme for ecommerce business for a long time. This template is highly recommended for any business.</p>
                </div>
                <p>Sed laoreet aliquam lectus. Ut ac eros ac leo aliquam mollis in a dui. Pellentesque tristique fringilla dui at accumsan. Sed ac metus vel dolor pellentesque commodo a vel purus. Pellentesque ac sem.</p>
                <p>Vestibulum nec felis in enim dignissim molestie at ac ex. Quisque ut nisi vitae ex vehicula pellentesque in at nisi. Donec posuere rhoncus magna vel mollis.</p>
                <div className="main-border-button">
                  <Link href="/products">Discover More Products</Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="section" id="team">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <div className="section-heading">
                <h2>Our Team</h2>
                <span>Get to know the creative minds behind our amazing store</span>
              </div>
            </div>
          </div>
        </div>
        <div className="container">
          <div className="row">
            <div className="col-lg-4">
              <div className="team-item">
                <div className="thumb">
                  <img src="/shop/images/team-member-01.jpg" alt="Team Member"/>
                </div>
                <div className="down-content">
                  <h4>Tommy Shelby</h4>
                  <span>Founder &amp; CEO</span>
                  <p>Sed laoreet aliquam lectus. Ut ac eros ac leo aliquam mollis.</p>
                </div>
              </div>
            </div>
            <div className="col-lg-4">
              <div className="team-item">
                <div className="thumb">
                  <img src="/shop/images/team-member-02.jpg" alt="Team Member"/>
                </div>
                <div className="down-content">
                  <h4>Michael Gray</h4>
                  <span>Product Manager</span>
                  <p>Sed laoreet aliquam lectus. Ut ac eros ac leo aliquam mollis.</p>
                </div>
              </div>
            </div>
            <div className="col-lg-4">
              <div className="team-item">
                <div className="thumb">
                  <img src="/shop/images/team-member-03.jpg" alt="Team Member"/>
                </div>
                <div className="down-content">
                  <h4>Hannah West</h4>
                  <span>Marketing Officer</span>
                  <p>Sed laoreet aliquam lectus. Ut ac eros ac leo aliquam mollis.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
