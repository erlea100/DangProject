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
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
</head>
<style type="text/css">

td {
	width: 150px;
	height: 100px;
	text-align: center;
}

</style>
<body>
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
			<table border=1 cellspacing=0>

				<!-- 달력 부분 -->
				<tr>
					<td colspan="2" width=100>
						<!-- 년 도--> <a
						href="/user/calendar.do?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
						<span class="year"> <%
 out.print(year);
 %>
					</span>년 <a
						href="/user/calendar.do?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
					</td>
					<td colspan="3" width=100>
						<!-- 월 --> <a
						href="/user/calendar.do?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
						<span class="month"> <%
 out.print(month + 1);
 %>
					</span>월 <a
						href="/user/calendar.do?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
					</td>
					<td colspan="2" width=100>
						<%
						out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
						%>
					</td>
				</tr>
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

						out.println("<td>" + "<button id='date' value =" + i + ">" + i + "</button>" + "<br>");
						//메모(일정) 추가 부
					%>
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
		<div class="modal-title" style="text-align: center;">날짜</div>
		<ul class="modal-tabs">

			<li>

				<form action="/diary/selectDiary.do" method="get">
					<input class="date-title" name="date" readonly="readonly" /> <input
						name="id" value="<%=id%>" readonly="readonly" /> <a
						href="#modal-contents1-1" class="on">조회</a> <input type="submit" />
				</form>
			</li>

			<li><a href="#modal-contents1-2">추가/수정</a></li>
		</ul>
		<div class="modal-contents" id="modal-contents1-1">
			<%-- <c:forEach items="${list}" var="vo">
					<a id="a_Feed">사료 : ${vo.a_Feed }</a><br/>
					<a id="a_Snack">간식 : ${vo.a_Snack }</a><br/>
					<a id="b_Diagnosis">진료 : ${vo.b_Diagnosis }</a><br/>
					<a id="b_Vaccin">예방주사 : ${vo.b_Vaccin }</a><br/>
					<a id="c_Grooming">미용 : ${vo.c_Grooming }</a><br/>
					<a id="c_Clothes">옷 : ${vo.c_Clothes }</a><br/>
					<a id="d_Nutrients">영양제 : ${vo.d_Nutrients }</a><br/>
					<a id="d_Poo">배변 : ${vo.d_Poo }</a><br/>
					<a id="e_Trainning">훈련 : ${vo.e_Trainning }</a><br/>
					<a id="e_Hotel">호텔 : ${vo.e_Hotel }</a><br/>
					<a id="e_Kindergarten">유치원 : ${vo.e_Kindergarten }</a>
				</c:forEach> --%>

			<c:forEach items="${list}" var="vo">
				<a id="a_Feed">사료 : ${vo.a_Feed }</a>
				<br />
				<a id="a_Snack">간식 : ${vo.a_Snack }</a>
				<br />
				<a id="b_Diagnosis">진료 : ${vo.b_Diagnosis }</a>
				<br />
				<a id="b_Vaccin">예방주사 : ${vo.b_Vaccin }</a>
				<br />
				<a id="c_Grooming">미용 : ${vo.c_Grooming }</a>
				<br />
				<a id="c_Clothes">옷 : ${vo.c_Clothes }</a>
				<br />
				<a id="d_Nutrients">영양제 : ${vo.d_Nutrients }</a>
				<br />
				<a id="d_Poo">배변 : ${vo.d_Poo }</a>
				<br />
				<a id="e_Trainning">훈련 : ${vo.e_Trainning }</a>
				<br />
				<a id="e_Hotel">호텔 : ${vo.e_Hotel }</a>
				<br />
				<a id="e_Kindergarten">유치원 : ${vo.e_Kindergarten }</a>
			</c:forEach>
		</div>

		<div class="modal-contents" id="modal-contents1-2">
			<form name="diary-history" method="post" action="/diary/saveDiary.do">
				<input class="date-title2" name="date" readonly="readonly" /> <select
					id="val" name="val" onchange="Change()">
					<option>선택</option>
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


				<div id="d1" style="display: none">
					<input type="number" name="a_Feed" value="0" min="0"
						placeholder="사료" />
				</div>
				<div id="d2" style="display: none">
					<input type="number" name="a_Snack" value="0" min="0"
						placeholder="간식" />
				</div>
				<div id="d3" style="display: none">
					<input type="number" name="b_Diagnosis" value="0" min="0"
						placeholder="진료" />
				</div>
				<div id="d4" style="display: none">
					<input type="number" name="b_Vaccin" value="0" min="0"
						placeholder="예방주사" />
				</div>
				<div id="d5" style="display: none">
					<input type="number" name="c_Grooming" value="0" min="0"
						placeholder="미용" />
				</div>
				<div id="d6" style="display: none">
					<input type="number" name="c_Clothes" value="0" min="0"
						placeholder="옷" />
				</div>
				<div id="d7" style="display: none">
					<input type="number" name="d_Nutrients" value="0" min="0"
						placeholder="영양제" />
				</div>
				<div id="d8" style="display: none">
					<input type="number" name="d_Poo" value="0" min="0"
						placeholder="배변" />
				</div>
				<div id="d9" style="display: none">
					<input type="number" name="e_Trainning" value="0" min="0"
						placeholder="훈련" />
				</div>
				<div id="d10" style="display: none">
					<input type="number" name="e_Hotel" value="0" min="0"
						placeholder="호텔" />
				</div>
				<div id="d11" style="display: none">
					<input type="number" name="e_Kindergarten" value="0" min="0"
						placeholder="유치원" />
				</div>


				<input type="hidden" name=id value="<%=id%>" /> <input
					type="submit" onclick="Submit()">
			</form>
		</div>
	</div>
	<script type="module" src="/resources/index.js"></script>
	<script type="text/javascript">
		/* 1차 선택 - 셀렉트 */
		function Change() {
			alert("체인지 이벤트")
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
</html>