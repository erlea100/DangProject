<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="UTF-8"
   import="java.sql.*"%>


<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
// 세션 연결
if (session.getAttribute("id") == null) {
   response.sendRedirect("/user/loginForm.do");
}
Object id = session.getAttribute("id");
%>

<%
//데이터베이스를 연결하는 관련 변수를 선언한다
Connection conn = null;
PreparedStatement pstmt = null;
//데이터베이스를 연결하는 관련 정보를 문자열로 선언한다.
String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; //JDBC 드라이버의 클래스 경로
String jdbc_url = "jdbc:oracle:thin:@129.154.201.125:1521:xe"; //접속하려는 데이터베이스의 정보
//JDBC 드라이버 클래스를 로드한다.
Class.forName("oracle.jdbc.driver.OracleDriver");
//데이터베이스 연결 정보를 이용해서 Connection 인스턴스를 확보한다.
conn = DriverManager.getConnection("jdbc:oracle:thin:@129.154.201.125:1521:xe", "team", "1234");
if (conn == null) {
   out.println("No connection is made!");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendar</title>
</head>

<!-- 이모티콘 i 태그  -->
<script src="https://kit.fontawesome.com/bd65a83372.js" crossorigin="anonymous"></script>
<!-- 공통 헤더 , 푸터 , 내부 스타일 시트 적용 시작 -->
<script type="text/javascript">
   $(document).ready(function() {
      $("#headers").load("/resources/header(member).html"); //헤더 인클루드
      $("#footers").load("/resources/footer.html"); //푸터부분 인클루드
      $("#containers").load("/resources/container.html"); //푸터부분 인클루드
   });
</script>

<link rel="stylesheet" href="/resources/css/Dang_main.css?after"
   type="text/css" />
<style type="text/css">
td {
   width: 150px;
   height: 100px;
   text-align: center;
}

body {
   background-color: #fef9df;
}
</style>

<body>
<!-- 헤더만 연결 -->
<div id="headers"></div>
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
      <table border=0>
         <!-- 달력 상단 부분, 더 좋은 방법이 없을까? -->
         <tr>
            <td align=left width=200>
               <!-- 년 도--> <a
               href="calendar.jsp?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
               <%
               out.print(year);
               %>년 <a
               href="calendar.jsp?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
            </td>
            <td align=center width=300>
               <!-- 월 --> <a
               href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
               <%
               out.print(month + 1);
               %>월 <a
               href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
            </td>
            <td align=right width=200>
               <%
               out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
               %>
            </td>
         </tr>
      </table>
      <table border=1 cellspacing=0>
         <!-- 달력 부분 -->
         <tr>
            <td width=100>일</td>
            <!-- 일=1 -->
            <td width=100>월</td>
            <!-- 월=2 -->
            <td width=100>화</td>
            <!-- 화=3 -->
            <td width=100>수</td>
            <!-- 수=4 -->
            <td width=100>목</td>
            <!-- 목=5 -->
            <td width=100>금</td>
            <!-- 금=6 -->
            <td width=100>토</td>
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
            for (int i = 1; i <= end; i++) { //날짜출력
               out.println("<td style='font-size:20px'>"+ "DAY" + i + "<br>");
               //메모(일정) 추가 부분
               int memoyear, memomonth, memoday;
               try {
                  // select 문장을 문자열 형태로 구성한다.
                  
                  String sql = 
                  "SELECT DIARY_YEAR , DIARY_MONTH , DIARY_DAY , A_FEED , A_SNACK , B_DIAGNOSIS , B_VACCIN , C_CLOTHES , C_GROOMING , D_NUTRIENTS , D_POO , E_TRAINNING , E_HOTEL , E_KINDERGARTEN FROM COST WHERE ID  = '" + id + "'";
                  pstmt = conn.prepareStatement(sql);
                  // select 를 수행하면 데이터 정보가 ResultSet 클래스의 인스턴스로 리턴
                  ResultSet rs = pstmt.executeQuery();
                  while (rs.next()) { // 마지막 데이터까지 반복함.
               //날짜가 같으면 데이터 출력
               memoyear = rs.getInt("DIARY_YEAR");
               memomonth = rs.getInt("DIARY_MONTH");
               memoday = rs.getInt("DIARY_DAY");
               if (year == memoyear && month + 1 == memomonth && i == memoday) {
						int a = rs.getInt("A_FEED")+rs.getInt("A_SNACK");
            	   		int b = rs.getInt("B_DIAGNOSIS") + rs.getInt("B_VACCIN");
            	   		int c = rs.getInt("C_GROOMING") + rs.getInt("C_CLOTHES");
            	   		int d = rs.getInt("D_NUTRIENTS") + rs.getInt("D_POO");
            	   		int e = rs.getInt("E_TRAINNING") + rs.getInt("E_HOTEL") + rs.getInt("E_KINDERGARTEN") ;
            
                  out.println("<i class='fa-solid fa-bone'></i>"+"식비:"+a+ "&#8361" +"<br>");
                  out.println("<i class='fa-solid fa-syringe'></i>"+"병원:"+b+ "&#8361" +"<br>");
                  out.println("<i class='fa-solid fa-dog'></i>"+"복지:"+c+ "&#8361" +"<br>");
                  out.println("<i class='fa-solid fa-poop'></i>"+"위생:"+d+ "&#8361" +"<br>");
                  out.println("<i class='fa-solid fa-heart'></i>"+"교육:"+e+ "&#8361" +"<br>");
                  
                  
               }
                  }
                  rs.close();
               } catch (Exception e) {
                  System.out.println(e);
               }
               ;
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
   </center>
   
    <!-- 입력용 달력 이동 -->
   <center>
  <a href="/user/calendar.do">가계부 입력하기</a>
   </center>
   
</body>
</html>
<%
//사용한 자원을 반납한다.
pstmt.close();
conn.close();
%>