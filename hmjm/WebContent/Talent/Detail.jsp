<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>강의 상세페이지</title>
</head>

<%
	String id = (String) session.getAttribute("loginId");
	
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
	<input type="hidden" name="p_email" value="<%=vo.getP_email()%>"/>
	강사이메일:::::::: <a href="/hmjm/Message/messageWriteForm.jsp?p_email=<%=vo.getP_email()%>&p_num=<%=num%>">
		<%=vo.getP_email() %></a><br><br>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">강의신청</a>

	
	
<% 
	}catch(Exception e){} 
%>
<br/><br/>
<jsp:include page="/Review/review.jsp?p_num=<%=num%> %>"/>
<jsp:include page="/Home/footer.jsp" />
</body>
</html>