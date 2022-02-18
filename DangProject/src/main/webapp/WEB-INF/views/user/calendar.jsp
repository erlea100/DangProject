<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.dang.java.controller.DiaryController"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
   import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
// 세션 연결
if (session.getAttribute("id") == null) {
   response.sendRedirect("/user/loginForm.do");
}
Object id = session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>


<!-- 공통 헤더 , 푸터 , 내부 스타일 시트 적용 시작 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#headers").load("/resources/header(member).html"); //헤더 인클루드
      $("#footers").load("/resources/footer.html"); //푸터부분 인클루드
   });
</script>

<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/Dang_main.css?after"
   type="text/css" />
      
  <style type="text/css">
td {
	width: 150px;
	height: 100px;
	text-align: center;
}

.week{
	height:30px;
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
	background-color: #fef9df;
}

.modal-tabs>li {
	list-style: none;
	float: left;
	display: block;
	width: 105px;
	height: 30px;
	text-align: center;
	}
a {
	color: #d4a373;
}
.modal-tabs > li {
 list-style: none;
 float: left;
 display: block;
 width: 105px;
 height: 30px;
 text-align: center;
}
.modal-tabs > li > a {
 font-size: 20px;
 text-decoration-line: none; 
}
a:link, a:visited, a:hover , a:active {
  color: black;
}

.modal-tabs>li>a {
	font-size: 20px;
	text-decoration-line: none;
}

a:link, a:visited, a:hover, a:active {
	color: black;
}

#modal-contents1-1>* {
	font-size: 18px;
}

#val {
	width: 200px;
	height: 40px;
	font-size: 15px;
	margin-left: 15px;
	text-align: center;
}

#submit-box {
	width: 50px;
	height: 40px;
	font-size: 15px;
	margin: 15px 10px 10px 15px;
}

.select {
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.selected-d {
	width: 260px;
	height: 40px;
	align-self: center;
	margin: 15px 10px 10px 15px;
	font-size: 16px;
	text-align: center;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#dangdang {
	width: 280px;
	height: 100px;
	bottom: 0;
}

#jsCloseBtn {
	background-color: inherit;
	border: none;
	font-size: 18px;
}

.dateBtn {
	background-color: inherit;
	border: none;
	width: 150px;
	height: 100px;
	text-align: center;
	font-size: 26px;
}
.fa-solid {
	margin-top: 8px;
	margin-left: 85px;
}
</style>
</head>
<body>

 <!-- 헤더 -->
