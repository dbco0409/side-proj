import { useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import axios from "axios";
import "../css/login.css";

const ForgetPasswordReset = () => {
  const navigate = useNavigate();
  const location = useLocation();

  const searchParams = new URLSearchParams(location.search);
  const mbId = searchParams.get("mbId") || location.state?.mbId || "";
  const mbName = searchParams.get("mbName") || location.state?.mbName || "";

  const [form, setForm] = useState({
    mbPassword: "",
    mbPasswordRe: "",
  });
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };


  const handleSubmit = async (e) => {
    e.preventDefault();

    const { mbPassword, mbPasswordRe } = form;

    if (!mbPassword || !mbPasswordRe) {
      alert("비밀번호를 입력해주세요.");
      return;
    }

    if (mbPassword !== mbPasswordRe) {
      alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
      return;
    }

    setLoading(true);
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_BASE_URL}/forget2`,
        new URLSearchParams({
          mbId,
          mbName,
          mbPassword,
          mbPasswordRe,
        }),
        {
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
        }
      );

      const result = res.data;

      if (result.success) {
        alert("비밀번호가 성공적으로 변경되었습니다. 로그인 페이지로 이동합니다.");
        window.location.href = result.redirect || "/pager/login";
      } else {
        alert(result.message || "비밀번호 변경에 실패했습니다.");
      }
    } catch (err) {
      console.error("비밀번호 변경 오류:", err);
      alert("서버 통신 중 오류가 발생했습니다.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <section id="login">
      <form id="findpw" onSubmit={handleSubmit}>
        <input type="hidden" name="mbId" value={mbId} />
        <input type="hidden" name="mbName" value={mbName} />

        <div className="logininner">
          <h2>비밀번호 변경</h2>

          <div className="inputbox">
            <input
              type="password"
              name="mbPassword"
              id="mbPassword"
              placeholder="변경할 비밀번호를 입력해주세요."
              value={form.mbPassword}
              onChange={handleChange}
              required
            />
          </div>

          <div className="inputbox">
            <input
              type="password"
              name="mbPasswordRe"
              id="mbPasswordRe"
              placeholder="변경할 비밀번호를 한번 더 입력해주세요."
              value={form.mbPasswordRe}
              onChange={handleChange}
              required
            />
          </div>

          <button
            type="submit"
            disabled={loading}
            className="btn btn-ok"
            style={{
              cursor: "pointer",
            }}
          >
            {loading ? "처리 중..." : "비밀번호 변경"}
          </button>
        </div>
      </form>
    </section>
  );
};

export default ForgetPasswordReset;
