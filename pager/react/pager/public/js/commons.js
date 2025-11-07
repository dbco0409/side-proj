document.addEventListener("DOMContentLoaded", () => {
  const menuBtn = document.getElementById("menuBtn");
  const closeBtn = document.getElementById("closeBtn");
  const mobileMenu = document.getElementById("mobileMenu");
  const overlay = document.getElementById("menuOverlay");

  // 메뉴 열기
  menuBtn.addEventListener("click", () => {
    mobileMenu.classList.add("active");
    overlay.classList.add("active");
    document.body.style.overflow = "hidden"; // 스크롤 방지
  });

  // 메뉴 닫기
  closeBtn.addEventListener("click", closeMenu);
  overlay.addEventListener("click", closeMenu);

  function closeMenu() {
    mobileMenu.classList.remove("active");
    overlay.classList.remove("active");
    document.body.style.overflow = ""; // 스크롤 복구
  }
});

$(window).on("scroll", function () {
	if ($(window).scrollTop() > 100) {
		$("#header").addClass("scroll");
	} else {
		$("#header").removeClass("scroll");
	}
});


function showPop(a){
	$(a).fadeIn();
}

function hidePop(a){
	$(a).fadeOut();
}

function fnMove(seq){
		var offset = $(seq).offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
}

function fnback(n){
	history.back();
}
function loca(n){
	location.href=n;
}
