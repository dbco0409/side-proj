import { useState } from "react";
import axios from "axios";
import "../css/login.css";

const Register = () => {
  const [form, setForm] = useState({
    mbId: "",
    mbPassword: "",
    mbPasswordRe: "",
    mbName: "",
    agree01: false,
  });

  const [loading, setLoading] = useState(false);
  const [showAgree, setShowAgree] = useState(false);

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setForm((prev) => ({
      ...prev,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const { mbId, mbPassword, mbPasswordRe, mbName, agree01 } = form;

    if (!mbId || !mbPassword || !mbPasswordRe || !mbName) {
      alert("모든 항목을 입력해주세요.");
      return;
    }

    if (mbPassword !== mbPasswordRe) {
      alert("비밀번호가 일치하지 않습니다.");
      return;
    }

    if (!agree01) {
      alert("이용약관에 동의해야 회원가입이 가능합니다.");
      return;
    }

    setLoading(true);
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_BASE_URL}/register`,
        new URLSearchParams({
          mbId,
          mbPassword,
          mbPasswordRe,
          mbName,
        }),
        {
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
        }
      );

      const result = res.data;

      if (result.success) {
        window.location.href = "/pager/joinOk";
      } else {
        alert(result.message || "회원가입에 실패했습니다.");
      }
    } catch (err) {
      console.error("회원가입 오류:", err);
      alert("서버 통신 중 오류가 발생했습니다.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      {/* ✅ 회원가입 폼 */}
      <section id="login">
        <form id="registerForm" onSubmit={handleSubmit}>
          <div className="logininner">
            <h2>회원가입</h2>

            <div className="inputbox">
              <input
                type="email"
                name="mbId"
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

            <div className="inputbox">
              <input
                type="password"
                name="mbPasswordRe"
                value={form.mbPasswordRe}
                onChange={handleChange}
                placeholder="비밀번호를 한번 더 입력해주세요."
                required
              />
            </div>

            <div className="inputbox">
              <input
                type="text"
                name="mbName"
                value={form.mbName}
                onChange={handleChange}
                placeholder="이름을 입력해주세요."
                required
              />
            </div>

            <div
              className="agree"
              style={{ cursor: "pointer" }}
              onClick={() => setShowAgree(true)}
            >
              <input
                type="checkbox"
                id="agree01"
                name="agree01"
                checked={form.agree01}
                onChange={handleChange}
              />
              <label htmlFor="agree01">이용약관 동의(필수)</label>
            </div>

            <button type="submit" className="btn btn-ok" disabled={loading}>
              {loading ? "처리 중..." : "회원가입"}
            </button>
          </div>
        </form>
      </section>

      {/* ✅ 이용약관 팝업 */}
      {showAgree && (
        <div
          id="agreePopup"
          className="popup"
          style={{
            position: "fixed",
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            background: "rgba(0,0,0,0.5)",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            zIndex: 9999,
          }}
          onClick={() => setShowAgree(false)}
        >
          <div
            className="popup-content"
            style={{
              background: "#fff",
              padding: "30px",
              borderRadius: "8px",
              width: "90%",
              maxWidth: "500px",
              position: "relative",
            }}
            onClick={(e) => e.stopPropagation()} // 팝업 내부 클릭 시 닫히지 않도록
          >
            <span
              className="close"
              onClick={() => setShowAgree(false)}
              style={{
                position: "absolute",
                right: "15px",
                top: "10px",
                fontSize: "24px",
                cursor: "pointer",
              }}
            >
              &times;
            </span>
            <h3>이용약관</h3>
            <p style={{ lineHeight: "1.6", marginTop: "10px" }}>
              본 서비스는 회원님의 개인정보를 안전하게 보호하며,
              <br />
              법령 및 서비스 정책에 따라 회원님의 데이터를 관리합니다.
              <br />
              가입 시 이용약관과 개인정보 수집 및 이용에 동의하게 됩니다.
            </p>
          </div>
        </div>
      )}
    </>
  );
};

export default Register;
