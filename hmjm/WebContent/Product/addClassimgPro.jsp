<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.classimg.classimgDAO" %>

<% request.setCharacterEncoding("UFT-8"); %>

<jsp:useBean id="imgvo" scope="page" class="hmjm.bean.classimg.classimgVO"/>
<jsp:setProperty name="imgvo" property="*"/>

<%
	//해당 상품의 번호를 받아온다.
	//int proudctnum =Integer.parseInt(request.getParameter("productnum"));//form에서 보낸거받기
	//imgvo.setCi_classnum(proudctnum);
	
	classimgDAO dao = classimgDAO.getInstance();
	dao.insertClassimg(imgvo);
	
	
%>