<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/Dang_main.css?after" type="text/css" />
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

h3{

	font-family: 'GangwonEdu_OTFBoldA';
}

.table {
	position: absolute;
	left: 50%;
	top: 53%;
	transform: translate(-50%, -50%);
}

.main{
	height:800px;
}

div:not(.main) {
	background-color: #fefae0;
}

.w3-container.w3-card-4, .w3-container.w3-card-4 div, h3{
	background-color: white;

}

.w3-container.w3-card-4 div{
	  margin-top:10px;
}

.w3-container.w3-card-4{
	width:400px;
	height:430px;
		border-radius: 36px;
		
  flex-direction: column;
           margin:auto;
           margin-top:95px;
            display: flex;
            justify-content: center;
           
}

.dog{
            display: flex;
            justify-content: center;
              margin-top:50px;
}


.w3-center w3-large w3-margin-top{

           margin-top:100px;
}

.w3-content w3-container w3-margin-top{
	margin:auto;
	height:800px;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

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

.w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round{
	background-color: #fff6cc;
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


img{
	width:400px;
		  margin-top:10px;
}

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/user/loginForm.do';
		})
	})
</script>
<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					${ id }
				</h5>
				<p class="w3-center">
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>