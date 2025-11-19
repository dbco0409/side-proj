import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import "../css/style.css";

const NewsView = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [news, setNews] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/news/newsView/${id}`)
      .then((res) => {
        if (res.data.success) {
          setNews(res.data.news);
        } else {
          alert(res.data.message || "뉴스를 불러올 수 없습니다.");
          navigate("/news_list");
        }
      })
      .catch((err) => {
        console.error("뉴스 데이터를 불러오는 중 오류:", err);
        alert("서버 오류가 발생했습니다.");
        navigate("/news_list");
      })
      .finally(() => setLoading(false));
  }, [id, navigate]);

  const formatDate = (dateString) => {
    if (!dateString) return "";
    const d = new Date(dateString);
    const yy = d.getFullYear().toString().slice(2);
    const mm = String(d.getMonth() + 1).padStart(2, "0");
    const dd = String(d.getDate()).padStart(2, "0");
    const hh = String(d.getHours()).padStart(2, "0");
    const mi = String(d.getMinutes()).padStart(2, "0");
    return `${yy}.${mm}.${dd} ${hh}:${mi}`;
  };

  if (loading) {
    return <div style={{ textAlign: "center", padding: "40px" }}>불러오는 중...</div>;
  }

  if (!news) {
    return <div style={{ textAlign: "center", padding: "40px" }}>뉴스를 찾을 수 없습니다.</div>;
  }

  return (
    <>
      <section id="sub_top">
        <div className="sub_main">
          <div className="txtBox">
            <h4>News <span>/</span> Insight</h4>
            <p>페이저의 최신 뉴스와 이용안내를 전해드립니다.</p>
          </div>
        </div>
      </section>

      <section className="event_view">
        <div className="view_info">
          <h4>{news.title}</h4>
          <p>{formatDate(news.regdate)}</p>
        </div>

        <div
          className="content"
          dangerouslySetInnerHTML={{ __html: news.content }}
        ></div>

        <div className="btns" style={{ textAlign: "center", marginTop: "30px" }}>
          <button
            onClick={() => navigate("/news_list")}
            className="btn-list"
            style={{
              background: "#333",
              color: "#fff",
              border: "none",
              padding: "10px 20px",
              cursor: "pointer",
              borderRadius: "4px",
            }}
          >
            목록보기
          </button>
        </div>
      </section>
    </>
  );
};

export default NewsView;
