<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import="hmjm.bean.review.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 카테고리</title>
<style type="text/css">
* {box-sizing: border-box}
#cateSub{
	width:1200px;
	box-sizing: border-box;
	font-family: Verdana, sans-serif;
	margin: 0 auto;
}
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
	float:right
}
</style>
</head>
<%
	String cate = request.getParameter("c_code");
	productDAO db = productDAO.getInstance();
	productVO c = db.getProduct3(cate);
	
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {pageNum = "1";}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
	int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
	int count = 0;
	int number=0;
	
	List cateSubList = null; 
	productDAO dbPro = productDAO.getInstance();
	count = dbPro.getProductCount();
	if (count > 0) {
		cateSubList = dbPro.getProductSub(cate,startRow, endRow);}	
	classimgDAO aa  = classimgDAO.getInstance();//강의등록사진 불러오기
	reviewDAO rdao = reviewDAO.getInstance();
	
%>
<body id="cateSub">
<jsp:include page="/Home/header.jsp" />
<jsp:include page="category.jsp" />
<table style="width:100%">
<div>
<%if(c == null){ %>
	<h2>해당 지역에서 진행되는 수업이 없습니다 :(</h2>
	<br>
	<%}else{%>
	<%if (count == 0 ){%>
		<p>등록된 강의가 없습니다<p>
	<%}else{%>
		<% for(int i = 0 ; i <cateSubList.size(); i++){
			productVO vo = (productVO)cateSubList.get(i); 
			int pn = vo.getP_num();
			classimgVO bb = aa.getImg(pn);%>
			
			
				<div id="contents">
					<a href="/hmjm/Talent/Detail.jsp?p_num=<%=vo.getP_num()%>&pageNum=<%=currentPage %>">
				<div class="pd_container">
					<div class="pd_img">
						<img id="cont_img" src="/hmjm/Images/Classimg/<%=bb.getCi_name() %>"  />
					</div>
					<div class="pd_info">
						<div class="pd_infoEle">
						<b>[<%=vo.getP_classname() %>]</b>
						</div>
					<div class="pd_infoEle">
					<p><img src="/hmjm/Images/Icon/coin.png" /><%=vo.getP_cost()%></p>
					<%
						long stScore = Math.round(rdao.avgScore(pn)); //반올림
							
							for (int y = 0; y < stScore; y++) {//별찍기%>
								<span><img src="/hmjm/Images/Icon/star_f.png" /></span>
							<%}
							for (int y = 0; y < 5 - stScore; y++) {%>
									<span><img src="/hmjm//Images/Icon/star_empty.png" /></span>
							<%}%>
							<%=rdao.avgScore(pn)%>(<%=rdao.reviewCount(pn)%>)
				</div>
			</div>
		</div>
		</a>
	</div>
		
				<%}
				}
			}%>

	</div>
</table>	
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>