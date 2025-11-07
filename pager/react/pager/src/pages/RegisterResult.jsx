import "../css/login.css";

const ResisterResult = () => {

  return (
    <>
    <section id="login">
        <form action="/login">
            <div className="logininner">
                <h2>회원가입이 완료되었습니다.</h2>
                <a className="btn loginBtn" href="/login">로그인</a>
            </div>
        </form>
    </section>
    </>
  );
};

export default ResisterResult;
