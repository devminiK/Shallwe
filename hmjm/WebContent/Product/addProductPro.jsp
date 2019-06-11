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
	
	

	

%>

<script>
	alert("수업이 등록되었습니다.(수정 중이에용)");
	
</script>
<META http-equiv=refresh content="0;url=/hmjm/Tutor/Register/menu.jsp">