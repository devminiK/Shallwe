<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터등록 메뉴</title>
</head>
								 

<body>
<jsp:include page="header.jsp" />

	<div>

	<%=(String)session.getAttribute("registedTutor") %>
	<%
		if(session.getAttribute("registedTutor")==null){%>
		
			<input type="button" value="튜터등록" 
				      onclick="javascript:window.location='./tutorRegister.jsp'">
			
			<%}else{ %>
			<input type="button" value="튜터수정" 
				      onclick="javascript:window.location='./test.jsp'">
			
			
	<%}%>
	
	<input type="button" value="강의등록" 
				      onclick="javascript:window.location='./test.jsp'">
	</div>
</body>
</html>