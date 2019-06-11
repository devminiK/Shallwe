<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.search.searchDAO" %>
<%@ page import="hmjm.bean.product.productVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<!-- 검색결과 확인을 위한 페이지 -->
카테고리 // 클래스네임 // 셀프 // 강의내용1 // 강의내용2 // 강의내용3 // 강의내용4<br/><br/>
<%
String search = request.getParameter("search");
searchDAO dao = searchDAO.getInstance();
ArrayList<productVO> list = dao.getAllProduct(search);
if(!list.isEmpty()){
	for(productVO vo : list){%>
		<%=vo.getP_category()%>//<%=vo.getP_classname()%>//<%=vo.getP_self()%>//
		<%=vo.getP_class1()%>//<%=vo.getP_class2()%>//<%=vo.getP_class3()%>//<%=vo.getP_class4()%><br/>
	<%} 
}else{%>
	<h1>검색결과가 없습니다아아아아.</h1>
<%} %>
