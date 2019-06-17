<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	session.invalidate();
%>

<script>
	alert("Goodbye Admin");
	window.location="/hmjm/Admin/adminLogin.jsp";
</script>