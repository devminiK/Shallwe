<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.member.memberVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="hmjm.bean.member.memberVO">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("m_num"));
	
	adminDAO del = adminDAO.getInstance();
	del.deleteAccount(num);
%>
<script>
	alert("관리자 - account deleted");
	window.location="/hmjm/Admin/memberList.jsp";
</script>