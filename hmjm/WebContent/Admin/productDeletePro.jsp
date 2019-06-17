<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="vo" class="hmjm.bean.product.productVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	adminDAO del = adminDAO.getInstance();
	del.deleteProduct(num);
%>
<script>
	alert("관리자 - 판매글 삭제");
	window.location="/hmjm/Admin/adminMain.jsp";
</script>