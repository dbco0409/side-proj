import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import "../css/style.css";

const BidView = () => {
  const { id } = useParams(); 
  const navigate = useNavigate();
  const [item, setItem] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_API_BASE_URL}/bid/bid_view/${id}`)
      .then((res) => {
        if (res.data.success) {
          setItem(res.data.item);
        } else {
          alert(res.data.message || "데이터를 불러올 수 없습니다.");
          navigate("/bid_list");
        }
      })
      .catch((err) => {
        console.error("입찰 데이터 로딩 오류:", err);
        alert("서버 오류가 발생했습니다.");
        navigate("/bid_list");
      })
      .finally(() => setLoading(false));
  }, [id, navigate]);

  const formatDate = (dateString) => {
    if (!dateString) return "-";
    const d = new Date(dateString);
    const yy = d.getFullYear().toString().slice(2);
    const mm = String(d.getMonth() + 1).padStart(2, "0");
    const dd = String(d.getDate()).padStart(2, "0");
    const hh = String(d.getHours()).padStart(2, "0");
    const mi = String(d.getMinutes()).padStart(2, "0");
    return `${yy}.${mm}.${dd} ${hh}:${mi}`;
  };

  const handlePrint = () => {
    window.print();
  };

  if (loading) return <div style={{ textAlign: "center", padding: "40px" }}>불러오는 중...</div>;
  if (!item) return <div style={{ textAlign: "center", padding: "40px" }}>해당 데이터를 찾을 수 없습니다.</div>;

  // 공고문 파일 목록 자동 생성 (최대 9개)
  const fileList = [];
  for (let i = 1; i <= 9; i++) {
    const nameKey = `ntce_spec_doc_nm${i}`;
    const urlKey = `ntce_spec_doc_url1${i}`;
    if (item[nameKey] && item[nameKey].trim() !== "") {
      fileList.push({
        name: item[nameKey],
        url: item[urlKey],
        index: i,
      });
    }
  }

  return (
    <>
      <section id="sub_top">
        <div className="sub_main">
          <div className="txtBox">
            <h4>입찰정보</h4>
            <p>Bidding information</p>
          </div>
        </div>
      </section>

      <section id="sub_view">
        <div className="viewGroup" id="viewGroup">
          {/* 요청내역 */}
          <h3>요청내역</h3>
          <dl className="tb_set">
            <div className="dl-item dl-line-right">
              <dt>입찰공고번호</dt>
              <dd>{item.bid_ntce_no || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>계약체결방법</dt>
              <dd>{item.cntrct_mthd_nm || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>등록일시</dt>
              <dd>{formatDate(item.rgst_dt)}</dd>
            </div>
            <div className="dl-item dl-full">
              <dt>요청명</dt>
              <dd>{item.ntce_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>공고종류</dt>
              <dd>{item.ntce_div_nm || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>입찰방식</dt>
              <dd>{item.bid_methd_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>낙찰방식</dt>
              <dd>{item.sucsfbid_mthd_nm || "-"}</dd>
            </div>
          </dl>

          <hr />

          {/* 기관 / 담당자 정보 */}
          <h3>기관 / 담당자 정보</h3>
          <dl className="tb_set">
            <div className="dl-item dl-full">
              <dt>공고 기관명</dt>
              <dd>{item.ntce_instt_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>담당자명</dt>
              <dd>{item.ofcl_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>담당자 연락처</dt>
              <dd>{item.ofcl_tel_no || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>담당자 이메일</dt>
              <dd>{item.ofcl_email || "-"}</dd>
            </div>
          </dl>

          <hr />

          {/* 파일 / URL */}
          <h3>파일 / URL</h3>
          <dl className="tb_set">
            {fileList.length > 0 ? (
              fileList.map((f) => (
                <div key={f.index} className="dl-item dl-full">
                  <dt>{`공고문${f.index} 다운로드`}</dt>
                  <dd>
                    <a href={f.url} target="_blank" rel="noreferrer">
                      {f.name}
                    </a>
                  </dd>
                </div>
              ))
            ) : (
              <div className="dl-item dl-full">
                <dd>등록된 첨부파일이 없습니다.</dd>
              </div>
            )}
          </dl>
        </div>

        <hr />

        {/* 버튼 영역 */}
        <div className="btns" style={{ marginTop: "20px" }}>
          <button
            className="btn btn-dark"
            onClick={() => navigate("/bid_list")}
            style={{
              background: "#333",
              color: "#fff",
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
            className="btn btn-success"
            onClick={handlePrint}
            style={{
              background: "#28a745",
              color: "#fff",
              border: "none",
              padding: "8px 20px",
              borderRadius: "4px",
              cursor: "pointer",
            }}
          >
            인쇄
          </button>
        </div>
      </section>
    </>
  );
};

export default BidView;
