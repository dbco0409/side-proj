import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import "../css/style.css";

const CompanyView = () => {
  const { id } = useParams(); 
  const navigate = useNavigate();
  const [company, setCompany] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_API_BASE_URL}/company/company_view/${id}`)
      .then((res) => {
        if (res.data.success) {
          setCompany(res.data.shop); 
        } else {
          alert(res.data.message || "데이터를 불러올 수 없습니다.");
          navigate("/company");
        }
      })
      .catch((err) => {
        console.error("데이터를 불러오는 중 오류:", err);
        alert("서버 오류가 발생했습니다.");
        navigate("/company");
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

  const handlePrint = () => {
    window.print();
  };

  if (loading) {
    return <div style={{ textAlign: "center", padding: "40px" }}>불러오는 중...</div>;
  }

  if (!company) {
    return <div style={{ textAlign: "center", padding: "40px" }}>데이터를 찾을 수 없습니다.</div>;
  }

  return (
    <>
      <section id="sub_top">
        <div className="sub_main">
          <div className="txtBox">
            <h4>구인정보</h4>
            <p>Job Posting</p>
          </div>
        </div>
      </section>

      <section id="sub_view">
        <div className="viewGroup" id="viewGroup">
          <h3>요청내역</h3>
          <dl className="tb_set">
            <div className="dl-item dl-line-right">
              <dt>구인직종</dt>
              <dd>{company.category1 || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>게시날짜</dt>
              <dd>{formatDate(company.startTime)}</dd>
            </div>
            <div className="dl-item">
              <dt>채용마감일</dt>
              <dd>{formatDate(company.endTime)}</dd>
            </div>
            <div className="dl-item dl-full">
              <dt>제목</dt>
              <dd>{company.title}</dd>
            </div>
          </dl>

          <hr />

          <h3>담당자 정보</h3>
          <dl className="tb_set">
            <div className="dl-item dl-line-right">
              <dt>담당자명</dt>
              <dd>{company.name || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>담당자 연락처</dt>
              <dd>{company.tel || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>현황</dt>
              <dd>{company.status || "-"}</dd>
            </div>
          </dl>

          <hr />

          <h3>세부 내용</h3>
          <div
            style={{ whiteSpace: "pre-wrap", lineHeight: "1.6", marginBottom:"40px" }}
            dangerouslySetInnerHTML={{ __html: company.content }}
          ></div>
        </div>

        <hr />

        <div className="btns" style={{ marginTop: "20px" }}>
          <button
            className="btn btn-dark"
            onClick={() => navigate("/company_list")}
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

export default CompanyView;
