<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.small {
	width: 120px;
}

.userinput, #password_chk { /* id 입력칸 길이 */
	width: 120px;
}

#userinput {
	width: 400px;
}

#idmessage {
	display: inline-block;
}

.center {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 700px;
	justify-content: center;
}

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
	left: 53.5%;
	top: 56%;
	transform: translate(-50%, -50%);
}

table {
	background-color: white;
	width: 350px;
	display: flex;
	align-items: center;
}

input {
	width: 280px;
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
	text-align: center;
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
	top: 24%;
	transform: translate(-50%, -50%);
	text-align: center;
	background-color: white;
}

.center {
	display: flex;
	justify-content: center;
	flex-direction: column;
	width: 450px;
	height: 650px;
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

button:hover:after {
	transform: scaleX(1);
}

.button {
	display: flex;
	justify-content: center;
	width: 300px;
}

img:hover {
	opacity: 0.9;
}

/* ------------------------------- */
button {
	border-style: none;
	cursor: pointer;
	background-color: white;
	border-radius: 36px;
}

#submit {
	width: 100%;
	background-color: #fefae0;
	border: 0;
	padding: 10px;
}

#submit:hover {
	width: 100%;
	background-color: #fff6cc;
	border: 0;
	padding: 10px;
}

/* ------------------------------- */
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

		$('.userinput').keyup(function() {
			var id = $('input[name=id]').val();
			// 제이쿼리에서 제공하는 메소드. 화면과 무관하게 폼태그에서 강제로 서브밋되는 과정
			$.ajax({
				url : 'checkId.do', // STS라면 *.do
				type : 'get',
				data : {
					userid : id
				}, // 미리 변수화 시켜도 상관없음 input 태그로 만든 변수다. {키:값} 같이..
				dataType : 'text', // 응답 데이터. VO의 형태면 무조건 json으로 받는다. 내가즈는건 데이터. 받는 건 데이터 타입(서버 응답데이터)
				success : function(data) { // 저곳의 예스 오어 노가 바로 이거

					// 서버에 접속하여 처리가 다 완료되었을 때 실행.  /cont - db - cont - view 까지 정상적으로 왔을 때
					if (data.trim() == 'YES') {
						$('#idmessage').text("이미 사용중입니다.");
						$('#idmessage').show();
					} else {
						$('#idmessage').text("사용 가능합니다.");
						$('#idmessage').show();
						$('#submit').attr('disabled', false);
					}
				},
				error : function(err) {
					alert('에러발생' + err);
				}
			});
		});

	});
</script>
<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$(".pw").keyup(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#password_chk").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {

					$("#alert-success").text("비밀번호가 일치합니다.");
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").text("비밀번호가 일치하지 않습니다.");
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>
​
</head>
<body>


	<div class="test">

		<div class="center">

			<a href="/Dang_main.jsp"><img src="/resources/imgs/dang1.png"></a>

			<div class="table">
				<form method="post" action="userInsert.do" name="userinput"
					id="userinput">

					<table>
						<tr>
							<td class="small"><input type="text" name="id" id="id"
								placeholder="아이디 입력" class="userinput" size="20" required /></td>
							<td>
								<div id="idmessage" style="display: none;"></div>
							</td>

						</tr>


						<tr>
							<td colspan="2"><input class="pw" id="password"
								name="password" type="password" placeholder="비밀번호 입력"
								type="text" required></td>
						</tr>

						<tr>
							<td class="small"><input class="pw" id="password_chk"
								name="password_chk" type="password" placeholder="비밀번호 확인"
								type="text" required></td>
							<td colspan="2">
								<div class="alert alert-success" id="alert-success"></div>
								<div class="alert alert-danger" id="alert-danger"></div>
							</td>

						</tr>

						<tr>
							<td colspan="2"><input id="name" name="name"
								placeholder="이름 입력" type="text" required></td>
						</tr>

						<tr>
							<td colspan="2"><input id="ph" name="ph"
								placeholder="핸드폰 번호 입력" type="text" required></td>
						</tr>



						<tr>
							<td colspan="2"><input id="e_mail" name="e_mail"
								placeholder="Email 입력" type="text" required>
							<td>
						</tr>

					</table>

					<div class=button>
						<button type="submit" id="submit" disabled="disabled">가입하기</button>
					</div>



				</form>


			</div>
		</div>
	</div>


</body>
</html>
