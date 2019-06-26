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
reviewDAO rdao = reviewDAO.getInstance();
productDAO pdao = productDAO.getInstance();
%>
<html>
<head>
<style type="text/css">

.pd_container {
	background-color: #E1E1E1;
	float: left;
	margin: 2px;
}

.pd_info {
	display: table-row;
}

.pd_infoEle {
	display: table-cell;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	width: 140px;
}

#btCont {
	width:100%;
	height:200px;
	float: left;
}

#cont_img {
	width: 295px;
	height:200px;
}

/*a태그 관련 스타일 적용*/
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hovor {
	color: black;
	text-decoration: none;
}

.bt_msg1{
	text-align:center;
}
.bt_msg2{
	float:right;
}

body {
	width:1200px;
	box-sizing: border-box;
	font-family: Verdana, sans-serif;
	margin: 0 auto;
}

#ft_position {
   left: 0;
   bottom: 0;
   width: 100%;
   color: black;
}
.result {
	display: table-cell;
	width: 1200px;
}
</style>
<title>Search Result</title>
</head>
<body>
<%-- 좌측 도움말 --%>
<jsp:include page="/SideMenu/sideMenu.jsp" flush="false"/>
<%--상단 카테고리bar: header --%>
<jsp:include page="header.jsp" flush="false" />

<div class="result">
<h1>"<%=search%>"로 검색하신 결과입니다.</h1>
<table style="width:100%">
	<%if(!list.isEmpty()){
		for(productVO vo : list){
			int pnum = vo.getP_num();
			classimgVO ci = img.getImg(pnum);
			productVO pvo = pdao.getProduct(pnum);%>

			<%--컨텐츠  list--%>
			<div id="contents">
				<a href="/hmjm/Talent/Detail.jsp?p_num=<%=vo.getP_num()%>">
					<div class="pd_container">
						<div class="pd_img">
							<img id="cont_img" src="/hmjm/Images/Classimg/<%=ci.getCi_name()%>" />
						</div>
						<div class="pd_info">
							<div class="pd_infoEle">
								<b>[<%=vo.getP_classname()%>]</b>
							</div>
							<div class="pd_infoEle">
								<p><img src="/hmjm/Images/Icon/coin.png"/><%=pvo.getP_cost()%></p>
								<%
								long stScore = Math.round(rdao.avgScore(pnum)); //반올림
								for (int i = 0; i < stScore; i++) {//별찍기%>
									<span><img src="/hmjm/Images/Icon/star_f.png"/></span>
								<%}
								for (int i = 0; i < 5 - stScore; i++) {%>
									<span><img src="/hmjm//Images/Icon/star_empty.png"/></span>
								<%}%>
								<%=rdao.avgScore(pnum)%>(<%=rdao.reviewCount(pnum)%>)
							</div>
						</div>
					</div>
				</a>
			</div><%--id=contents--%>

		<%}%> 
	<%}else{%>
		<h2>그런거 없습니다ㅋ</h2>
	<%} %>
</table>
</div>
<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>