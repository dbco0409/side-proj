import { useEffect, useState } from "react";
import api from "../../api/axios"; 

const Main03 = () => {
  const [shops, setShops] = useState([]);
  const goTo = (url) => window.location.href = url;

  useEffect(() => {
    api.get(`${import.meta.env.VITE_API_BASE_URL}/shop/main-list`)
      .then((res) => {
        setShops(res.data.shops || []);
      })
      .catch((err) => console.error("상품 목록 불러오기 실패:", err));
  }, []);

  return (
    <section id="main04">
      <div className="head">
        <div className="title">
          <h3>페이저샵 상품</h3>
          <p>PagerShop Products</p>
        </div>
        <button className="btn more_btn" onClick={() => goTo("/pager/shop_list")}>
          더보기
          <img src="/images/common/arraw_next_black.svg" alt="" />
        </button>
      </div>

      <div className="products">
        <ul>
          {shops.length > 0 ? (
            shops.map((item) => (
              <li key={item.id} onClick={() => goTo(`/pager/shop_view/${item.id}`)}>
                <div className="thumb">
                  {item.isBest && <span className="best">BEST</span>}
                  <img src={`${import.meta.env.VITE_API_BASE_URL}/upload/shop/thumb/${item.thumb}`} alt={item.title} />
                </div>
                <h4>{item.title}</h4>
                <h2>
                  {item.price.toLocaleString()}원
                  <span>
                    <img src="/images/main/deliver.svg" alt="배송비" />
                    {item.delivery_price.toLocaleString()}원
                  </span>
                </h2>
              </li>
            ))
          ) : (
            <p className="empty">등록된 상품이 없습니다.</p>
          )}
        </ul>
      </div>
    </section>
  );
};

export default Main03;
