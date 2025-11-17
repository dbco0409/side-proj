import { useState } from "react";
import api from "../../api/axios"; // ← axios 인스턴스 (withCredentials 포함된 기본 설정)

const Main05 = () => {
  // ✅ 폼 상태 정의
  const [form, setForm] = useState({
    name: "",
    department: "",
    company: "",
    tel: "",
    email: "",
    category: "",
    content: "",
  });

  // ✅ 입력값 변경 핸들러
  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm({ ...form, [name]: value });
  };

  // ✅ 폼 제출 핸들러
  const handleSubmit = async (e) => {
    e.preventDefault();

    // 유효성 검사 (선택)
    if (!form.name || !form.tel || !form.email || !form.category || !form.content) {
      alert("필수 항목을 모두 입력해주세요.");
      return;
    }

    try {
      const res = await api.post(`${import.meta.env.VITE_API_BASE_URL}`, form); // ✅ Spring Controller에서 /contact POST 받도록 설정
      if (res.data.success) {
        alert(res.data.message || "문의가 정상적으로 등록되었습니다.");
        setForm({
          name: "",
          department: "",
          company: "",
          tel: "",
          email: "",
          category: "",
          content: "",
        });
      } else {
        alert(res.data.message || "등록에 실패했습니다.");
      }
    } catch (err) {
      console.error(err);
      alert("서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
    }
  };

  return (
    <form id="contactForm" onSubmit={handleSubmit}>
      <section id="main06">
        <div className="inner">
          <div className="title">
            <h3>
              Contact <span>Us</span>
            </h3>
            <p>
              제휴를 원하거나 궁금한 점이 있으시면 언제든지 문의해주세요.
              <br />
              담당자가 빠르게 답변해 드립니다.
            </p>
          </div>

          <div className="m_frm">
            {/* 왼쪽 영역 */}
            <div className="col-left">
              <div className="input_group lefts">
                <div className="inputs">
                  <label htmlFor="name">이름</label>
                  <input
                    type="text"
                    name="name"
                    id="name"
                    placeholder="이름"
                    className="input_text"
                    value={form.name}
                    onChange={handleChange}
                    required
                  />
                </div>
              </div>

              <div className="input_group">
                <div className="inputs first">
                  <label htmlFor="department">부서</label>
                  <input
                    type="text"
                    name="department"
                    id="department"
                    placeholder="부서"
                    className="input_text"
                    value={form.department}
                    onChange={handleChange}
                  />
                </div>
                <div className="inputs">
                  <label htmlFor="company">회사</label>
                  <input
                    type="text"
                    name="company"
                    id="company"
                    placeholder="회사"
                    className="input_text"
                    value={form.company}
                    onChange={handleChange}
                  />
                </div>
              </div>

              <div className="input_group">
                <div className="inputs first">
                  <label htmlFor="tel">연락처</label>
                  <input
                    type="tel"
                    name="tel"
                    id="tel"
                    placeholder="연락처"
                    className="input_text"
                    value={form.tel}
                    onChange={handleChange}
                    required
                  />
                </div>
                <div className="inputs">
                  <label htmlFor="email">이메일</label>
                  <input
                    type="email"
                    name="email"
                    id="email"
                    placeholder="이메일"
                    className="input_text"
                    value={form.email}
                    onChange={handleChange}
                    required
                  />
                </div>
              </div>
            </div>

            {/* 오른쪽 영역 */}
            <div className="col-left">
              <div className="input_group">
                <div className="inputs div_block">
                  <label htmlFor="category">문의사항</label>
                  <select
                    id="category"
                    name="category"
                    className="sel_txt first"
                    value={form.category}
                    onChange={handleChange}
                    required
                  >
                    <option value="">문의카테고리</option>
                    <option value="제휴">제휴</option>
                    <option value="회원">회원</option>
                    <option value="사이트">사이트</option>
                    <option value="상품">상품</option>
                    <option value="배송">배송</option>
                    <option value="반품/취소">반품/취소</option>
                    <option value="기타">기타</option>
                  </select>
                </div>
              </div>

              <div className="input_group">
                <div className="inputs div_block">
                  <textarea
                    name="content"
                    id="content"
                    placeholder="내용을 입력하세요."
                    className="con_text"
                    value={form.content}
                    onChange={handleChange}
                    required
                  ></textarea>
                </div>
              </div>

              <div className="input_group">
                <div className="btns div_block">
                  <button type="submit" className="btn_submit">
                    Send
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </form>
  );
};

export default Main05;
