<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="hmjm.bean.dao.*" %>
<%@ page import ="hmjm.bean.vo.*" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="vo" class="hmjm.bean.vo.tutorVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	
		tutorDAO manager = tutorDAO.getInstance();
		manager.insertTutor(vo);

%>

			<script>
	    		alert("가입을 축하합니다!");
	    	</script>
	    	<META http-equiv=refresh content="0;url=loginForm.jsp">