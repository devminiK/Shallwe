<!-- 관리자 전용 로그인폼 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("loginId");
%>
<html>
<head>
<title>Login Page for Admin</title>
</head>
<body>
<!-- 로그인폼, submit: ~~pro.jsp -->
<%if(id==null){ %>
<h1>Admin Login</h1>
<form action="/hmjm/Admin/adminLoginPro.jsp" method="post">
	ID : <input type="text" name="aid" id="aid"/>
	PW : <input type="password" name="apw" id="apw"/><br/>
	<input type="submit" value="LogIn"/>
	<input type="button" value="Cancel" onclick="window.location='/hmjm/Home/main.jsp'"/>
</form>
<%}else{%>
	<input type="button" value="Admin Main" onclick="window.location='/hmjm/Admin/adminMain.jsp'"/>
	<input type="button" value="Home" onclick="window.location='/hmjm/Home/main.jsp'"/>
	<input type="button" value="Admin Logout" onclick="document.location.href='/hmjm/Admin/adminLogout.jsp'"/>
<%}%>

</body>
</html>