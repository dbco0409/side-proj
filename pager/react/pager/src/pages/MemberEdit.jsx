import { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import "../css/login.css";

const MemberEdit = () => {
  const navigate = useNavigate();
  const [form, setForm] = useState({
    mbId: "",
    mbPassword: "",
    mbPasswordNew: "",
    mbPasswordRe: "",
    mbName: "",
  });
  const [loading, setLoading] = useState(false);

  // ✅ 로그인된 사용자 정보 불러오기 (선택)
  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_API_BASE_URL}/member-info`, { withCredentials: true }) // ← 서버에서 현재 사용자 정보 반환 (예: session 기반)
      .then((res) => {
        if (res.data.success && res.data.user) {
          setForm((prev) => ({
            ...prev,
            mbId: res.data.user.mbId,
            mbName: res.data.user.mbName,
          }));
        }
      })
      .catch((err) => console.error("회원정보 불러오기 실패:", err));
  }, []);

  // ✅ 입력값 변경 핸들러
  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  // ✅ 회원 정보 수정 요청
  const handleSubmit = async (e) => {
    e.preventDefault();
    const { mbPasswordNew, mbPasswordRe } = form;

    if (!mbPasswordNew || !mbPasswordRe) {
      alert("새로운 비밀번호를 입력해주세요.");
      return;
    }

    if (mbPasswordNew !== mbPasswordRe) {
      alert("새로운 비밀번호가 일치하지 않습니다.");
      return;
    }

    setLoading(true);
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_BASE_URL}/member`,
        new URLSearchParams(form),
        { headers: { "Content-Type": "application/x-www-form-urlencoded" },
         withCredentials: true 
        }
      );

      const result = res.data;

      if (result.success) {
        alert("회원정보가 수정되었습니다.");
        navigate("/");
      } else {
        alert(result.message || "회원정보 수정에 실패했습니다.");
      }
    } catch (err) {
      console.error("회원정보 수정 오류:", err);
      alert("서버 오류가 발생했습니다.");
    } finally {
      setLoading(false);
    }
  };

  // ✅ 회원 탈퇴 요청
  const handleDelete = async () => {
    const confirmed = window.confirm(
      "정말로 탈퇴하시겠습니까?\n탈퇴 후에는 계정 복구가 불가능합니다."
    );
    if (!confirmed) return;

    try {
      const res = await axios.post(`${import.meta.env.VITE_API_BASE_URL}/hash`,{}, {
        headers: { "Content-Type": "application/json"},
        withCredentials: true
      });

      const result = res.data;

      if (result.success) {
        alert("회원 탈퇴가 완료되었습니다.");
        location.href = "/";
      } else {
        alert(result.message || "회원 탈퇴에 실패했습니다.");
      }
    } catch (err) {
      console.error("회원 탈퇴 오류:", err);
      alert("서버 통신 중 오류가 발생했습니다.");
    }
  };

  return (
    <section id="login">
      <form id="registerForm" onSubmit={handleSubmit}>
        <div className="logininner">
          <h2>내 정보 수정</h2>

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
              type="password"
              name="mbPassword"
              id="mbPassword"
              placeholder="현재 비밀번호를 입력해주세요."
              value={form.mbPassword}
              onChange={handleChange}
              required
            />
          </div>

          <div className="inputbox">
            <input
              type="password"
              name="mbPasswordNew"
              id="mbPasswordNew"
              placeholder="새로운 비밀번호를 입력해주세요."
              value={form.mbPasswordNew}
              onChange={handleChange}
              required
            />
          </div>

          <div className="inputbox">
            <input
              type="password"
              name="mbPasswordRe"
              id="mbPasswordRe"
              placeholder="새로운 비밀번호를 한번 더 입력해주세요."
              value={form.mbPasswordRe}
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
            style={{ marginBottom: "10px" }}
          >
            {loading ? "처리 중..." : "회원수정"}
          </button>

          <button
            type="button"
            className="btn btn-hash"
            onClick={handleDelete}
            style={{ background: "transparent", color: "#5b5b5bff", fontSize: "16px" }}
          >
            회원탈퇴
          </button>
        </div>
      </form>
    </section>
  );
};

export default MemberEdit;
