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
	modalTitle.innerHTML = `${year}-${month}-${day}`

	// input에 데이터 가져오기
	const year2 = document.querySelector('.year').innerHTML
	const month2 = document.querySelector('.month').innerHTML
	const dataValue = document.querySelector('.date-title')

	dataValue.value = `${year2}-${month2}-${day}`.replace(/(\s*)/g, "")

	// input에 데이터 가져오기
	const year3 = document.querySelector('.year').innerHTML
	const month3 = document.querySelector('.month').innerHTML
	const dataValue2 = document.querySelector('.date-title2')

	dataValue2.value = `${year3}-${month3}-${day}`.replace(/(\s*)/g, "")
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