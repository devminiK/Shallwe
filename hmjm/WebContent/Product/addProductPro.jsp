<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.product.*"%>
<%--성민 작성 --%>
<%-- addProduct.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pvo" scope="page" class="hmjm.bean.product.productVO" />
<jsp:setProperty name="pvo" property="*" />

<%
	productDAO pdao = productDAO.getInstance();
	pdao.insertProduct(pvo); /*작성한 정보를 삽입*/
	
	int classNum = pvo.getP_num();
	out.println(classNum);
	
	boolean result = pdao.productCheck(classNum); 

%>