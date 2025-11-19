import { useState, useEffect } from "react";
import DataTable from "react-data-table-component";
import dayjs from "dayjs";
import axios from "axios";
import '../css/style.css';

const OrderList = () => {
  const [items, setItems] = useState([]);
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    axios.get(`${import.meta.env.VITE_API_BASE_URL}/company/company_list`)
      .then((res) => {
        setItems(res.data.items || []);
      })
      .catch((err) => console.error("데이터 불러오기 실패:", err));
  }, []);

  const filteredItems = items.filter((item) => {
    const keyword = searchText.toLowerCase();
    return (
      (item.title && item.title.toLowerCase().includes(keyword)) ||
      (item.category1 && item.category1.toLowerCase().includes(keyword)) ||
      (item.company && item.company.toLowerCase().includes(keyword))
    );
  });


    const columns = [
    {
        name: "카테고리",
        selector: (row) => row.category1,
        width: "180px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/company_view/${row.id}`}
            style={{ cursor: "pointer" }}
        >
            {row.category1 || "-"}
        </span>
        ),
    },
    {
        name: "제목",
        selector: (row) => row.title,
        sortable: true,
        width: "380px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/company_view/${row.id}`}
            style={{ cursor: "pointer" }}
        >
            {row.title || "-"}
        </span>
        ),
    },
    {
        name: "회사명",
        selector: (row) => row.company,
        width: "180px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/company_view/${row.id}`}
            style={{ cursor: "pointer" }}
        >
            {row.company || "-"}
        </span>
        ),
    },
    {
        name: "상태",
        selector: (row) => row.status,
        width: "180px",
        cell: (row) => (
        <span
            onClick={() => window.location.href = `/company_view/${row.id}`}
            style={{ cursor: "pointer" }}
        >
            {row.status || "-"}
        </span>
        ),
    },
    {
        name: "등록일",
        width: "120px",
        center: true,
        cell: (row) => {
        const formatted = row.startTime ? dayjs(row.startTime).format("YYYY-MM-DD") : "-";
        return <span>{formatted}</span>;
        },
    },
    {
        name: "채용마감일",
        width: "120px",
        center: true,
        cell: (row) => {
        const formatted = row.endTime ? dayjs(row.endTime).format("YYYY-MM-DD") : "-";
        return <span>{formatted}</span>;
        },
    },
    ];



  return (
    <>
        <section id="sub_top">
            <div className="sub_main">
                <div className="txtBox">
                    <h4>구인정보</h4>
                    <p>Job posting</p>
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
