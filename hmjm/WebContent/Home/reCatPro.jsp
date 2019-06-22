<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.product.productDAO" %>
<%@ page import = "hmjm.bean.product.productVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%--06.17 성민 작성 --%>

<%
	
	String[] values = request.getParameterValues("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	productDAO pdao = productDAO.getInstance();
	String plus="reNum=";
	
	for(String val:values){
		out.print("선택한 지역 번호: ["+val+"]");
		plus+=val+",";
	}
	System.out.println(plus);
%>
<%-- 
<a href="/hmjm/Home/cateSubRegion.jsp?<%=plus%>">링크일단</a>
--%>

<META  http-equiv="Refresh" content="0; URL=/hmjm/Home/cateSubRegion.jsp?<%=plus%>.jsp"/>	



