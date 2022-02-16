 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate(); // 세션에 있는 값을 전부다 지우기
response.sendRedirect("../Dang_main.jsp");
%>
</body>
</html> 


한수
재형