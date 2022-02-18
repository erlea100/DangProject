<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
/* body{
   background-color: #fec89a;
} */
@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GangwonEdu_OTFBoldA';
}

body {
	background-color: #fefae0;
}

.table {
	position: absolute;
	left: 50%;
	top: 53%;
	transform: translate(-50%, -50%);
}

table {
	background-color: white;
}

input {
	width: 93%;
	background-color: #fcfcfc;
	border-bottom: 2px solid lightgrey;
	padding: 10px;
	border: 0;
	border-radius: 36px;
}

button {
	border-style: none;
	cursor: pointer;
	background-color: white;
	border-radius: 36px;
}

#Submit {
	width: 100%;
	background-color: #fefae0;
	border: 0;
	padding: 10px;
}

#Submit:hover {
	width: 100%;
	background-color: #fff6cc;
	border: 0;
	padding: 10px;
}

a {
	position: absolute;
	left: 50%;
	top: 28%;
	transform: translate(-50%, -50%);
	text-align: center;
	background-color: white;
}

.center {
	display: flex;
	justify-content: center;
	flex-direction: column;
	width: 450px;
	height: 550px;
	align-item: center;
	margin: auto;
	background-color: white;
	border-radius: 36px;
}

.test {
	height: 700px;
	display: flex;
	justify-content: center;
}

button:not(#Submit):after {
	display: block;
	content: '';
	border-bottom: solid 3px #fff6cc;
	transform: scaleX(0);
	transition: transform 190ms ease-in-out;
}

button:not(#Submit):hover:after {
	transform: scaleX(1);
}

button:not(#Submit).underline:after {
	transform-origin: 0% 50%;
}

img:hover {
	opacity: 0.9;
}
</style>

</head>

<body>
	<div class="test">
		<div class="center">
			<a href="/Dang_main.jsp"><img src="/resources/imgs/dang1.png"></a>
			<div class="table">
				<form action="login.do" method="post" name="frm">
					<table width="300" height="120">
						<tr>
							<td><input id="id" name="id" placeholder="아이디 입력"
								type="text" required ></td>
						</tr>
						<tr>
							<td><input id="password" name="password" type="password"
								placeholder="비밀번호 입력" type="text" required></td>
						</tr>
						<tr>
							<td><button type="submit" name="Submit" id="Submit"
									value="로그인">로그인</button></td>
						</tr>
						<tr>
					</table>
				</form>
				<table>
					<tr>
						<td><button class="w3-right w3-button w3-hover-white" id="find_id_btn">아이디 찾기</button>
						<button 
								 class="w3-right w3-button w3-hover-white" id="find_password_btn">/&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기</button></td>
					</tr>
					<tr>
						<td><button onclick="location.href='/user/member.do'"
								class="underline">아이디가 없으신가요? 댕댕 다이어리의 가족이 되어주세요!</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function () {
	$("#find_id_btn").click(function(){
		location.href='../member/find_id_form.do';
	})
	$("#find_password_btn").click(function(){
		location.href='../member/find_password_form.do';
	})
})
</script>
</html>
