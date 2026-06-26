
import "./globals.css";

export default function RootLayout({ children }) {
  return (
    <html lang="vi">
      <head>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
      </head>
      <body className="min-h-screen bg-gray-100 text-gray-800 font-['Be_Vietnam_Pro'] antialiased">
        {children}
      </body>
    </html>
  );
}

