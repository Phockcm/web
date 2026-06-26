import Link from "next/link";

export default function PostDetail({ params }) {
  const { slug } = params;
  
  // Sample post data - in a real app, this would come from a database
  const postData = {
    '1': {
      title: 'Latest Fashion Trends for 2024',
      date: 'June 1, 2024',
      author: 'Fashion Team',
      image: '/shop/images/women-01.jpg',
      content: `
        <p>The fashion industry is constantly evolving, and 2024 brings exciting new trends that are reshaping how we dress. From bold colors to innovative silhouettes, there's something for everyone this season.</p>
        
        <h3>Key Trends This Season</h3>
        <p><strong>1. Sustainable Fashion:</strong> Eco-friendly materials and ethical manufacturing are becoming increasingly important to consumers. Brands are focusing on creating quality pieces that last longer.</p>
        
        <p><strong>2. Bold Colors and Patterns:</strong> Gone are the days of playing it safe with neutral tones. Vibrant hues and eye-catching patterns are taking center stage on runways and streets alike.</p>
        
        <p><strong>3. Oversized Silhouettes:</strong> Comfort is key this season. Loose-fitting clothes provide both style and comfort, making them perfect for everyday wear.</p>
        
        <p><strong>4. Vintage & Retro:</strong> Nostalgia is driving fashion choices, with 70s, 80s, and 90s-inspired pieces making a comeback in modern interpretations.</p>
        
        <h3>How to Incorporate These Trends</h3>
        <p>Start by adding one trend piece to your wardrobe at a time. Mix and match with your existing clothes to create unique looks that express your personal style. Remember, fashion is about self-expression, so wear what makes you feel confident!</p>
      `
    },
    '2': {
      title: 'How to Style Your Summer Wardrobe',
      date: 'May 28, 2024',
      author: 'Style Guide',
      image: '/shop/images/women-02.jpg',
      content: `
        <p>Summer is here, and it's time to refresh your wardrobe with light, breathable, and stylish pieces. Let's explore how to create the perfect summer looks.</p>
        
        <h3>Summer Fashion Essentials</h3>
        <p><strong>Lightweight Fabrics:</strong> Choose cotton, linen, and lightweight blends that allow your skin to breathe in the heat.</p>
        
        <p><strong>Neutral Base:</strong> Build your summer wardrobe around neutral colors like white, cream, beige, and navy. These serve as the perfect canvas for colorful accessories.</p>
        
        <p><strong>Flowy Dresses:</strong> Maxi dresses, midi dresses, and shirt dresses are incredibly versatile and comfortable for hot days.</p>
        
        <p><strong>Shorts & Skirts:</strong> Denim shorts, linen shorts, and flowing skirts are perfect for casual summer days.</p>
        
        <h3>Styling Tips</h3>
        <ul>
          <li>Pair simple tees with statement jewelry</li>
          <li>Layer lightweight cardigans over dresses</li>
          <li>Invest in comfortable sandals and sneakers</li>
          <li>Use sunglasses and hats for both style and sun protection</li>
        </ul>
      `
    },
    '3': {
      title: 'Kids Fashion: Comfort Meets Style',
      date: 'May 25, 2024',
      author: 'Kids Corner',
      image: '/shop/images/kid-01.jpg',
      content: `
        <p>Dressing kids can be challenging – they need clothes that are comfortable, durable, and stylish. Here's how to find the perfect balance.</p>
        
        <h3>What Makes Great Kids Fashion</h3>
        <p><strong>Quality Fabrics:</strong> Choose breathable, soft materials that won't irritate your child's skin. Cotton and cotton blends are ideal.</p>
        
        <p><strong>Durability:</strong> Kids are active, so clothes need to withstand plenty of play and repeated washing.</p>
        
        <p><strong>Easy Care:</strong> Look for clothes that are machine washable and don't require special care instructions.</p>
        
        <p><strong>Comfortable Fit:</strong> Clothes should allow full range of motion for play and activities.</p>
        
        <h3>Building a Kids Wardrobe</h3>
        <p>Start with basics like t-shirts, shorts, and comfortable pants. Add layers for different seasons, and don't forget about fun patterns and colors that kids love. Remember to involve your children in choosing outfits – they're more likely to wear something they helped select!</p>
      `
    }
  };

  const post = postData[slug] || postData['1'];

  return (
    <>
      <div className="page-heading" id="top">
        <div className="container">
          <div className="row">
            <div className="col-lg-12">
              <h2>{post.title}</h2>
              <span>
                <i className="fa fa-calendar"></i> {post.date} | 
                <i className="fa fa-user"></i> By {post.author}
              </span>
            </div>
          </div>
        </div>
      </div>

      <section className="section">
        <div className="container">
          <div className="row">
            <div className="col-lg-8 offset-lg-2">
              <article className="post-content">
                <div className="post-image">
                  <img src={post.image} alt={post.title}/>
                </div>
                <div className="post-body">
                  <div dangerouslySetInnerHTML={{ __html: post.content }} />
                </div>
                <div className="post-footer">
                  <div className="main-border-button">
                    <Link href="/posts">Back to Posts</Link>
                  </div>
                </div>
              </article>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
