<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="hmjm.bean.dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="hmjm.bean.vo.memberVO">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%
		String m_email = (String)session.getAttribute("loginId");
		vo.setM_email(m_email);
		
		memberDAO manager = memberDAO.getInstance();
		manager.updateMember(vo);
		
%>

<form>
	<script>
		alert("수정이 완료되었습니다");
		window.location = 'application.jsp';
	</script>

</form>