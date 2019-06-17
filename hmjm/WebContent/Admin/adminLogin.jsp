<!-- 관리자 전용 로그인폼 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page for Admin</title>
</head>
<body>
<!-- 로그인폼, submit: ~~pro.jsp -->
<h1>Admin Login</h1>
<form action="/hmjm/Admin/adminLoginPro.jsp" method="post">
	ID : <input type="text" name="aid" id="aid"/>
	PW : <input type="password" name="apw" id="apw"/><br/>
	<input type="submit"/>
	<input type="button" onclick="window.location='/hmjm/Home/mail.jsp'"/>
</form>
</body>
</html>