import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import "../css/login.css";

const Login = () => {
  const navigate = useNavigate();

  // ✅ 입력 상태 관리
  const [form, setForm] = useState({
    mbId: "",
    mbPassword: "",
  });

  const [loading, setLoading] = useState(false);

  // ✅ 입력값 변경 핸들러
  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  // ✅ 로그인 처리
  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!form.mbId || !form.mbPassword) {
      alert("이메일과 비밀번호를 모두 입력해주세요.");
      return;
    }

    setLoading(true);
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_BASE_URL}/login`,
        new URLSearchParams(form),
        {
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          withCredentials: true, // ✅ 세션 쿠키 유지용 (Spring 세션 공유)
        }
      );

      const result = res.data;

      if (result.success) {
        window.location.href = "/pager";
      } else {
        alert(result.message || "아이디 또는 비밀번호가 올바르지 않습니다.");
      }
    } catch (err) {
      console.error("로그인 요청 오류:", err);
      alert("서버 통신 오류가 발생했습니다.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <section id="login" style={{ padding: "80px 0", textAlign: "center" }}>
      <form id="loginForm" onSubmit={handleSubmit}>
        <div className="logininner">
          <h2>로그인</h2>

          <div className="inputbox">
            <input
              type="email"
              name="mbId"
              id="mbId"
              value={form.mbId}
              onChange={handleChange}
              placeholder="이메일을 입력해주세요."
              required
            />
          </div>

          <div className="inputbox">
            <input
              type="password"
              name="mbPassword"
              value={form.mbPassword}
              onChange={handleChange}
              placeholder="비밀번호를 입력해주세요."
              required
            />
          </div>

          <div className="inputbox findpwbox">
            <a href="/pager/forgot1" className="findpw">
              비밀번호 찾기
            </a>
          </div>

          <button type="submit" className="btn btn-ok" disabled={loading}>
            {loading ? "로그인 중..." : "로그인"}
          </button>

          <div className="join">
            <p>아직 회원이 아니신가요?</p>
            <a href="/pager/join">회원가입</a>
          </div>
        </div>
      </form>
    </section>
  );
};

export default Login;
