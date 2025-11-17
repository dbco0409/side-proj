import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Pagination, Navigation } from "swiper/modules";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

const Main01 = () => {
  const goTo = (url) => {
    window.location.href = url;
  };

  return (
    <section id="main01">
      <Swiper
        className="main_slider"
        modules={[Pagination, Navigation]}
        loop={true}
        pagination={{ clickable: true }}
        navigation={true}
      >
        <SwiperSlide className="slide01">
          <div className="box">
            <div className="title">
              <h2>
                PAGER<span>+</span>
              </h2>
              <p>
                웹사이트 입찰 정보를 한 곳에 모은,
                <br />
                당신의 비즈니스 성장 플랫폼.
              </p>
              <button className="btn" onClick={() => goTo("/pager/bid_list")}>
                지금 핫한 입찰 정보 보기
              </button>
            </div>
          </div>
        </SwiperSlide>

        <SwiperSlide className="slide02">
          <div className="box">
            <div className="title">
              <h2>
                Connect<span>+</span>
              </h2>
              <p>
                웹 에이전시와 발주처를 연결하고,
                <br />
                새로운 협력의 기회를 만듭니다.
              </p>
              <button className="btn" onClick={() => goTo("/pager/ordering_list")}>
                최신 발주 정보 보기
              </button>
            </div>
          </div>
        </SwiperSlide>

        <SwiperSlide className="slide03">
          <div className="box">
            <div className="title">
              <h2>
                Growth<span>+</span>
              </h2>
              <p>
                정확한 입찰 정보를 통해 더 많은 프로젝트,
                <br />
                더 큰 비즈니스 성장을 경험하세요.
              </p>
              <button className="btn" onClick={() => goTo("/pager/bid_list")}>
                최신 입찰 정보 보기
              </button>
            </div>
          </div>
        </SwiperSlide>
      </Swiper>
    </section>
  );
};

export default Main01;
