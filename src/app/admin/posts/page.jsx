"use client";
import { useState } from 'react';

export default function PostsManagement() {
  const [showModal, setShowModal] = useState(false);
  const [posts, setPosts] = useState([
    { id: 1, title: 'Latest Fashion Trends for 2024', author: 'Fashion Team', date: '2024-06-01', status: 'Published', views: 234 },
    { id: 2, title: 'How to Style Your Summer Wardrobe', author: 'Style Guide', date: '2024-05-28', status: 'Published', views: 156 },
    { id: 3, title: 'Kids Fashion: Comfort Meets Style', author: 'Kids Corner', date: '2024-05-25', status: 'Draft', views: 45 },
  ]);

  const [formData, setFormData] = useState({
    title: '',
    author: '',
  });

  const handleAddPost = (e) => {
    e.preventDefault();
    if (formData.title && formData.author) {
      const today = new Date().toISOString().split('T')[0];
      setPosts([...posts, {
        id: posts.length + 1,
        ...formData,
        date: today,
        status: 'Draft',
        views: 0
      }]);
      setFormData({ title: '', author: '' });
      setShowModal(false);
    }
  };

  const deletePost = (id) => {
    setPosts(posts.filter(post => post.id !== id));
  };

  const togglePostStatus = (id) => {
    setPosts(posts.map(post =>
      post.id === id
        ? { ...post, status: post.status === 'Published' ? 'Draft' : 'Published' }
        : post
    ));
  };

  return (
    <div>
      <h1>Posts Management</h1>

      <div className="admin-table">
        <div className="table-header">
          <h2>All Posts</h2>
          <button className="btn-add" onClick={() => setShowModal(true)}>
            <i className="fa fa-plus"></i> New Post
          </button>
        </div>

        <table>
          <thead>
            <tr>
              <th>Title</th>
              <th>Author</th>
              <th>Date</th>
              <th>Views</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {posts.map((post) => (
              <tr key={post.id}>
                <td>{post.title}</td>
                <td>{post.author}</td>
                <td>{post.date}</td>
                <td>{post.views}</td>
                <td>
                  <span className={`badge ${post.status === 'Published' ? 'badge-success' : 'badge-pending'}`}>
                    {post.status}
                  </span>
                </td>
                <td>
                  <button 
                    className="btn btn-edit btn-sm"
                    onClick={() => togglePostStatus(post.id)}
                  >
                    <i className="fa fa-edit"></i> {post.status === 'Published' ? 'Unpublish' : 'Publish'}
                  </button>
                  <button 
                    className="btn btn-delete btn-sm"
                    onClick={() => deletePost(post.id)}
                  >
                    <i className="fa fa-trash"></i> Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Add Post Modal */}
      <div className={`modal ${showModal ? 'open' : ''}`}>
        <div className="modal-content">
          <div className="modal-header">
            <h2>Create New Post</h2>
            <button className="modal-close" onClick={() => setShowModal(false)}>×</button>
          </div>

          <form onSubmit={handleAddPost}>
            <div className="form-group">
              <label>Post Title</label>
              <input
                type="text"
                value={formData.title}
                onChange={(e) => setFormData({...formData, title: e.target.value})}
                required
              />
            </div>

            <div className="form-group">
              <label>Author</label>
              <input
                type="text"
                value={formData.author}
                onChange={(e) => setFormData({...formData, author: e.target.value})}
                required
              />
            </div>

            <div className="form-row">
              <button type="submit" className="btn-add">
                Create Post
              </button>
              <button 
                type="button" 
                className="btn btn-delete"
                onClick={() => setShowModal(false)}
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
