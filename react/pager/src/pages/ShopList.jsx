import { useState, useEffect } from "react";
import axios from "axios";
import "../css/style.css";

const ShopList = () => {
  const [category1, setCategory1] = useState("");
  const [category2, setCategory2] = useState("");

  const [minPrice, setMinPrice] = useState(0);
  const [maxPrice, setMaxPrice] = useState(500000);
  const [shops, setShops] = useState([]);
  const [searchTxt, setSearchTxt] = useState("");

  const minGap = 10000;
  const maxValue = 500000;

  const loadShopList = async () => {
  try {
    const formData = new FormData();
    formData.append("category1", category1);
    formData.append("category2", category2);
    formData.append("minPrice", minPrice);
    formData.append("maxPrice", maxPrice);
    formData.append("search_txt", searchTxt);

    const res = await axios.post(
      `${import.meta.env.VITE_API_BASE_URL}/shop/shop_list`,
      formData,
      { headers: { "Content-Type": "multipart/form-data" } }
    );

    setShops(res.data.shops || []);
  } catch (err) {
    console.error("리스트 로딩 오류:", err);
    setShops([]);
  }
};


  useEffect(() => {
    loadShopList();
  }, [category1, category2, minPrice, maxPrice]);

  const handleLeftChange = (e) => {
    let left = parseInt(e.target.value);
    if (maxPrice - left < minGap) left = maxPrice - minGap;
    setMinPrice(left);
  };

  const handleRightChange = (e) => {
    let right = parseInt(e.target.value);
    if (right - minPrice < minGap) right = minPrice + minGap;
    setMaxPrice(right);
  };

  const handleSearch = (e) => {
    e.preventDefault();
    loadShopList();
  };

  return (
    <>
    <form onSubmit={handleSearch}>
      <input type="hidden" name="category1" value=""/>
      <input type="hidden" name="category2" value=""/>
      <input type="hidden" name="minPrice" id="minPrice" value="0"/>
      <input type="hidden" name="maxPrice" id="maxPrice" value="500000"/>
      <section id="sub_body" className="shop-list">
        <div className="search">
          {/* 🔍 검색 */}
          <div className="box">
            <h3>제품 검색</h3>
            <input
              type="search"
              placeholder="검색어 입력"
              className="input_search"
              value={searchTxt}
              onChange={(e) => setSearchTxt(e.target.value)}
            />
            <button type="submit" className="search_btn">검색</button>
          </div>

          {/* 📂 카테고리1 */}
          <div className="box">
            <h3>분류별 찾기</h3>
            <ul id="category1">
              {["문구", "리빙", "패션", "전자제품", "사무용품"].map((cat) => (
                <li
                  key={cat}
                  className={cat === category1 ? "active" : ""}
                  onClick={() => setCategory1(cat)}
                >
                  {cat}
                </li>
              ))}
            </ul>
          </div>

          {/* 📍 카테고리2 */}
          <div className="box">
            <h3>장소별 찾기</h3>
            <ul id="category2">
              {["사무실", "집", "야외", "카페"].map((cat) => (
                <li
                  key={cat}
                  className={cat === category2 ? "active" : ""}
                  onClick={() => setCategory2(cat)}
                >
                  {cat}
                </li>
              ))}
            </ul>
          </div>

          {/* 💰 가격 슬라이더 */}
          <div className="box">
            <div className="range-slider">
              <h3>
                제품가격
                <div id="range-display" className="range-display">
                  <span>{minPrice.toLocaleString()}</span>원 ~{" "}
                  <span>{maxPrice.toLocaleString()}</span>원 이상
                </div>
              </h3>
              <div className="middle">
                <div className="multi-range-slider">
                  <input
                    type="range"
                    id="input-left"
                    min="0"
                    max={maxValue}
                    value={minPrice}
                    step="10000"
                    onChange={handleLeftChange}
                  />
                  <input
                    type="range"
                    id="input-right"
                    min="0"
                    max={maxValue}
                    value={maxPrice}
                    step="10000"
                    onChange={handleRightChange}
                  />
                  <div className="slider">
                    <div className="track"></div>
                    <div
                      className="range"
                      style={{
                        left: `${(minPrice / maxValue) * 100}%`,
                        right: `${100 - (maxPrice / maxValue) * 100}%`,
                      }}
                    ></div>
                    <div
                      className="thumb left"
                      style={{ left: `${(minPrice / maxValue) * 100}%` }}
                    ></div>
                    <div
                      className="thumb right"
                      style={{ right: `${100 - (maxPrice / maxValue) * 100}%` }}
                    ></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* 🛒 상품 목록 */}
        <div className="content" id="shop_list_area">
          {shops.length > 0 ? (
            shops.map((shop) => (
              <div className="box" key={shop.id}>
                {shop.hot === 1 && <div className="bedge best-bedge">HOT</div>}

                <div className="img">
                  <a href={`/pager/shop_view/${shop.id}`}>
                    <img
                      src={
                        shop.thumb
                          ? `${import.meta.env.VITE_API_BASE_URL}/upload/shop/thumb/${shop.thumb}`
                          : `${import.meta.env.VITE_API_BASE_URL}/images/no-image.png`
                      }
                      alt={shop.title}
                    />
                  </a>
                </div>

                <div className="info">
                  <h5>{shop.category2 || "카테고리 없음"}</h5>
                  <h1>{shop.title}</h1>
                  <h1 className="price">
                    {shop.price?.toLocaleString()}원
                    <span className="s">
                      <img src="/images/main/deliver.svg" alt="배송비" />
                      <span>
                        {shop.delivery_price === 0
                          ? "무료배송"
                          : `${shop.delivery_price.toLocaleString()}원`}
                      </span>
                    </span>
                  </h1>
                </div>
              </div>
            ))
          ) : (
            <div className="no-data" style={{ textAlign: "center", width: "100%",display:"flex", justifyContent:"center" , alignItems:"center" }}>
              등록된 상품이 없습니다.
            </div>
          )}
        </div>
      </section>
    </form>
    </>
  );
};

export default ShopList;
