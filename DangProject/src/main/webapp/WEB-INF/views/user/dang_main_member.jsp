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
</style>


<body>
	<div id="headers"></div>
	<br>
	<br>
	<br>
	<br>
	<!-- 	데이터 불러오는 부분(display-none) -->
	<div class="costInform">
		<c:forEach items="${boardList}" var="board">
			<a id="a_Feed">${board.a_Feed }</a>
			<a id="a_Snack">${board.a_Snack }</a>
			<a id="b_Diagnosis">${board.b_Diagnosis }</a>
			<a id="b_Vaccin">${board.b_Vaccin }</a>
			<a id="c_Grooming">${board.c_Grooming }</a>
			<a id="c_Clothes">${board.c_Clothes }</a>
			<a id="d_Nutrients">${board.d_Nutrients }</a>
			<a id="d_Poo">${board.d_Poo }</a>
			<a id="e_Trainning">${board.e_Trainning }</a>
			<a id="e_Hotel">${board.e_Hotel }</a>
			<a id="e_Kindergarten">${board.e_Kindergarten }</a>
		</c:forEach>
	</div>
	<div class="container">
		<br>
		<div
			style="margin: auto; height: 1000px; border: 1px solid red; padding: 30px; padding: 5%; box-shadow: 10px 10px 15px #000808;">
			<div style="border: solid 1px blue; height: 500px">
				<div
					style="background-color: #fef9df; border: 1px solid red; width: 700px; height: 400px; float: left; padding: 30px;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart1" style="background-color: #fef9df;"></canvas>
				</div>
				<div
					style="width: 200px; margin-top:5%; height: 300px; float: right; border: 1px solid #ff8fab; padding: 30px; box-shadow: 10px 10px 15px #000808;">
					<div
						style="width: 200px; height: 200px; border: 1px solid black; margin-bottom: 40px;">
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
			<div style="border: solid 1px blue; height: 500px; display: flex">
				<div
					style="background-color: #fef9df; border: 1px solid red; width: 400px; height: 400px; margin-left: 15%;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart2" style="background-color: #fef9df;"></canvas>
				</div>
				<div
					style="margin-left:15% ; margin-top:5%; width: 200px; height: 300px;border: 1px solid #ff8fab; box-shadow: 10px 10px 15px #000808;">
					<div
						style=" width: 200px; height: 200px; border: 1px solid black; margin-bottom: 40px;">
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
			<!-- 				<div -->
			<!-- 					style="width: 400px; height: 200px; border: 1px solid black; margin-bottom: 40px;">간식소비가 -->
			<!-- 					가장 많네요!멍멍!</div> -->
			<!-- 				<div style="width: 400px; height: 200px; border: 1px solid black;">저희 -->
			<!-- 					사이트 달력 가계부 기능을 사용해보세요</div> -->
			<!-- 			</div> -->
			<!-- <div
         style="width: 300px; height: 300px; float: left; margin-left: 50px;>
          <!-- 차트가 그려질 부분-->
			<!-- <canvas id="myChart2"></canvas>
				
      </div> -->
		</div>
		<br> <br> <br>

	</div>
	<br>
	<br>
	<br>
	<div class="intro">"Pets, Just Enjoy The Life!" DangDangDiary
		aims to create a happy lifestyle. We respect and value healthy
		companionship between pets and people and we continuously strive to
		sustain this value through sincere communication. DangDangDiary는 즐거운
		라이프스타일을 지향합니다. 또한 이 가치가 지속 가능하도록 건강한 반려생활을 중시하고 배려하며, 반려 동물 및 반려인들과
		진정성 있는 소통을 합니다</div>
	<br>
	<br>
	<br>
	<div class="section1">
		사이트 소개 DANGDANGDIARY<br /> ―
		</h3>
		<p>
			<b>055-293-8813 / 카카오톡-댕댕 다이어리</b>
		</p>
		<p>mon - fri am 11:00 - pm 4:00</p>
		<p>lunch time pm 1:00 - pm 2:00</p>
		<p>
			<strong>sat, sun, holiday off</strong> DANGDANGDIARY<br /> ―
		</h3>
		<p>
			<b>055-293-8813 / 카카오톡-댕댕 다이어리</b>
		</p>
		<p>mon - fri am 11:00 - pm 4:00</p>
		<p>lunch time pm 1:00 - pm 2:00</p>
		<p>
			<strong>sat, sun, holiday off</strong>
	</div>
	<div class="section2">
		사료 광고 슬라이드 <br> <br> <br> <br> <br> <br>
		<br>
	</div>
	<div id="footers"></div>
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
																																																													                                                                                                                                                                           {
																																																													                                                                                                                                                                             label: 'test2',
																																																													                                                                                                                                                                             fill: false,
																																																													                                                                                                                                                                                data: [
																																																													                                                                                                                                                                                    8, 34, 12, 24
																																																													                                                                                                                                                                                   ],
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
																																																													                                                                                                                                                                                data: [
																																																													                                                                                                                                                                                    8, 34, 12, 24
																																																													                                                                                                                                                                                   ],
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


