import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay, Pagination, Navigation } from "swiper/modules";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

const Main03 = () => {
  const goTo = (url) => {
    window.location.href = url;
  };

  return (
    <section id="main03">
        <Swiper
        className="main_slider"
        modules={[Autoplay, Pagination, Navigation]}
        loop={true}
        autoplay={{
          delay: 4000,
          disableOnInteraction: false,
        }}
      >
            <SwiperSlide className="slide01">
                <div className="box">
                    <h3>2026년 서울시립미술관 홈페이지·앱 유지관리 용역</h3>
                    <p>2025-11-06 16:15</p>
                    <button className="btn" onClick={() => goTo("/pager/ordering_view/R25DD20437475")}>발주 공고 상세 보기</button>
                </div>
            </SwiperSlide>
            <SwiperSlide className="swiper-slide slide02">
                <div className="box">
                    <h3>지스타 국제게임컨퍼런스 G-CON 2025 위탁용역</h3>
                    <p>2025-05-14 18:02</p>
                    <button className="btn" onClick={() => goTo("/pager/bid_view/R25BK00821908")}>입찰 공고 상세 보기</button>
                </div>
            </SwiperSlide>
        </Swiper>
	</section>
  );
};

export default Main03;
