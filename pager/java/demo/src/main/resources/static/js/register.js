function agreePopup() {
	const checkbox = document.getElementById('agree01');
	const popup = document.getElementById('agreePopup');

	// 체크박스 자동 체크
	checkbox.checked = true;

	// 팝업 열기
	popup.style.display = 'block';
}

function closePopup() {
	document.getElementById('agreePopup').style.display = 'none';
}