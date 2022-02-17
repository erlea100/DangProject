// event handler의 매개변수로 오는 값은 event

function showPopup(event) {
	// event를 발생시킨 element(target)의 value
	const day = event.target.value

	// modal open
	const elementsList = document.querySelectorAll('#modal')
		
	elementsList.forEach((ele) => {
		ele.classList.remove('hidden')
	})

	// modal 값 주입
	const year = document.querySelector('.year').innerHTML
	const month = document.querySelector('.month').innerHTML
	const modalTitle = document.querySelector('.modal-title')
	modalTitle.innerHTML = `${year}년${month}월 ${day} 일`

	// input에 modal데이터 가져오기
	const text_year = document.querySelector('.year').innerHTML
	const text_month = document.querySelector('.month').innerHTML
	const dataValue = document.querySelector('.date-title')

	dataValue.value = `${text_year}${text_month}${day}`.replace(/(\s*)/g, "")

	
}

(function init() {
	const buttonElementList = document.querySelectorAll('#date')

	buttonElementList.forEach(button => {
		button.addEventListener('click', showPopup)
	})
	
	const modalCloseHandler = (event) => {
		if (event.keyCode === 27) {
			const elementsList = document.querySelectorAll('#modal')
			elementsList.forEach((ele) => {
				ele.classList.add('hidden')
			})
		}
	}

	const modal = document.getElementById('modal')
	const close = document.getElementById('jsCloseBtn')
	
	//Hide modal
	close.addEventListener('click', () => {
		modal.classList.add('hidden')
	})



	// 모달 종료
	window.addEventListener('keyup', modalCloseHandler)

})()

// 제이쿼리 탭
$(function() {
	console.log('jquery start')
	var topDiv = $('.modal');

	var anchors = topDiv.find('ul.modal-tabs a')
	var panelDivs = topDiv.find('div.modal-contents')

	anchors.show();
	panelDivs.hide();

	var lastAnchor = anchors.filter("#on");
	var lastPanel = $(lastAnchor.attr('href'));

	lastPanel.show();

	$('.modal').tabs();
})