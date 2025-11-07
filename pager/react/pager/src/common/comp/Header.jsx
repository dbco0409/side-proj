import { useEffect, useState } from "react";
import api from "../../api/axios";

const Header = () => {
  const [loginUser, setLoginUser] = useState(null);

  useEffect(() => {
    // 로그인 세션 확인
    api.get("/session")
      .then(res => {
        setLoginUser(res.data.loginUser);
      })
      .catch(() => setLoginUser(null));
  }, []);

  const handleLogout = async () => {
    await api.post("/logout");
    setLoginUser(null);
  };

  return (
    <header id="header">
      <div className="inner">
        <button type="button" className="menuBtn" id="menuBtn">
          <img src="/images/common/menu.svg" alt="" />
        </button>

        <div className="logo">
          <a href="/"><img src="/images/common/logo.png" alt="logo" /></a>
        </div>

        <div className="menu">
          {/* ✅ 로그인 안 된 경우 */}
          {!loginUser && (
            <div className="rightMenu">
              <a href="/login">로그인</a>
              <a href="/join">회원가입</a>
            </div>
          )}

          {/* ✅ 관리자 로그인 */}
          {loginUser && loginUser.mbId === "admin@naver.com" && (
            <div className="rightMenu">
              <a href="/admin/main">관리자</a>
              <button onClick={handleLogout}>로그아웃</button>
            </div>
          )}

          {/* ✅ 일반 회원 로그인 */}
          {loginUser && loginUser.mbId !== "admin@naver.com" && (
            <div className="rightMenu">
              <a href="/memberEdit">내정보</a>
              <button onClick={handleLogout}>로그아웃</button>
            </div>
          )}

          <nav className="gnb" id="gnb">
            <ul>
              <li><a href="/ordering_list">발주계획</a></li>
              <li><a href="/bid_list">입찰정보</a></li>
              <li><a href="/company_list">구인정보</a></li>
              <li><a href="/shop_list">페이저샵</a></li>
              <li><a href="/news_list">뉴스/인사이트</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Header;
