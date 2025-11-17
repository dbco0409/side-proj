import { useState, useEffect } from "react";
import DataTable from "react-data-table-component";
import axios from "axios";
import dayjs from "dayjs";
import '../css/style.css';

const OrderList = () => {
  const [items, setItems] = useState([]);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/ordering/ordering_list`)
      .then((res) => {
        setItems(res.data.items || []);
      })
      .catch((err) => console.error("데이터 불러오기 실패:", err));
  }, []);

  const filteredItems = items.filter((item) => {
    const keyword = searchText.toLowerCase();
    return (
      (item.biz_nm && item.biz_nm.toLowerCase().includes(keyword)) ||
      (item.order_instt_nm && item.order_instt_nm.toLowerCase().includes(keyword)) ||
      (item.ntice_dt && item.ntice_dt.toLowerCase().includes(keyword)) ||
      (item.order_plan_unty_no && item.order_plan_unty_no.toLowerCase().includes(keyword))
    );
  });

  const columns = [
  {
    name: "사업명",
    selector: (row) => row.biz_nm,
    sortable: true,
    cell: (row) => (
      <span
        onClick={() => window.location.href = `/pager/ordering_view/${row.order_plan_unty_no}`}
        style={{ cursor: "pointer" }}
      >
        {row.biz_nm || "-"}
      </span>
    ),
  },
  {
    name: "기관명",
    selector: (row) => row.order_instt_nm,
    width: "300px",
    cell: (row) => (
      <span
        onClick={() => window.location.href = `/pager/ordering_view/${row.order_plan_unty_no}`}
        style={{ cursor: "pointer" }}
      >
        {row.order_instt_nm || "-"}
      </span>
    ),
  },
  {
    name: "게시일시",
    selector: (row) => row.ntice_dt,
    width: "150px",
    cell: (row) => {
            // ✅ 날짜 포맷 (YYYY-MM-DD)
            const formatted = row.ntice_dt ? dayjs(row.ntice_dt).format("YYYY-MM-DD") : "-";
            return <span>{formatted}</span>;
            },
  },
  {
    name: "견적번호",
    selector: (row) => row.order_plan_unty_no,
    width: "150px",
    cell: (row) => (
      <span
        onClick={() => window.location.href = `/pager/ordering_view/${row.order_plan_unty_no}`}
        style={{ cursor: "pointer" }}
      >
        {row.order_plan_unty_no || "-"}
      </span>
    ),
  },
];

  return (
    <>
        <section id="sub_top">
            <div class="sub_main">
                <div class="txtBox">
                    <h4>발주계획</h4>
                    <p>Ordering plan</p>
                </div>
            </div>
        </section>
        <section id="sub_list">
            <div style={{ marginBottom: "10px", textAlign: "right" }}>
            <input
                type="text"
                placeholder="검색어를 입력하세요"
                value={searchText}
                onChange={(e) => setSearchText(e.target.value)}
                style={{
                marginTop:"15px",
                padding: "6px 10px",
                borderRadius: "4px",
                border: "1px solid #ccc",
                fontSize: "14px",
                width: "250px",
                }}
            />
            </div>
            <DataTable
                title=""
                columns={columns}
                data={filteredItems}
                pagination
                highlightOnHover
                striped
                noDataComponent="데이터를 찾는 중입니다."
            />
    </section>
    </>
  );
};

export default OrderList;
