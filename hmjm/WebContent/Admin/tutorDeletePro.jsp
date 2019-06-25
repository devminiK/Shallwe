<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.tutor.tutorVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="hmjm.bean.tutor.tutorVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("t_num"));
	adminDAO del = adminDAO.getInstance();
	del.deleteTutor(num);
%>
<script>
	alert("관리자 - 튜터 삭제");
	window.location="/hmjm/Admin/adminMain.jsp";
</script>