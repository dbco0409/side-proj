import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./common/Layout";
import Home from "./pages/Home";    
import Orderlist from "./pages/Orderlist";  
import OrderView from "./pages/OrderView";  
import Bidlist from "./pages/Bidlist";
import BidView from "./pages/BidView";
import ComList from "./pages/ComList";
import ComView from "./pages/ComView";
import ShopList from "./pages/shopList";
import ShopView from "./pages/ShopView";
import NewsList from "./pages/NewsList";
import NewsView from "./pages/NewsView";
import Login from "./pages/Login";
import Register from "./pages/Register";
import RegisterResult from "./pages/RegisterResult";
import Forgot1 from "./pages/Forgot1";
import Forgot2 from "./pages/forgot2";  
import MemberEdit from "./pages/MemberEdit"; 

function App() {
  return (
    <BrowserRouter basename="/pager">
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="ordering_list" element={<Orderlist />} />
          <Route path="ordering_view/:id" element={<OrderView />} />
          <Route path="bid_list" element={<Bidlist />} />
          <Route path="bid_view/:id" element={<BidView />} />
          <Route path="company_list" element={<ComList />} />
          <Route path="company_view/:id" element={<ComView />} />
          <Route path="shop_list" element={<ShopList />} />
          <Route path="shop_view/:id" element={<ShopView />} />
          <Route path="news_list" element={<NewsList />} />
          <Route path="news_view/:id" element={<NewsView />} />
          <Route path="login" element={<Login />} />
          <Route path="join" element={<Register />} />
          <Route path="joinOk" element={<RegisterResult />} />
          <Route path="forgot1" element={<Forgot1 />} />
          <Route path="forgot2" element={<Forgot2 />} />
          <Route path="memberEdit" element={<MemberEdit />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
