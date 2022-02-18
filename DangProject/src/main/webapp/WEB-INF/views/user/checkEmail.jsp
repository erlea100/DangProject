<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="team";
String pass="1234";
String dbURL="jdbc:oracle:thin:@129.154.201.125:1521:xe";


   Class.forName(driver);
   Connection connection=DriverManager.getConnection(dbURL,user,pass);
   
   String sql = "select * from USER_INFO where E_MAIL='" + request.getParameter("useremail")+"'"; // 유저 아이디로 받겠대
   System.out.println(sql);
   Statement stmt = connection.createStatement();
   ResultSet rs = stmt.executeQuery(sql);      

   String result="NO";
   if (rs.next()){      
      result = "YES";
   }      
   out.print(result);
%>
