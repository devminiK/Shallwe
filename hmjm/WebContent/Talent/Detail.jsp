<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>강의 상세페이지</title>
</head>

<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
%>

<body>
<jsp:include page="/Home/header.jsp" />
	<h1>강의 상세 페이지</h1>
	<p><%=vo.getP_num() %>:::::::::::::이거 강의번호를 신청할때 넘겨야한다</p><br>
	강의제목:::::::: <%=vo.getP_classname() %><br>
	강사소개:::::::: <%=vo.getP_self() %><br>
	카테고리:::::::: <%=vo.getP_category() %><br>
	강사이메일:::::::: <%=vo.getP_email() %><br><br>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">강의신청</a>
	
<% 
	}catch(Exception e){} 
%>
<br/><br/>
<jsp:include page="/Review/review.jsp?p_num=<%=num%> %>"/>
<jsp:include page="/Home/footer.jsp" />
</body>
</html>