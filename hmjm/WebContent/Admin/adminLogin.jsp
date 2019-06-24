<%-- 관리자 전용 로그인폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("loginId");
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Login Page for Admin</title>
</head>
<body>
<%-- 로그인폼, submit: ~~pro.jsp --%>
<%if(id==null){ %>
<h1>Admin Login</h1>
<form action="/hmjm/Admin/adminLoginPro.jsp" method="post">
	ID : <input type="text" name="aid" id="aid"/>
	PW : <input type="password" name="apw" id="apw"/><br/>
	<button type="submit" class="btn btn-primary">LogIn</button>
	<button type="button" class="btn btn-success" onclick="window.location='/hmjm/Home/main.jsp'">Home</button>
</form>
<%}else{%>
	<button type="button" class="btn btn-primary" onclick="window.location='/hmjm/Admin/adminMain.jsp'">Admin Main</button>
	<button type="button" class="btn btn-success" onclick="window.location='/hmjm/Home/main.jsp'">Home</button>
	<button type="button" class="btn btn-warning"
		onClick="window.open('/hmjm/Admin/adminMessageForm.jsp','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=620,height=600')">
		관리자에게 쪽지보내기</button>
	<button type="button" class="btn btn-danger" onclick="document.location.href='/hmjm/Admin/adminLogout.jsp'">로그아웃</button>
<%}%>

</body>
</html>