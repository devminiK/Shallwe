<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import ="hmjm.bean.dao.*" %>
<%@ page import ="hmjm.bean.vo.tutorVO" %>
<jsp:useBean id="vo" class="hmjm.bean.vo.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%
	String t_nick= request.getParameter("t_nick");
	
	tutorDAO dao = tutorDAO.getInstance();
	
	boolean result = dao.tutorCheck(t_nick);
	
	if(result){
		session.setAttribute("registedTutor",t_nick);
		response.sendRedirect("main.jsp");
	}else{%>
	
<<<<<<< HEAD
		<script>
	    		alert("이거나오면 오류인..데");
	    		history.go(-1);
	    	</script><% 
		

		
	}%>
