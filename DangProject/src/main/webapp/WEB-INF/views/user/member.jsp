<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#idmessage{
   display:inline-block;
}
</style>
<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
   $(function() {

         $('.userinput').keyup(function(){
         var id = $('input[name=id]').val();
         // 제이쿼리에서 제공하는 메소드. 화면과 무관하게 폼태그에서 강제로 서브밋되는 과정
         $.ajax( {
            url:'checkId.do', // STS라면 *.do
            type:'get',
            data:{userid:id}, // 미리 변수화 시켜도 상관없음 input 태그로 만든 변수다. {키:값} 같이..
            dataType:'text', // 응답 데이터. VO의 형태면 무조건 json으로 받는다. 내가즈는건 데이터. 받는 건 데이터 타입(서버 응답데이터)
            success: function (data) { // 저곳의 예스 오어 노가 바로 이거
               
               // 서버에 접속하여 처리가 다 완료되었을 때 실행.  /cont - db - cont - view 까지 정상적으로 왔을 때
               if(data.trim()=='YES'){
                  $('#idmessage').text("이미 사용중");
                  $('#idmessage').show();
               }else{
                  $('#idmessage').text("가능");
                  $('#idmessage').show();
                  $('#submit').attr('disabled', false);
               }
            },
            error:function(err){
               alert('에러발생'+err);
            }
         }); 
      });

   });
</script>

</head>
<body>






<form method="post" action="userInsert.do" name="userinput" id="userinput">
				<div style="display: inline-block ;">
          		<input type="text" name="id" id="id" placeholder="아이디 입력" class="userinput" size="20" required />
  		 		<div id="idmessage" style="display: none;"></div>
  		 		</div>
       				 <br>	
                <input id="password" name="password" placeholder="비밀번호 입력" type="text"  required>
             		 <br>
                <input id="name" name="name" placeholder="이름 입력"  type="text" required>
             			 <br>
                <input id="ph" name="ph" placeholder="핸드폰 번호입력"  type="text" required>
              		 <br>
                <input id="e_mail" name="e_mail" placeholder="Email 입력"  type="text" required>
             		 <br>
     			 <input type="submit" id="submit" value="가입하기" disabled="disabled" />
				   
</form>





</body>
</html>
