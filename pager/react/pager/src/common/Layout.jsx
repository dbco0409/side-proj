import { Outlet } from "react-router-dom";
import Header from "./comp/Header";
import Footer from "./comp/Footer";

const Layout = () => {
  return (
    <>
      <Header />
      <main>
        <Outlet />
      </main>
      <Footer />
    </>
  );
};

export default Layout;
