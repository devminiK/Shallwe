<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.message.messageVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="hmjm.bean.message.messageVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("s_num"));
	adminDAO del = adminDAO.getInstance();
	del.deleteMsg(num);
%>
<script>
	alert("관리자 - 쪽지 삭제");
	window.location="/hmjm/Admin/adminMain.jsp";
</script>