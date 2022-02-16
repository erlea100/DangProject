
<!-- <form  action="login.do" method="post" name="frm">
           
                <input id="id" name="id" placeholder="ID입력" type="text" required >
                 
                 <input id="password" name="password" placeholder="비밀번호 입력" type="text"  required>
              
                <button type="submit">가입완료</button> 
               
            </form> -->

            
            <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/Dang_main.css?after"
   type="text/css" />
<style>
html, body, * {
   background-color: #f79d65;
}

.table {
   position: absolute;
   left: 50%;
   top: 35%;
   transform: translate(-50%, -50%);
   text-align: center;
}

#footers {
   position: fixed;
   bottom: 0;
}
</style>

<script src="//code.jquery.com/jquery-1.11.0.min.js">
   
</script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#headers").load("/resources/header.html"); //헤더 인클루드
      $("#footers").load("/resources/footer.html"); //푸터부분 인클루드
   });
</script>

</head>

<body>
   <div id="headers"></div>
   <div class="container">
      <div class="blank"></div>
      <div class="table">
        <form  action="login.do" method="post" name="frm">
            <table width="300" height="120">
               <tr>
                  <td width="100">아이디</td>
               </tr>
               <tr>
                  <td> <input id="id" name="id" placeholder="ID입력" type="text" required ></td>
               </tr>
               <tr>
                  <td>패스워드</td>
               </tr>
               <tr>
                  <td><input id="password" name="password" placeholder="비밀번호 입력" type="text"  required></td>
               </tr>
               <tr>
                  <td colspan=2><button type="submit" name="Submit" id="Submit"
                     value="로그인">로그인</button></td>
            
               </tr>
               <tr>
          </form>  
                  <td><button
                     onclick="location.href='/user/member.do'">회원가입</button></td>
               </tr>
               <tr>
                  <td><input type="reset" value="취소"></td>
               </tr>
            </table>
         
      </div>
      <div id="footers"></div>
   </div>

</body>
</html>