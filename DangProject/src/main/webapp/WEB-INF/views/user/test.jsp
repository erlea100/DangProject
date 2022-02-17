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
.costInform {
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
		<div style="float: right; border: 1px solid red;">
			<!-- 		 <form> -->
			<%-- 				<input type="hidden" name=id value="<%=id%>" /> <input --%>
			<!-- 					style="border: 1px solid red; background-color: white" -->
			<!-- 					type="submit" value="내정보" onclick="Submit()"> -->
			<!-- 			</form>  -->
			<!-- 			<div id="ex1" class="modal"> -->
			<!-- 				<p>안녕하세요. 모달창안의 내용부분입니다.</p> -->
			<!-- 				<a href="#" rel="modal:close">닫기</a> -->
			<!-- 			</div> -->
			<!-- 			<p> -->
			<!-- 				<a href="#ex1" rel="modal:open"></a> -->
			<!-- 			</p> -->
			<a href="dashboard.do"
				onclick="window.open(this.href, '_blank', 'width=가로사이즈px,height=세로사이즈px,toolbars=no,scrollbars=no'); return false;">완전
				간단하게 팝업 띄우기!!</a>

		</div>
		<div class="dashboard"
			style="border-radius: 36px; margin: auto; height: 1000px; border: 1px solid red; padding: 30px; padding: 5%;">

			<div style="border: solid 1px blue; height: 500px">
				<div class="dashboard"
					style="border: 1px solid red; width: 700px; height: 400px; float: left; padding: 30px;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart1"></canvas>
				</div>
				<div
					style="width: 200px; margin-top: 5%; height: 300px; float: right; border: 1px solid #ff8fab; padding: 30px;">
					<p>요기 문구 추가</p>
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
			<div style="border: solid 1px blue; height: 500px; display: flex">
				<div class="dashboard"
					style="border: 1px solid red; width: 500px; height: 500px; margin-left: 15%;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart2"></canvas>
				</div>
				<div
					style="margin-left: 10%; margin-top: 5%; width: 200px; height: 300px; border: 1px solid #ff8fab; padding: 30px">
					<p>요기 문구 추가</p>
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
		<br> <br> <br> <br> <br> <br>
		<div class="intro">"Pets, Just Enjoy The Life!" DangDangDiary
			aims to create a happy lifestyle. We respect and value healthy
			companionship between pets and people and we continuously strive to
			sustain this value through sincere communication. DangDangDiary는 즐거운
			라이프스타일을 지향합니다. 또한 이 가치가 지속 가능하도록 건강한 반려생활을 중시하고 배려하며, 반려 동물 및 반려인들과
			진정성 있는 소통을 합니다</div>
		<br> <br> <br>
		<div class="section1">
			사이트 소개 DANGDANGDIARY<br /> ―
			<p>
				<b>055-293-8813 / 카카오톡-댕댕 다이어리</b>
			</p>
			<p>mon - fri am 11:00 - pm 4:00</p>
			<p>lunch time pm 1:00 - pm 2:00</p>
			<p>
				<strong>sat, sun, holiday off</strong> DANGDANGDIARY<br /> ―
			<p>
				<b>055-293-8813 / 카카오톡-댕댕 다이어리</b>
			</p>
			<p>mon - fri am 11:00 - pm 4:00</p>
			<p>lunch time pm 1:00 - pm 2:00</p>
			<p>
				<strong>sat, sun, holiday off</strong>
		</div>
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
				type : 'pie', // 차트의 형태
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
</script>

