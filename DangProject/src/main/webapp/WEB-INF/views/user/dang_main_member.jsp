<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 세션 연결
if (session.getAttribute("id") == null) {
	response.sendRedirect("loginForm.do");
}
Object id = session.getAttribute("id");
Object name = session.getAttribute("name");
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="/resources/css/Dang_main.css?after"
	type="text/css" />
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#headers").load("/resources/header(member).html"); //헤더 인클루드
		$("#footers").load("/resources/footer.html"); //푸터부분 인클루드
		$("#containers").load("/resources/container.html"); //푸터부분 인클루드
	});
</script>

<style>
@font-face {
	font-family: 'HSYuji-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

b:not(#footers b) {
	font-family: 'HSYuji-Regular';
	font-size: 38px;
	color: #d4a373;
}

.costInform a {
	display: none;
}

body {
	background-color: #fef9df;
}

.dashboard {
	background-color: white;
}
</style>


<body>
	<div id="headers"></div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<br>
		<div class="dashboard"
			style="border-radius: 36px; margin: auto; height: 1000px; padding: 30px; padding: 5%;">

			<div style="height: 500px">
				<div class="dashboard"
					style="width: 700px; height: 400px; float: left; padding: 30px;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart1"></canvas>
				</div>
				<div
					style="width: 250px; margin-top: 5%; height: 300px; float: right; padding: 30px;">

					<a id="first">소비1위</a><br> <br> <a id="second">소비2위</a> <a
						id="third">소비3위</a><br> <br>
					<div class="costInform">
						<c:forEach items="${boardList}" var="board">
							<a id="a_Feed">${board.a_Feed }</a>
							<br>
							<a id="a_Snack">${board.a_Snack }</a>
							<br>
							<a id="b_Diagnosis">${board.b_Diagnosis }</a>
							<br>
							<a id="b_Vaccin">${board.b_Vaccin }</a>
							<br>
							<a id="c_Grooming">${board.c_Grooming }</a>
							<br>
							<a id="c_Clothes">${board.c_Clothes }</a>
							<br>
							<a id="d_Nutrients">${board.d_Nutrients }</a>
							<br>
							<a id="d_Poo">${board.d_Poo }</a>
							<br>
							<a id="e_Trainning">${board.e_Trainning }</a>
							<br>
							<a id="e_Hotel">${board.e_Hotel }</a>
							<br>
							<a id="e_Kindergarten">${board.e_Kindergarten }</a>
							<br>
						</c:forEach>
					</div>
				</div>
			</div>

			<div style="height: 500px; display: flex">
				<div class="dashboard"
					style="width: 400px; height: 400px; margin-left: 10%;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart2"></canvas>
				</div>
				<div
					style="margin-left: 20%; width: 300px; height: 300px; padding: 30px">
					<p>
						5개의 피자 모양의 크기가 비슷하다면 <br>
						<br>균형있는 소비를 한 것입니다.<br>
						<br>
						<b>나의 달력보기로 <br>집사님의 가계부도 확인해볼까요?<br>&rarr; <a
							href="/user/calendar.do"><b>go!</b></a></b>
					</p>
					<div class="costInform">
						<c:forEach items="${boardList}" var="board">
							<a id="a_Feed">${board.a_Feed }</a>
							<br>
							<a id="a_Snack">${board.a_Snack }</a>
							<br>
							<a id="b_Diagnosis">${board.b_Diagnosis }</a>
							<br>
							<a id="b_Vaccin">${board.b_Vaccin }</a>
							<br>
							<a id="c_Grooming">${board.c_Grooming }</a>
							<br>
							<a id="c_Clothes">${board.c_Clothes }</a>
							<br>
							<a id="d_Nutrients">${board.d_Nutrients }</a>
							<br>
							<a id="d_Poo">${board.d_Poo }</a>
							<br>
							<a id="e_Trainning">${board.e_Trainning }</a>
							<br>
							<a id="e_Hotel">${board.e_Hotel }</a>
							<br>
							<a id="e_Kindergarten">${board.e_Kindergarten }</a>
							<br>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br>

		<div class="section2">
			<div class="infinity-slide">
				<div id="slide">
					<img src="/resources/imgs/1.PNG"
						onclick='window.open("http://prod.danawa.com/info/?pcode=11334894");'>
					<img src="/resources/imgs/2.PNG"
						onclick='window.open("http://prod.danawa.com/info/?pcode=11334894");'>
					<img src="/resources/imgs/3.PNG"
						onclick='window.open("https://www.11st.co.kr/products/2493461985?gclid=EAIaIQobChMIv6P56ZWE9gIVilVgCh3yXwvfEAYYASABEgLhKfD_BwE&utm_term=&utm_campaign=%B1%B8%B1%DB%BC%EE%C7%CEPC+%C3%DF%B0%A1%C0%DB%BE%F7&utm_source=%B1%B8%B1%DB_PC_S_%BC%EE%C7%CE&utm_medium=%B0%CB%BB%F6");'>
					<img src="/resources/imgs/4.PNG"
						onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=9000&inflow=naver&gclid=EAIaIQobChMI8dKv95WE9gIVMdWWCh3dNgEsEAYYASABEgKZGfD_BwE");'>
					<img src="/resources/imgs/6.PNG"
						onclick='window.open("https://www.terracanis.com/en-uk/dry-food-chicken-1554.html");'>
					<img src="/resources/imgs/7.PNG"
						onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=8223&inflow=naver&gclid=EAIaIQobChMI6b7ynJaE9gIVBq2WCh0Wlwk5EAQYBCABEgKwsvD_BwE");'>
					<img src="/resources/imgs/8.PNG"
						onclick='window.open("https://www.gegomall.com/goods/goods_view.php?goodsNo=8729&inflow=naver&gclid=EAIaIQobChMIs7bjp5aE9gIVTrGWCh1MKgJgEAQYASABEgKpS_D_BwE");'>
					<img src="/resources/imgs/9.PNG"
						onclick='window.open("https://m.biteme.co.kr/goods/goods_view.php?goodsNo=1000011356");'>
					<img src="/resources/imgs/10.PNG"
						onclick='window.open("https://shopping.interpark.com/product/productInfo.do?prdNo=6811234125&goods_no=6811234125&gclid=EAIaIQobChMIxLrW7JaE9gIVEXkqCh3cuAGGEAQYAiABEgLhpvD_BwE");'>
					<img src="/resources/imgs/11.PNG" onclick='window.open("");'>
					<img src="/resources/imgs/12.PNG" onclick='window.open("");'>
				</div>
			</div>
		</div>
		<div id="footers"></div>
	</div>
</body>
</html>
<script src="https://code.jquery.com/jquery-1.8.0.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	var context = document.getElementById('myChart1').getContext('2d');
	var myChart = new Chart(
			context,
			{
				type : 'bar', // 차트의 형태
				data : { // 차트에 들어갈 데이터
					labels : [ '식대', '병원', '미용', '복지', '기타' ],
					datasets : [ { //데이터
						label : '카테고리별 소비 동향', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : [
								parseInt(document.getElementById('a_Feed').innerHTML)
										+ parseInt(document
												.getElementById('a_Snack').innerHTML),
								parseInt(document.getElementById('b_Diagnosis').innerHTML)
										+ parseInt(document
												.getElementById('b_Vaccin').innerHTML),
								parseInt(document.getElementById('c_Grooming').innerHTML)
										+ parseInt(document
												.getElementById('c_Clothes').innerHTML),
								parseInt(document.getElementById('e_Trainning').innerHTML)
										+ parseInt(document
												.getElementById('e_Hotel').innerHTML)
										+ parseInt(document
												.getElementById('e_Kindergarten').innerHTML),
								parseInt(document.getElementById('d_Nutrients').innerHTML)
										+ parseInt(document
												.getElementById('d_Poo').innerHTML) ],
						backgroundColor : [
						//색상
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					//경계선 굵기
					} /* ,
					                                                                                                                                                                                                  } */
					]
				},
				options : {
					title : {
						display : true,
						text : '',
						fontSize : 30,
						fontColor : 'rgba(46, 49, 49, 1)'
					},
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
	// ===================차트 2 =======================
	var context = document.getElementById('myChart2').getContext('2d');
	var myChart = new Chart(
			context,
			{
				type : 'polarArea', // 차트의 형태
				data : { // 차트에 들어갈 데이터
					labels : [
					//x 축
					'식대', '병원', '미용', '복지', '기타' ],
					datasets : [ { //데이터
						label : '카테고리별 소비 동향', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : [
								parseInt(document.getElementById('a_Feed').innerHTML)
										+ parseInt(document
												.getElementById('a_Snack').innerHTML),
								parseInt(document.getElementById('b_Diagnosis').innerHTML)
										+ parseInt(document
												.getElementById('b_Vaccin').innerHTML),
								parseInt(document.getElementById('c_Grooming').innerHTML)
										+ parseInt(document
												.getElementById('c_Clothes').innerHTML),
								parseInt(document.getElementById('d_Nutrients').innerHTML)
										+ parseInt(document
												.getElementById('d_Poo').innerHTML),
								parseInt(document.getElementById('e_Trainning').innerHTML)
										+ parseInt(document
												.getElementById('e_Hotel').innerHTML)
										+ parseInt(document
												.getElementById('e_Kindergarten').innerHTML) ],
						backgroundColor : [
						//색상
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					//경계선 굵기
					} /* ,
					                                        {
					                                         label: 'test2', 
					                                         fill: false,
					                                         data: [8, 34, 12, 24],
					                                         backgroundColor: 'rgb(157, 109, 12)', 
					                                         borderColor: 'rgb(157, 109, 12)'
					                                      } */
					]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
	const a = parseInt(document.getElementById('a_Feed').innerHTML)
			+ parseInt(document.getElementById('a_Snack').innerHTML);
	const b = parseInt(document.getElementById('b_Diagnosis').innerHTML)
			+ parseInt(document.getElementById('b_Vaccin').innerHTML);
	const c = parseInt(document.getElementById('c_Grooming').innerHTML)
			+ parseInt(document.getElementById('c_Clothes').innerHTML);
	const d = parseInt(document.getElementById('d_Nutrients').innerHTML)
			+ parseInt(document.getElementById('d_Poo').innerHTML);
	const e = parseInt(document.getElementById('e_Trainning').innerHTML)
			+ parseInt(document.getElementById('e_Hotel').innerHTML)
			+ parseInt(document.getElementById('e_Kindergarten').innerHTML);
	const arr = [ a, b, c, d, e ];
	arr.sort(function(a, b) {
		return b - a;
	});

	var first = arr[0];
	var second = arr[1];
	var third = arr[2];

	var category1;
	var category2;
	var category3;

	if (first == a) {
		category1 = '식';
	} else if (first == b) {
		category1 = '병원';
	} else if (first == c) {
		category1 = '미용';
	} else if (first == d) {
		category1 = '기타';
	} else {
		category1 = '복지';
	}


	if (second == a) {
		category2 = '식';
	} else if (second == b) {
		category2 = '병원';
	} else if (second == c) {
		category2 = '미용';
	} else if (second == d) {
		category2 = '기타';
	} else {
		category2 = '복지';
	}

	if (third == a) {
		category3 = '식';
	} else if (third == b) {
		category3 = '병원';
	} else if (third == c) {
		category3 = '미용';
	} else if (third == d) {
		category3 = '기타';
	} else {
		category3 = '복지';
	}

	console.log(first);
	console.log(second);
	console.log(third);
	console.log(category1);
	console.log(category2);
	console.log(category3);
	document.getElementById('first').innerHTML = '<br><br><b>다른 집사님들은 <br>'
			+ category1 + '비에 많이 <br>지출하고 있어요!</b><br>';
	document.getElementById('second').innerHTML = '두번째는 ' + category2
			+ ',<br><br>';
	document.getElementById('third').innerHTML = '세번째는 ' + category3 + '비군요.';
</script>
<script>
	history.scrollRestoration = "manual"
</script>
<a style="display: scroll; position: fixed; bottom: 0px; right: 10px;"
	href="#" title=”맨위로"><img src="/resources/imgs/top.PNG"
	style="border-radius: 70%;"></a>