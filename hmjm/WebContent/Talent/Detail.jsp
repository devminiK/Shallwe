<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��������</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
	

%>
<body>
	<%=vo.getP_num() %>
	<%=vo.getP_classname() %>
	<%=vo.getP_self() %>
	<%=vo.getP_category() %>
	<%=vo.getP_email() %>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">���ǽ�û</a>
<% 
 }catch(Exception e){} 
%>
	
</body>
</html>