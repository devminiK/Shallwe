<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "hmjm.bean.dao.*" %>
<%@ page import = "hmjm.bean.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터등록 메뉴</title>
</head>
								 

<body>
<jsp:include page="header.jsp" />
	


<%										
	String m_email = (String)session.getAttribute("loginId");
	//System.out.println("====="+m_email);
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	
	String t_email = (String)session.getAttribute("loginId");
	tutorDAO tt = tutorDAO.getInstance();
	tutorVO e = tt.getMember(t_email);
%>
	


	<div>
	<%=c.getM_email()%>
	<%=e.getT_email()%>
	<%=e.getT_nick()%>
	<%=e.getT_selfimg()%>

	
	
	<%
		if(session.getAttribute("loginId") == e.getT_email()){%>
		
			<input type="button" value="튜터수정" 
				      onclick="javascript:window.location='./test.jsp'">
			
			
			<%}else{ %>
			<input type="button" value="튜터등록" 
				      onclick="javascript:window.location='./tutorRegister.jsp'">
			
			
	<%}%>
	
	<input type="button" value="강의등록" 
				      onclick="javascript:window.location='./test.jsp'">
	</div>
</body>
</html>