<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="hmjm.bean.member.memberDAO" %>
<%@ page import ="hmjm.bean.member.memberVO" %>
<jsp:useBean id="vo" class="hmjm.bean.member.memberVO">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%		
		request.setCharacterEncoding("utf-8");

		memberDAO manager = memberDAO.getInstance();
		manager.insertMember(vo);

%>
			<script>
	    	alert("가입을 축하합니다!");
	    	</script>
	    	<META http-equiv=refresh content="0;url=../Log/loginForm.jsp">
	
	

	