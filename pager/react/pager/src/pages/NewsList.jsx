import { useEffect, useState } from "react";
import axios from "axios";
import "../css/style.css"; // 필요시 추가

const NewsList = () => {
  const [news, setNews] = useState([]);

  // ✅ 데이터 불러오기
  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/news/newsList`)
      .then((res) => {
        if (res.data.success) {
          setNews(res.data.news || []);
        }
      })
      .catch((err) => {
        console.error("뉴스 데이터를 불러오는 중 오류:", err);
        setNews([]);
      });
  }, []);

  // ✅ 날짜 포맷 (yy.MM.dd)
  const formatDate = (dateString) => {
    if (!dateString) return "";
    const d = new Date(dateString);
    const yy = d.getFullYear().toString().slice(2);
    const mm = String(d.getMonth() + 1).padStart(2, "0");
    const dd = String(d.getDate()).padStart(2, "0");
    return `${yy}.${mm}.${dd}`;
  };

  return (
    <>
      {/* 🔹 상단 타이틀 영역 */}
      <section id="sub_top">
        <div className="sub_main">
          <div className="txtBox">
            <h4>News <span>/</span> Insight</h4>
            <p>페이저의 최신 뉴스와 이용안내를 전해드립니다.</p>
          </div>
        </div>
      </section>

      {/* 🔹 뉴스 리스트 */}
      <section className="news">
        <div className="inner">
          {news.length > 0 ? (
            news.map((item) => (
              <div
                className="col"
                key={item.id}
                onClick={() => (window.location.href = `/news_view/${item.id}`)}
                style={{ cursor: "pointer" }}
              >
                <div className="right">
                  {/* 등록일 */}
                  <h4 className="date">{formatDate(item.regdate)}</h4>

                  {/* 제목 */}
                  <h2 className="subj"><a>{item.title}</a></h2>
                </div>
              </div>
            ))
          ) : (
            <div className="no-data" style={{ textAlign: "center", padding: "40px 0" }}>
              등록된 뉴스가 없습니다.
            </div>
          )}
        </div>
      </section>
    </>
  );
};

export default NewsList;
