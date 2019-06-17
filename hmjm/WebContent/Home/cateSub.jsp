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
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {pageNum = "1";}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
	int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
	int count = 0;
	int number=0;
	
	List cateSubList=null; 
	productDAO dbPro = productDAO.getInstance();
	count = dbPro.getProductCount();
	if (count > 0) {
		cateSubList = dbPro.getProduct2(cate,startRow, endRow);}	

%>


<body>
<%=cate %>
</body>
</html>