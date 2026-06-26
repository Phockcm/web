import Header from "@/components/shop/Header";
import Footer from "@/components/shop/Footer";
import Preloader from "@/components/shop/Preloader";

export default function ShopLayout({ children }) {
    return (
        <div>
            <Preloader />
            <Header />
            <main>{children}</main>
            <Footer />
        </div>
    );
}