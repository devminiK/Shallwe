<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import ="hmjm.bean.test.*" %>
<%@ page import ="java.util.*" %>
<%
	String c_code = request.getParameter("c_code");
	produtctCategoryDAO serch = produtctCategoryDAO.getInstance();
	ArrayList <productCategoryVO> alist = serch.getAllCategory(c_code);

// DAO 생성후 no 전달 값을 받아온다..%> 
<% 
		for(int i = 0 ; i < alist.size() ;i++){
		productCategoryVO avo = alist.get(i);
%>

<li>
<div class="sri_input3" >
<input type="checkbox" id="<%=() %>" name="loc_cd" >
<label for="<%=avo.getAsno()%>"><span class="txt"><%=avo.getAsname() %></span></label>
</div>
</li>
<%} %>