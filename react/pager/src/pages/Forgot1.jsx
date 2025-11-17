import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import "../css/login.css";

const ForgetPassword = () => {
  const navigate = useNavigate();
  const [form, setForm] = useState({
    mbId: "",
    mbName: "",
  });
  const [loading, setLoading] = useState(false);

  // ✅ 입력값 변경 핸들러
  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  // ✅ 비밀번호 찾기 요청
  const handleSubmit = async (e) => {
    e.preventDefault();

    const { mbId, mbName } = form;

    if (!mbId || !mbName) {
      alert("이메일과 이름을 모두 입력해주세요.");
      return;
    }

    setLoading(true);
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_BASE_URL}/forget1`,
        new URLSearchParams(form),
        {
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
        }
      );

      const result = res.data;

      if (result.success) {
        alert("인증이 완료되었습니다. 다음 단계로 이동합니다.");
        window.location.href = "/pager/forgot2?mbId=" + encodeURIComponent(mbId) + "&mbName=" + encodeURIComponent(mbName);
      } else {
        alert(result.message || "입력하신 정보가 올바르지 않습니다.");
      }
    } catch (err) {
      console.error("비밀번호 찾기 오류:", err);
      alert("서버 통신 중 오류가 발생했습니다.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <section id="login">
      <form id="findpw" onSubmit={handleSubmit}>
        <div className="logininner">
          <h2>비밀번호 찾기</h2>

          <div className="inputbox">
            <input
              type="email"
              name="mbId"
              placeholder="이메일을 입력해주세요."
              value={form.mbId}
              onChange={handleChange}
              required
            />
          </div>

          <div className="inputbox">
            <input
              type="text"
              name="mbName"
              placeholder="이름을 입력해주세요."
              value={form.mbName}
              onChange={handleChange}
              required
            />
          </div>

          <button
            type="submit"
            className="btn btn-ok"
            disabled={loading}
            style={{
              cursor: "pointer",
            }}
          >
            {loading ? "확인 중..." : "비밀번호 찾기"}
          </button>
        </div>
      </form>
    </section>
  );
};

export default ForgetPassword;
