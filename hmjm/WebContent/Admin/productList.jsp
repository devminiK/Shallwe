<!-- 전체 판매글 조회, 수정, 삭제 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
    adminDAO prod = adminDAO.getInstance();
	ArrayList<productVO> plist = prod.getAllProduct();
	int pcount = 0;
	pcount = prod.getProductCount();
%>
<html>
<head>
<title>admin - products info</title>
</head>
<body>
<h3>List of all products - <%=pcount%></h3>
<!-- db에서 전체 판매글 목록 조회 ,수정, 삭제 가능 -->
<!-- 판매글 내의 리뷰도 수정, 삭제 가능 -->
<!-- 판매글 제목 클릭시 상세페이지 이동 -->
<table border="1">
	<tr align="center">
		<td>번호</td>
		<td>email</td>
		<td>카테고리</td>
		<td>수업명</td>
		<td>self</td>
		<td>time</td>
		<td>cost</td>
		<td>memo</td>
		<td>c_min</td>
		<td>c_max</td>
		<td>class1</td>
		<td>class2</td>
		<td>class3</td>
		<td>class4</td>
		<td>관리</td>
	</tr>
	<%for(productVO vo : plist){%>
		<tr><td><%=vo.getP_num()%></td>
			<td><%=vo.getP_email()%></td>
			<td><%=vo.getP_category()%>
			<td><a href="/hmjm/Talent/Detail.jsp?p_num=<%=vo.getP_num()%>&"><%=vo.getP_classname()%></a></td>
			<td><%=vo.getP_self()%></td>
			<td><%=vo.getP_time()%></td>
			<td><%=vo.getP_cost()%></td>
			<td><%=vo.getP_memo()%></td>
			<td><%=vo.getP_count_min()%></td>
			<td><%=vo.getP_count_max()%></td>
			<td><%=vo.getP_class1()%></td>
			<td><%=vo.getP_class2()%></td>
			<td><%=vo.getP_class3()%></td>
			<td><%=vo.getP_class4()%></td>
			<td><input type="button" name="edit" value="수정" 
				onclick="document.location.href='/hmjm/Admin/productEditForm.jsp?p_num=<%=vo.getP_num()%>'"/>
				
				<input type="button" name="delete" value="삭제"
				onclick="document.location.href='/hmjm/Admin/productDeletePro.jsp?p_num=<%=vo.getP_num()%>'"/>
			</td>
		</tr>
<%} %>
</table>
</body>
</html>