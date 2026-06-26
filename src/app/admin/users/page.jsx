"use client";
import { useState } from 'react';

export default function UsersManagement() {
  const [users, setUsers] = useState([
    { id: 1, name: 'John Doe', email: 'john@example.com', role: 'Customer', joinDate: '2024-01-15', status: 'Active' },
    { id: 2, name: 'Jane Smith', email: 'jane@example.com', role: 'Customer', joinDate: '2024-02-20', status: 'Active' },
    { id: 3, name: 'Bob Johnson', email: 'bob@example.com', role: 'Admin', joinDate: '2023-12-10', status: 'Active' },
    { id: 4, name: 'Alice Brown', email: 'alice@example.com', role: 'Customer', joinDate: '2024-03-05', status: 'Active' },
    { id: 5, name: 'Charlie Wilson', email: 'charlie@example.com', role: 'Customer', joinDate: '2024-04-12', status: 'Inactive' },
  ]);

  const deleteUser = (id) => {
    setUsers(users.filter(user => user.id !== id));
  };

  const toggleUserStatus = (id) => {
    setUsers(users.map(user =>
      user.id === id 
        ? { ...user, status: user.status === 'Active' ? 'Inactive' : 'Active' }
        : user
    ));
  };

  return (
    <div>
      <h1>Users Management</h1>

      <div className="admin-table">
        <div className="table-header">
          <h2>All Users ({users.length})</h2>
        </div>

        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Role</th>
              <th>Join Date</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {users.map((user) => (
              <tr key={user.id}>
                <td>{user.name}</td>
                <td>{user.email}</td>
                <td>{user.role}</td>
                <td>{user.joinDate}</td>
                <td>
                  <span className={`badge ${user.status === 'Active' ? 'badge-success' : 'badge-pending'}`}>
                    {user.status}
                  </span>
                </td>
                <td>
                  <button 
                    className="btn btn-edit btn-sm"
                    onClick={() => toggleUserStatus(user.id)}
                  >
                    <i className="fa fa-toggle-on"></i> {user.status === 'Active' ? 'Disable' : 'Enable'}
                  </button>
                  <button 
                    className="btn btn-delete btn-sm"
                    onClick={() => deleteUser(user.id)}
                  >
                    <i className="fa fa-trash"></i> Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
