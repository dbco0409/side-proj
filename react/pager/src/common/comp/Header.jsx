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
    try {
      await api.post("/logout");
      setLoginUser(null);

      window.location.replace("/pager/login");

    } catch (e) {
      console.error(e);
    }
  };


  return (
    <header id="header">
      <div className="inner">
        <button type="button" className="menuBtn" id="menuBtn">
          <img src="/images/common/menu.svg" alt="" />
        </button>

        <div className="logo">
          <a href="/pager/"><img src="/images/common/logo.png" alt="logo" /></a>
        </div>

        <div className="menu">
          {/* ✅ 로그인 안 된 경우 */}
          {!loginUser && (
            <div className="rightMenu">
              <a href="/pager/login">로그인</a>
              <a href="/pager/join">회원가입</a>
            </div>
          )}

          {/* ✅ 관리자 로그인 */}
          {loginUser && loginUser.mbId === "admin@naver.com" && (
            <div className="rightMenu">
              <a href={`${import.meta.env.VITE_API_BASE_URL}/admin/main`}>관리자</a>
              <button onClick={handleLogout}>로그아웃</button>
            </div>
          )}

          {/* ✅ 일반 회원 로그인 */}
          {loginUser && loginUser.mbId !== "admin@naver.com" && (
            <div className="rightMenu">
              <a href="/pager/memberEdit">내정보</a>
              <button onClick={handleLogout}>로그아웃</button>
            </div>
          )}

          <nav className="gnb" id="gnb">
            <ul>
              <li><a href="/pager/ordering_list">발주계획</a></li>
              <li><a href="/pager/bid_list">입찰정보</a></li>
              <li><a href="/pager/company_list">구인정보</a></li>
              <li><a href="/pager/shop_list">페이저샵</a></li>
              <li><a href="/pager/news_list">뉴스/인사이트</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Header;
