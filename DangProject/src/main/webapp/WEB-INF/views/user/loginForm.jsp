
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
   top: 50%;
   transform: translate(-50%, -50%);
   text-align: center;
   background-color: white;
}

table {
   background-color: white;
}

input {
   width: 93%;
   background-color: #fcfcfc;
   border: 0;
   border-bottom: 2px solid lightgrey;
   padding: 10px;
   border: 0;
}

button {
   border-style: none;
   cursor: pointer;
   background-color: white;
}

#Submit {
   width: 100%;
   background-color: #fefae0;
   border: 0;
   padding: 10px;
}

a {
   position: absolute;
   left: 50%;
   top: 20%;
   transform: translate(-50%, -50%);
   text-align: center;
   background-color: white;
}

.center {
   display: flex;
   justify-content: center;
   flex-direction: column;
   width: 400px;
   height: 500px;
   align-item: center;
   background-color: white;
   align-item: center;
   margin: auto;
   
}

.test{
   height:700px;
      display: flex;
   justify-content: center;
}

</style>

</head>

<body>

   <div class="test">


      <div class="center">


         <a href="Dang_main.html"><img src="/resources/imgs/dang1.png"></a>

         <div class="table">
            <form action="login.do" method="post" name="frm">
               <table width="300" height="120">

                  <tr>
                     <td><input id="id" name="id" placeholder="ID입력" type="text"></td>
                  </tr>

                  <tr>
                     <td><input id="password" name="password"
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
                  <td><button onclick="location.href='/user/member.do'">아이디가
                        없으신가요? 댕댕 다이어리의 가족이 되어주세요.</button></td>
               </tr>
            </table>

         </div>

      </div>
   </div>
</body>
</html>