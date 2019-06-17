<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.member.memberVO"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="vo" class="hmjm.bean.member.memberVO">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%
	int num = Integer.parseInt(request.getParameter("m_num"));
	vo.setM_num(num);
	adminDAO edit = adminDAO.getInstance();
	edit.updateMember(vo);
%>
<script>
	alert("관리자 - 회원정보수정");
	window.location="/hmjm/Admin/memberList.jsp";
</script>