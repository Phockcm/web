"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { shopMenu } from "@/data/menu";


export default function Menu() {
  const pathname = usePathname();

  return (
    <ul className="flex flex-col md:flex-row gap-6 list-none p-0 m-0 items-center">
      {shopMenu.map((item, index) => (
        <li key={index}>
          <Link 
            href={item.href} 
            className={`no-underline hover:text-blue-500 font-semibold transition-colors text-sm ${
              pathname === item.href ? "text-blue-600 font-bold" : "text-gray-600"
            }`}
          >
            {item.label}
          </Link>
        </li>
      ))}
    </ul>
  );
}

