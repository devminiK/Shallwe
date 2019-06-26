<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.product.*"%>
<%--성민 작성 --%>
<%-- addProduct.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pvo" scope="page" class="hmjm.bean.product.productVO" />
<jsp:setProperty name="pvo" property="*" />

<%
	productDAO pdao = productDAO.getInstance();
System.out.println("===============================");
	pdao.insertProduct(pvo); /*작성한 정보를 삽입*/
	
	//최종 시퀀스 값이 얼마인지 구해야한다.(세션은 string형으로 받고,주어야하기때문에 형변환)
	String productNum = String.valueOf(pdao.getProductNum());
	
	//세션set(상품 고유 번호(시퀀스)를 넘긴다.)
	session.setAttribute("productNum",productNum);	
	
	//test용, 추후 삭제할것
	System.out.println("addProdcutPro.jsp: 세션상품번호"+productNum);
%>

<%--상품등록이 완료되었을경우의 확인절차 알고리즘..? : 보류 --%>

<script>
	var num ="<%=productNum%>";
	alert("[알림] 수업번호:"+num+" 상품이 등록 완료되었습니다.\n추가적인 정보를 입력해주세요.");
</script>
<META http-equiv=refresh content="0; url=/hmjm/Product/addClasstime.jsp">
