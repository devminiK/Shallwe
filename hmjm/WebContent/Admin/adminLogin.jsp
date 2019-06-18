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
	<input type="button" value="Home" onclick="window.location='/hmjm/Home/main.jsp'"/>
</form>
<%}else{%>
	<input type="button" value="Admin Main" onclick="window.location='/hmjm/Admin/adminMain.jsp'"/>
	<input type="button" value="Home" onclick="window.location='/hmjm/Home/main.jsp'"/>
	<input type="button" value="관리자에게 쪽지보내기" onClick="window.open('/hmjm/Admin/adminMessageForm.jsp','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=620,height=600')"/>
	<input type="button" value="Logout" onclick="document.location.href='/hmjm/Admin/adminLogout.jsp'"/>
<%}%>

</body>
</html>