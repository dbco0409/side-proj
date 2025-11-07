document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('filterForm');
    const category1Input = document.querySelector('input[name="category1"]');
    const category2Input = document.querySelector('input[name="category2"]');
    const minInput = document.getElementById('minPrice');
    const maxInput = document.getElementById('maxPrice');
    const leftVal = document.getElementById('left-value');
    const rightVal = document.getElementById('right-value');

    // ✅ 이벤트 위임으로 active 클래스 유지
    document.addEventListener('click', function(e) {
        // category1 클릭
        if (e.target.closest('#category1 li')) {
            const li = e.target.closest('#category1 li');
            document.querySelectorAll('#category1 li').forEach(el => el.classList.remove('active'));
            li.classList.add('active');
            category1Input.value = li.textContent.trim();
            loadShopList();
        }

        // category2 클릭
        if (e.target.closest('#category2 li')) {
            const li = e.target.closest('#category2 li');
            document.querySelectorAll('#category2 li').forEach(el => el.classList.remove('active'));
            li.classList.add('active');
            category2Input.value = li.textContent.trim();
            loadShopList();
        }
    });

    // ✅ 슬라이더 관련 엘리먼트
    const leftSlider = document.getElementById("input-left");
    const rightSlider = document.getElementById("input-right");
    const thumbLeft = document.querySelector(".thumb.left");
    const thumbRight = document.querySelector(".thumb.right");
    const rangeBar = document.querySelector(".slider .range");
    const minGap = 10000;
    const maxValue = parseInt(rightSlider.max);

    // ✅ 슬라이더 위치 반영 함수
    function setLeftValue() {
        let left = parseInt(leftSlider.value);
        let right = parseInt(rightSlider.value);
        if (right - left < minGap) {
            leftSlider.value = right - minGap;
            left = right - minGap;
        }
        const percentLeft = (left / maxValue) * 100;
        thumbLeft.style.left = percentLeft + "%";
        rangeBar.style.left = percentLeft + "%";
        leftVal.textContent = left.toLocaleString();
        minInput.value = left;
    }

    function setRightValue() {
        let left = parseInt(leftSlider.value);
        let right = parseInt(rightSlider.value);
        if (right - left < minGap) {
            rightSlider.value = left + minGap;
            right = left + minGap;
        }
        const percentRight = 100 - (right / maxValue) * 100;
        thumbRight.style.right = percentRight + "%";
        rangeBar.style.right = percentRight + "%";
        rightVal.textContent = right.toLocaleString();
        maxInput.value = right;
    }

    // ✅ 슬라이더 이동 시 동작
    leftSlider.addEventListener("input", () => {
        setLeftValue();
        loadShopList();
    });

    rightSlider.addEventListener("input", () => {
        setRightValue();
        loadShopList();
    });

    // 초기 위치 세팅
    setLeftValue();
    setRightValue();

    // ✅ Ajax로 리스트 갱신
	function loadShopList() {
	  const formData = new FormData(form);

	  fetch('/shop/list', {
	      method: 'POST',
	      body: formData
	  })
	  .then(res => res.text())
	  .then(html => {
	      const parser = new DOMParser();
	      const doc = parser.parseFromString(html, 'text/html');
	      const newListArea = doc.querySelector('#shop_list_area');

	      const target = document.querySelector('#shop_list_area');
	      if (newListArea && newListArea.innerHTML.trim() !== "") {
	          // ✅ 새로운 리스트가 존재하면 교체
	          target.innerHTML = newListArea.innerHTML;
	      } else {
	          // ✅ 결과가 없으면 메시지 표시
	          target.innerHTML = `
	              <div class="no-data" style="padding:40px 0; text-align:center; color:#999; font-size:16px;">
	                등록된 상품이 없습니다.
	              </div>
	          `;
	      }
	  })
	  .catch(err => {
	      console.error('리스트 로딩 오류:', err);
	      document.querySelector('#shop_list_area').innerHTML = `
	          <div class="no-data" style="padding:40px 0; text-align:center; color:#999; font-size:16px;">
	            데이터를 불러오는 중 오류가 발생했습니다.
	          </div>
	      `;
	  });
	}

});
