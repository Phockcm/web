export default function PostsPage() {
  const posts = [
    {
      id: 1,
      title: 'Latest Fashion Trends for 2024',
      excerpt: 'Discover the hottest fashion trends that are dominating the industry right now...',
      date: 'June 1, 2024',
      author: 'Fashion Team',
      image: '/shop/images/women-01.jpg'
    },
    {
      id: 2,
      title: 'How to Style Your Summer Wardrobe',
      excerpt: 'Learn the best tips and tricks for creating stylish summer outfits...',
      date: 'May 28, 2024',
      author: 'Style Guide',
      image: '/shop/images/women-02.jpg'
    },
    {
      id: 3,
      title: 'Kids Fashion: Comfort Meets Style',
      excerpt: 'Find out how to keep your kids comfortable and fashionable this season...',
      date: 'May 25, 2024',
      author: 'Kids Corner',
      image: '/shop/images/kid-01.jpg'
    },
  ];

  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>Blog &amp; Posts</h2>
              <span>Read our latest articles and fashion tips</span>
            </div>
          </div>
        </div>
      </div>

      <section className="section" id="blog">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <div className="section-heading">
                <h2>Latest Posts</h2>
                <span>Explore our fashion tips and latest news</span>
              </div>
            </div>
          </div>
        </div>

        <div className="container">
          <div className="row">
            {posts.map((post) => (
              <div key={post.id} className="col-lg-4">
                <div className="blog-item">
                  <div className="thumb">
                    <img src={post.image} alt={post.title}/>
                  </div>
                  <div className="down-content">
                    <h4>{post.title}</h4>
                    <span className="post-date">
                      <i className="fa fa-calendar"></i> {post.date}
                    </span>
                    <span className="post-author">
                      <i className="fa fa-user"></i> By {post.author}
                    </span>
                    <p>{post.excerpt}</p>
                    <div className="main-border-button">
                      <a href={`/posts/${post.id}`}>Read More</a>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
