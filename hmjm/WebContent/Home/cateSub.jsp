<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 카테고리</title>
</head>
<%
	String cate = request.getParameter("c_code");
	productDAO db = productDAO.getInstance();
	productVO c = db.getProduct3(cate);
	
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {pageNum = "1";}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
	int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
	int count = 0;
	int number=0;
	
	List cateSubList = null; 
	productDAO dbPro = productDAO.getInstance();
	count = dbPro.getProductCount();
	if (count > 0) {
		cateSubList = dbPro.getProductSub(cate,startRow, endRow);}	
%>
<body>
<jsp:include page="/Home/header.jsp" />
<jsp:include page="category.jsp" />
<%if(c == null){ %>
	미등록 카테고리
	<%}else{%>
	<%if (count == 0 ){%>
		<p>등록된 강의가 없습니다<p>
	<%}else{%>
		<% for(int i = 0 ; i <cateSubList.size(); i++){
			productVO v = (productVO)cateSubList.get(i); %>
			수업번호::<%=v.getP_num() %>
			수업이름::<%=v.getP_classname() %><br>
		
		<%}%>
	<%}%>
	<%}%>
	
	
	
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>