<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.*" %>
<%@ page import="hmjm.bean.product.*" %>

<%--06.17 성민 작성 --%>
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("UTF-8");

	//String preUser = (String)session.getAttribute("loginId");
	
	//지역별 카테고리 갯수를 가져오기위해함
	classtimeDAO ctdao = classtimeDAO.getInstance();
%>
<head>
<title>지역별 카테고리 검색</title>
<%--
	
	1. 상품의 종류에 따라 어떤 지역이 있는지 파악하는 메서드 필요-----
	2. 지역에 관한 카테고리가 몇개인지 파악하는 메서드 필요------ getCount(cr_code)
	

 --%>
 <style>
 #row{
 	display:table-row;
 }
 #box{
 	display:table-cell;
 	padding:10px;
 }
 #bottom{
 	float:right;
 }
 .icon{
 	width:25px;
 	margin:3px;
 }
 td{
 	padding:10px;
 	text-align:center;
 	font-weight:bold;
 }
 </style>
</head>

<body>
<div id="container">
	<div id="row">
		<div id="box">
			<h2>어디에서 <img class="icon" src="/hmjm/Images/Icon/mapmark.png"/></h2>	
			<h2>배우고 싶으세요?</h2>		
			<h4>지역을 선택해주세요</h4>
		</div>
		<div id="box">
			<table border=1 >
		<tr>
			<td><span>강남</span><span>(<%=ctdao.getRegionCount("101")%>)</span></td>
			<td><span>신촌홍대</span><span>(<%=ctdao.getRegionCount("102")%>)</span></td>
			<td><span>건대</span><span>(<%=ctdao.getRegionCount("103")%>)</span></td>
		</tr>
		<tr>
			<td><span>수원</span><span>(<%=ctdao.getRegionCount("201")%>)</span></td>
			<td><span>분당</span><span>(<%=ctdao.getRegionCount("202")%>)</span></td>
			<td><span>죽전</span><span>(<%=ctdao.getRegionCount("203")%>)</span></td>
		</tr>
		<tr>
			<td><span>부산서면</span><span>(<%=ctdao.getRegionCount("301")%>)</span></td>
			<td><span>부산해운대</span><span>(<%=ctdao.getRegionCount("302")%>)</span></td>
			<td><span>부산사상</span><span>(<%=ctdao.getRegionCount("303")%>))</span></td>
		</tr>
	</table>
		</div>
	
	</div>
	<div id="bottom">
		<button>선택지역 결과 보기</button>
	</div>
	</div>
	
</body>
</html>