<div id="headers" style="margin-bottom: 60px"></div>

   <%
   java.util.Calendar cal = java.util.Calendar.getInstance(); //Calendar객체 cal생성
   int currentYear = cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
   int currentMonth = cal.get(java.util.Calendar.MONTH);
   int currentDate = cal.get(java.util.Calendar.DATE);
   String Year = request.getParameter("year"); //나타내고자 하는 날짜
   String Month = request.getParameter("month");
   int year, month;
   if (Year == null && Month == null) { //처음 호출했을 때
      year = currentYear;
      month = currentMonth;
   } else { //나타내고자 하는 날짜를 숫자로 변환
      year = Integer.parseInt(Year);
      month = Integer.parseInt(Month);
      if (month < 0) {
         month = 11;
         year = year - 1;
      } //1월부터 12월까지 범위 지정.
      if (month > 11) {
         month = 0;
         year = year + 1;
      }
   }
   %>
   
   
   <center>
      <div>
         <table border=0>

            <!-- 달력 부분 -->
            <tr>
               <td colspan="2" width=100>
                  <!-- 년 도--> <a
                  href="/user/calendar.do?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
                  <span class="year"> <%out.print(year);%>
               </span>년 <a
                  href="/user/calendar.do?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
               </td>
               <td colspan="3" width=100>
                  <!-- 월 --> <a
                  href="/user/calendar.do?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
                  <span class="month"> <%out.print(month + 1);%>
               </span>월 <a
                  href="/user/calendar.do?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
               </td>
               <td colspan="2" width=100>
                  TODAY : <%out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);%>
               </td>
            </tr>
                  </table>
      <table border=1 cellspacing=0>
            <tr>

               <td width=100 class="week">일</td>
               <!-- 일=1 -->
               <td width=100 class="week">월</td>
               <!-- 월=2 -->
               <td width=100 class="week">화</td>
               <!-- 화=3 -->
               <td width=100 class="week">수</td>
               <!-- 수=4 -->
               <td width=100 class="week">목</td>
               <!-- 목=5 -->
               <td width=100 class="week">금</td>
               <!-- 금=6 -->
               <td width=100 class="week">토</td>
               <!-- 토=7 -->
            </tr>
            <tr height=30>
               <%
               cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
               int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
               int end = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
               int br = 0; //7일마다 줄 바꾸기
               for (int i = 0; i < (startDay - 1); i++) { //빈칸출력
                  out.println("<td>&nbsp;</td>");
                  br++;
                  if ((br % 7) == 0) {
                     out.println("<br>");
                  }
               }
               
               int day = 0;
               for (int i = 1; i <= end; i++) { //날짜출력
                  day = i;
                  out.println("<td>" + "<button id='date' class='dateBtn' onclick='dateClick()' value =" + i + ">" + i + "</button>");
                  //메모(일정) 추가 부
               %>
               
               <!-- cost 테이블에 값 가져오기  -->
               <input type="hidden" name="id" value="<%=id%>">
               <input type="hidden" name="date" value="<%=year%><%=month+1%><%=i%>">
              
               
               <%
               out.println("</td>");
               br++;
               if ((br % 7) == 0 && i != end) {
                  out.println("</tr><tr height=30>");
               }
               }
               while ((br++) % 7 != 0) //말일 이후 빈칸출력
               out.println("<td>&nbsp;</td>");
               %>
                
            </tr>
         </table>
      </div>
   </center>


   <div class="modal-overlay hidden" id="modal" />
   <div class="modal hidden" id="modal">
   <div style="display: flex; justify-content: flex-end; "><button class="modal-close" id="jsCloseBtn"> X </button></div>
      <div class="modal-title" style="text-align: center;">날짜</div>
      <ul class="modal-tabs">

         <li>
               <a href="#modal-contents1-1" class="on">조회</a> 
         </li>

         <li><a href="#modal-contents1-2">추가/수정</a></li>
         <br>
      </ul>
      <div class="modal-contents" id="modal-contents1-1">
        <!-- 조회 데이터 append  -->
      </div>

      <div class="modal-contents" id="modal-contents1-2">
         <form name="diary-history" method="post" action="/diary/saveDiary.do">
            <select id="val" class="select" name="val" onchange="Change()">
               <option disabled="disabled" selected="selected" >선택</option>
               <option value="1">사료</option>
               <option value="2">간식</option>
               <option value="3">진료</option>
               <option value="4">예방주사</option>
               <option value="5">미용</option>
               <option value="6">옷</option>
               <option value="7">영양제</option>
               <option value="8">배변</option>
               <option value="9">훈련</option>
               <option value="10">호텔</option>
               <option value="11">유치원</option>
            </select>

         <input type="submit" id="submit-box" onclick="Submit()" value="저장">

            <div id="d1" style="display: none">
               <input type="number" class="selected-d" name="a_Feed" value="0" min="0" max="99999999"
                  placeholder="사료" />
            </div>
            <div id="d2" style="display: none">
               <input type="number" class="selected-d" name="a_Snack" value="0" min="0" max="99999999"
                  placeholder="간식" />
            </div>
            <div id="d3" style="display: none">
               <input type="number" class="selected-d" name="b_Diagnosis" value="0" min="0" max="99999999"
                  placeholder="진료" />
            </div>
            <div id="d4" style="display: none">
               <input type="number" class="selected-d" name="b_Vaccin" value="0" min="0" max="99999999"
                  placeholder="예방주사" />
            </div>
            <div id="d5" style="display: none">
               <input type="number" class="selected-d" name="c_Grooming" value="0" min="0" max="99999999"
                  placeholder="미용" />
            </div>
            <div id="d6" style="display: none">
               <input type="number" class="selected-d" name="c_Clothes" value="0" min="0" max="99999999"
                  placeholder="옷" />
            </div>
            <div id="d7" style="display: none">
               <input type="number" class="selected-d" name="d_Nutrients" value="0" min="0" max="99999999"
                  placeholder="영양제" />
            </div>
            <div id="d8" style="display: none">
               <input type="number" class="selected-d" name="d_Poo" value="0" min="0" max="99999999"
                  placeholder="배변" />
            </div>
            <div id="d9" style="display: none">
               <input type="number" class="selected-d" name="e_Trainning" value="0" min="0" max="99999999"
                  placeholder="훈련" />
            </div>
            <div id="d10" style="display: none">
               <input type="number" class="selected-d" name="e_Hotel" value="0" min="0" max="99999999"
                  placeholder="호텔" />
            </div>
            <div id="d11" style="display: none">
               <input type="number" class="selected-d" name="e_Kindergarten" value="0" min="0" max="99999999"
                  placeholder="유치원" />
            </div>

               <!-- cost 테이블에 값 넘겨주기  -->
                <input name="id" value="<%=id%>" type="hidden" >
                <input class="date-title" name="date" type="hidden" />
                
                <img id="dangdang" src="/resources/imgs/001.gif">
                
                 <input class="yearValue" name="diary_year" type="hidden"/>
                <input class="monthValue" name="diary_month" type="hidden"/>
                <input class="dayValue" name="diary_day" type="hidden"/> 
         </form>
      </div>
   </div>
   

   
    <!-- 조회용 달력 이동 -->
   <center>
  <a href="/user/calendarMemo.do">달력 한눈에 보기</a>
   </center>
   
      <script type="module" src="/resources/index.js"></script>
   <script src="https://kit.fontawesome.com/bd65a83372.js" crossorigin="anonymous"></script>
   <script type="text/javascript">
   
      $(function(){
//          alert("호출")
         $('.dateBtn').on("click",function(){
          /*   alert('1'); */
//            alert("호출")
            var id =  $(this).next().val() ;
            var dd =  $(this).next().next().val() ;
            
            var cal_data = { "id" : id , "date" : dd}; // json : object형
            
            // sumbit
            $.ajax({
               url : "/diary/selectDiary.do",
               post : "post",
               data : cal_data, // 컨트롤러로 이동한 대아터 ( input 태그의 기술 )
               dataType : "json",
               success : function(data){
                  
                  console.log("data  " +data);
                  
                 if(data.length == 0){  //데이터가 없으면
//                  modal-contents1-1
               console.log('데이터없음')
               document.getElementById('modal-contents1-1').innerHTML = "";
               console.log('수정완료')
            }else{
               for ( var d in data){
                  $('#modal-contents1-1').children().remove();
//                     console.log(data[d].a_Feed);

                  /* alert("조회시작") */
                  
                 
                  $('#modal-contents1-1').append("<i class='fa-solid fa-bone'></i>"+"<a id=a_Feed>&nbsp;사료&nbsp;"+data[d].a_Feed+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-bone'></i>"+"<a id=a_Snack>&nbsp;간식&nbsp;"+data[d].a_Snack+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-syringe'></i>"+"<a id=b_Diagnosis>&nbsp;진료&nbsp;"+data[d].b_Diagnosis+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-syringe'></i>"+"<a id=b_Vaccin>&nbsp;예방주사&nbsp;"+data[d].b_Vaccin+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-dog'></i>"+"<a id=c_Grooming>&nbsp;미용&nbsp;"+data[d].c_Grooming+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-dog'></i>"+"<a id=c_Clothes>&nbsp;옷&nbsp;"+data[d].c_Clothes+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-poop'></i>"+"<a id=d_Nutrients>&nbsp;영양제&nbsp;"+data[d].d_Nutrients+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-poop'></i>"+" <a id=d_Poo>&nbsp;배변&nbsp;"+data[d].d_Poo+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-heart'></i>"+"<a id=e_Trainning>&nbsp;훈련&nbsp;"+data[d].e_Trainning+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-heart'></i>"+"<a id=e_Hotel>&nbsp;호텔&nbsp;"+data[d].e_Hotel+"원"+"</a>"+"<br />");
                  $('#modal-contents1-1').append("<i class='fa-solid fa-heart'></i>"+"<a id=e_Kindergarten>&nbsp;유치원&nbsp;"+data[d].e_Kindergarten+"원"+"</a>"+"<br />");
               
               }
            }
               },
               error : function(e){
                  alert('에러 : ' + e);
               }
               
            });
            
         })
      })
   
