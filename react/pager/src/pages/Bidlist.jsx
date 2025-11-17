import { useState, useEffect } from "react";
import DataTable from "react-data-table-component";
import dayjs from "dayjs";
import axios from "axios";
import '../css/style.css';

const OrderList = () => {
  const [items, setItems] = useState([]);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/bid/bid_list`)
      .then((res) => {
        setItems(res.data.items || []);
      })
      .catch((err) => console.error("데이터 불러오기 실패:", err));
  }, []);

  const filteredItems = items.filter((item) => {
    const keyword = searchText.toLowerCase();
    return (
      (item.ntce_nm && item.ntce_nm.toLowerCase().includes(keyword)) ||
      (item.ntce_instt_nm && item.ntce_instt_nm.toLowerCase().includes(keyword)) ||
      (item.ntce_nm && item.ntce_nm.toLowerCase().includes(keyword)) ||
      (item.bid_ntce_no && item.bid_ntce_no.toLowerCase().includes(keyword))
    );
  });


    const columns = [
    {
        name: "요청명",
        selector: (row) => row.ntce_nm,
        sortable: true,
        width: "560px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/pager/bid_view/${row.bid_ntce_no}`}
            style={{ cursor: "pointer" }}
        >
            {row.ntce_nm || "-"}
        </span>
        ),
    },
    {
        name: "기관명",
        selector: (row) => row.ntce_instt_nm,
        width: "180px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/pager/bid_view/${row.bid_ntce_no}`}
            style={{ cursor: "pointer" }}
        >
            {row.ntce_instt_nm || "-"}
        </span>
        ),
    },
    { name: "종류", selector: (row) => row.cntrct_mthd_nm, width: "120px", center: true },
    {
        name: "공고게시일시",
        width: "150px",
        center: true,
        cell: (row) => {
        // ✅ 날짜 포맷 (YYYY-MM-DD)
        const formatted = row.reg_date ? dayjs(row.reg_date).format("YYYY-MM-DD") : "-";
        return <span>{formatted}</span>;
        },
    },
    { name: "입찰공고번호", selector: (row) => row.bid_ntce_no, width: "160px", center: true },
    ];



  return (
    <>
        <section id="sub_top">
            <div className="sub_main">
                <div className="txtBox">
                    <h4>입찰계획</h4>
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
            columns={columns}
            data={filteredItems}
            pagination
            highlightOnHover
            striped
            paginationRowsPerPageOptions={[]}
            noDataComponent="데이터를 찾는 중 입니다."
        />
    </section>
    </>
  );
};

export default OrderList;
