import { useEffect, useRef } from "react";

const Main02 = () => {
  const sectionRef = useRef(null);
  const animatedRef = useRef(false);

  useEffect(() => {
    const section = sectionRef.current;
    if (!section) return;

    const counters = section.querySelectorAll("h4");

    const countUp = (el) => {
      const target = +el.innerText.replace(/,/g, "");
      let start = 0;
      const duration = 1000;
      const stepTime = 16;
      const increment = target / (duration / stepTime);

      const timer = setInterval(() => {
        start += increment;
        if (start >= target) {
          clearInterval(timer);
          el.innerText = target.toLocaleString();
        } else {
          el.innerText = Math.floor(start).toLocaleString();
        }
      }, stepTime);
    };

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && !animatedRef.current) {
            animatedRef.current = true; // 한 번만 실행
            section.querySelectorAll("li").forEach((li) => li.classList.add("visible"));
            counters.forEach((el) => countUp(el));
          }
        });
      },
      { threshold: 0.5 }
    );

    observer.observe(section);

    // cleanup (컴포넌트 언마운트 시)
    return () => observer.disconnect();
  }, []);

  return (
    <section id="main02" ref={sectionRef}>
      <ul>
        <li>
          <h4>15,820</h4>
          <p>누적 입찰 데이터</p>
        </li>
        <li>
          <h4>720</h4>
          <p>누적 공공입찰 데이터</p>
        </li>
        <li>
          <h4>1,215</h4>
          <p>누적 민간입찰 데이터</p>
        </li>
        <li>
          <h4>152</h4>
          <p>낙찰 성공 건수</p>
        </li>
      </ul>
    </section>
  );
};

export default Main02;
