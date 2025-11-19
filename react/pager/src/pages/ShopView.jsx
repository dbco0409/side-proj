import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import "../css/style.css";

const ShopView = () => {
  const { id } = useParams(); 
  const navigate = useNavigate();
  const [shop, setShop] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/shop/shop_view/${id}`)
      .then((res) => {
        if (res.data.success) {
          setShop(res.data.shop);
        } else {
          alert(res.data.message || "상품을 불러올 수 없습니다.");
          navigate("/shop");
        }
      })
      .catch((err) => {
        console.error("상품 데이터를 불러오는 중 오류:", err);
        alert("서버 오류가 발생했습니다.");
        navigate("/shop");
      })
      .finally(() => setLoading(false));
  }, [id, navigate]);

  if (loading) {
    return <div style={{ textAlign: "center", padding: "40px" }}>불러오는 중...</div>;
  }

  if (!shop) {
    return <div style={{ textAlign: "center", padding: "40px" }}>상품을 찾을 수 없습니다.</div>;
  }

  const formatPrice = (price) => price?.toLocaleString() || "0";

  const handleBuy = () => {
    if (shop.url) {
      window.open(shop.url, "_blank");
    } else {
      alert("상품 구매 링크가 없습니다.");
    }
  };

  const baseURL = import.meta.env.VITE_API_BASE_URL;
  const fixedContent = shop.content?.replaceAll('/upload/', `${baseURL}/upload/`);


  return (
    <>
      <section id="sub_view">
        <div className="shop_head">
          {/* 썸네일 */}
          <div className="thumb">
            <img
              src={
                shop.thumb
                  ? `${import.meta.env.VITE_API_BASE_URL}/upload/shop/thumb/${shop.thumb}`
                  : `${import.meta.env.VITE_API_BASE_URL}/images/no-image.png`
              }
              alt={shop.title}
            />
          </div>

          {/* 상품 정보 */}
          <div className="info">
            <div className="product">
              <h4>{shop.title}</h4>
              <p className="price">{formatPrice(shop.price)}원</p>
            </div>

            <div className="delivery">
              <p>
                <span>배송비</span>{" "}
                <span>
                  {shop.delivery_price === 0
                    ? "무료배송"
                    : `${formatPrice(shop.delivery_price)}원`}
                </span>
              </p>
            </div>

            <div className="delivery">
              <p>
                <span>판매처</span> <span>{shop.company || "-"}</span>
              </p>
            </div>

            <div className="total">
              <p>
                총 상품금액{" "}
                <span>
                  {formatPrice(shop.price + (shop.delivery_price || 0))}원
                </span>
              </p>
            </div>

            <div className="btns">
              <button
                className="btn-list"
                onClick={() => navigate("/shop_list")}
                style={{
                  background: "#ddd",
                  color: "#000",
                  border: "none",
                  padding: "8px 20px",
                  marginRight: "10px",
                  borderRadius: "4px",
                  cursor: "pointer",
                }}
              >
                목록
              </button>

              <button
                className="btn-buy"
                onClick={handleBuy}
                style={{
                  background: "#333",
                  color: "#fff",
                  border: "none",
                  padding: "8px 20px",
                  borderRadius: "4px",
                  cursor: "pointer",
                }}
              >
                바로 구매하기
              </button>
            </div>
          </div>
        </div>

        {/* 상세 내용 */}
        <div className="shop_body">
          <h3>제품 상세 정보</h3>
          <div
            className="txt"
            dangerouslySetInnerHTML={{ __html: fixedContent  }}
          ></div>
        </div>
      </section>
    </>
  );
};

export default ShopView;
