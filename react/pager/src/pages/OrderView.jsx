import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import "../css/style.css";

const OrderingView = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [item, setItem] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_API_BASE_URL}/ordering/ordering_view/${id}`)
      .then((res) => {
        if (res.data.success) {
          setItem(res.data.item);
        } else {
          alert(res.data.message || "데이터를 불러올 수 없습니다.");
          navigate("/ordering");
        }
      })
      .catch((err) => {
        console.error("발주계획 데이터 로딩 오류:", err);
        alert("서버 오류가 발생했습니다.");
        navigate("/ordering");
      })
      .finally(() => setLoading(false));
  }, [id, navigate]);

  const formatNumber = (num) => {
    if (num === null || num === undefined) return "-";
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  };

  const handlePrint = () => {
    window.print();
  };

  if (loading)
    return <div style={{ textAlign: "center", padding: "40px" }}>불러오는 중...</div>;
  if (!item)
    return <div style={{ textAlign: "center", padding: "40px" }}>해당 데이터를 찾을 수 없습니다.</div>;

  return (
    <>
      <section id="sub_top">
        <div className="sub_main">
          <div className="txtBox">
            <h4>발주계획</h4>
            <p>Ordering plan</p>
          </div>
        </div>
      </section>

      <section id="sub_view">
        <div className="viewGroup" id="viewGroup">
          <h3>요청내역</h3>
          <dl className="tb_set">
            <div className="dl-item dl-line-right">
              <dt>요청번호</dt>
              <dd>{item.order_plan_unty_no || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>조달방식</dt>
              <dd>{item.prcrmnt_methd || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>게시일자</dt>
              <dd>{item.ntice_dt || "-"}</dd>
            </div>
            <div className="dl-item dl-full">
              <dt>요청명</dt>
              <dd>{item.biz_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>업무유형</dt>
              <dd>{item.bsns_ty_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>계약방법</dt>
              <dd>{item.cntrct_mthd_nm || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>공고게시여부</dt>
              <dd>{item.ntce_ntice_yn || "-"}</dd>
            </div>
          </dl>

          <hr />

          <h3>기관 / 담당자 정보</h3>
          <dl className="tb_set">
            <div className="dl-item dl-half1 dl-line-right">
              <dt>총괄 기관명</dt>
              <dd>{item.order_instt_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-half2">
              <dt>발주금액</dt>
              <dd>{formatNumber(item.sum_order_amt)}원</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>부서명</dt>
              <dd>{item.dept_nm || "-"}</dd>
            </div>
            <div className="dl-item dl-line-right">
              <dt>담당자명</dt>
              <dd>{item.ofcl_nm || "-"}</dd>
            </div>
            <div className="dl-item">
              <dt>연락처</dt>
              <dd>{item.tel_no || "-"}</dd>
            </div>
          </dl>

          <hr />
        </div>

        <div className="btns" style={{ marginTop: "20px" }}>
          <button
            className="btn btn-dark"
            onClick={() => navigate("/ordering_list")}
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

export default OrderingView;
