<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO" %>

<%
	String aid= request.getParameter("aid");
	String apw= request.getParameter("apw");
	adminDAO dao = adminDAO.getInstance();
	
	boolean result = dao.adminLoginCheck(aid, apw);
	
	if(result){
		session.setAttribute("aid",aid);
		response.sendRedirect("/hmjm/admin/adminMain.jsp");%>
		<script>
			alert("Admin Login");
		</script>
	<%}else{%>
		<script>
			alert("id/pw확인");
			history.go(-1);
		</script>
	<%}
%>
