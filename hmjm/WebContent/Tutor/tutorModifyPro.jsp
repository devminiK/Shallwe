<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.dao.*"%>
<%@ page import = "hmjm.bean.vo.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="hmjm.bean.vo.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
		
		String t_email = (String)session.getAttribute("loginId");
		vo.setT_email(t_email);
		
		tutorDAO manager = tutorDAO.getInstance();
		manager.updateTutor(vo);
		

%>

<p>수정이 된건가?</p>
	<form>
	    <input type="button" value="메인으로" onclick="window.location='tutorMenu.jsp'">
    </form>