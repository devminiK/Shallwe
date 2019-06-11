<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.search.searchDAO" %>
<%@page import="hmjm.bean.search.searchDAO" %>
<%@page import="hmjm.bean.product.productDAO" %>
<%@page import="hmjm.bean.product.productVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<%
String search = request.getParameter("search");
searchDAO dao = searchDAO.getInstance();
ArrayList<productVO> list = dao.getAllProduct(search);
for(productVO vo : list){
%>
	<p><%=vo.getP_classname()%></p>
	<p><%=vo.getP_class1()%></p>
	<p><%=vo.getP_class2()%></p>
	<p><%=vo.getP_class3()%></p>
	<p><%=vo.getP_class4()%></p>
	<p><%=vo.getP_category()%></p>
	<p><%=vo.getP_self()%></p>
<%} %>
