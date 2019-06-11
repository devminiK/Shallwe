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

<%--상품등록이 완료되었을경우의 확인절차 알고리즘..? : 보류 --%>

<script>
	alert("[알림]수업 등록이 완료되었습니다. 추가적인 정보를 입력해주세요.");
</script>


<META http-equiv=refresh content="0; url=/hmjm/Tutor/menu.jsp">

<%--시간 등록from으로 넘어가기 --%>
<%-- 
<META http-equiv=refresh content="0; url=/hmjm/Product/addClasstime.jsp">
--%>