//       function dateClick(){
//          alert("달력 클릭");
         /* document.date.submit(); */
//          $("#date").submit();
//           console.log('date');
//           alert("제출완료");

//          var cal_data = { "키": "값" , "키": "값"};
//          console.log( $(this) ) ;
//       }
      
   
      /* 1차 선택 - 셀렉트 */
      function Change() {
//          alert("체인지 이벤트")
         var key = val.value;

         if (key == 1) {
            document.all["d1"].style.display = "block";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";

         }

         if (key == 2) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "block";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 3) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "block";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 4) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "block";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 5) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "block";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 6) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "block";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 7) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "block";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 8) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "block";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 9) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "block";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "none";
         }

         if (key == 10) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "block";
            document.all["d11"].style.display = "none";
         }

         if (key == 11) {
            document.all["d1"].style.display = "none";
            document.all["d2"].style.display = "none";
            document.all["d3"].style.display = "none";
            document.all["d4"].style.display = "none";
            document.all["d5"].style.display = "none";
            document.all["d6"].style.display = "none";
            document.all["d7"].style.display = "none";
            document.all["d8"].style.display = "none";
            document.all["d9"].style.display = "none";
            document.all["d10"].style.display = "none";
            document.all["d11"].style.display = "block";
         }

      }
   </script>

  
</body>
    <script>history.scrollRestoration = "manual"</script>
    <a style="display:scroll;position:fixed;bottom:0px;right:10px; " href="#" title=”맨위로"><img src="/resources/imgs/top.PNG" style="border-radius: 70%;"></a>
    
</html>