<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.search.searchDAO" %>
<%@ page import="hmjm.bean.classtime.*"%>
<%@ page import="hmjm.bean.classimg.*"%>
<%@ page import="hmjm.bean.review.*"%>
<%@ page import="hmjm.bean.product.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!-- 검색결과 확인을 위한 페이지 -->
<!-- 입력한 글자가 포함된 모든 판매글을 불러옴 -->

<%
String search = request.getParameter("search");
searchDAO dao = searchDAO.getInstance();
ArrayList<productVO> list = dao.getAllProduct(search);

classimgDAO img  = classimgDAO.getInstance();//강의 등록사진 불러오기
%>
<html>
<head>
<style type="text/css">
	.ranks {
		float: left;
		width: 300px;
		height: 200px;
		overflow: hidden;
		border: 1px #ddd solid;
		padding: 1px;
	}
</style>
<title>Search Result</title>
</head>
<body>
<%-- 좌측 도움말 --%>
<jsp:include page="/SideMenu/sideMenu.jsp" flush="false"/>
<%--상단 카테고리bar: header --%>
<jsp:include page="header.jsp" flush="false" />
<h1>"<%=search%>"로 검색하신 결과입니다.</h1>
<table style="width:100%">
	
	<%
	if(!list.isEmpty()){
		for(productVO vo : list){
			int pnum = vo.getP_num();
			classimgVO ci = img.getImg(pnum);%>
			<div class="ranks">	
				no.<%=vo.getP_num()%>
				강의이름 : <a href="/hmjm/Talent/Detail.jsp?p_num=<%=vo.getP_num()%>"><%=vo.getP_classname()%></a>
				<img src="/hmjm/Images/Classimg/<%=ci.getCi_name() %>" width="100%" />
			</div>
		<%}%> 
	<%}else{%>
		<h1>검색결과가 없습니다아아아아.</h1>
	<%} %>
	
</table>
<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>