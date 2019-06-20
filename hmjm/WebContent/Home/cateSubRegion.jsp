<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.*"%>
<%@ page import="hmjm.bean.classimg.*"%>
<%@ page import="hmjm.bean.review.*"%>
<%@ page import="hmjm.bean.product.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%--06.19 성민 작성 --%>
<%
		request.setCharacterEncoding("UTF-8");

		//reNum값은 String 하나로 받은 뒤, split를 이용해 자른다.
		String reNumValues = request.getParameter("reNum");
		classtimeDAO ctdao = classtimeDAO.getInstance();
		classimgDAO cidao = classimgDAO.getInstance();
		productDAO pdao = productDAO.getInstance();
		reviewDAO rdao = reviewDAO.getInstance();

		String[] eachReNum = reNumValues.split(",");
		for (String x : eachReNum) {

			String ern = x; //지역번호

			//해당 지역번호로 등록된 수업 갯수
			int pdCount = ctdao.getRegionCount(x);
			//System.out.print("해당지역 수업갯수:"+pdCount);
	%>
<!DOCTYPE html>
<html>
<head>
<title>지역별 카테고리 검색 시, 아래에 나올 컨텐츠</title>
<style>
#container {
	width: 100%;
}

#boxCon {
	width: 100%;
	height: 30px;
	display: table-row;
}

#boxl {
	display: table-cell;
}

#boxr {
	isplay: table-cell;
}

.md_main {
	display: table-row;
}

.mbox {
	width: 330px;
	height: 330px;
	dispaly: table-cell;
}

td {
	text-align: center;
	font-weight: bold;
}

#cont_img{
	width: 300px;
}

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
</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="category.jsp" />

	<div id="container">
		<div id="top">
			<div id="boxl"><%=pdCount%>개의 수업
			</div>
			<div id="boxr">
				<select>
					<option>추천도순</option>
					<option>낮은 가격순</option>
					<option>최신순</option>
				</select>
			</div>
		</div>
		<%
				//해당 지역번호로 등록된 상품 번호(리스트)
				List<String> pdNum = new ArrayList<String>();
				pdNum = ctdao.getClassNumFromRegin(x);
				//System.out.println("상품번호 리스트: "+ pdNum);

				for (int p = 0; p < pdCount; p++) {
					int num = Integer.parseInt(pdNum.get(p));

					//각각 상품번호
					//System.out.print("각각 수업번호 :"+num);

					//수업번호로 정보가져오기
					productVO pvo = pdao.getProduct(num);

					//자꾸 에러남 ㅠㅠ 그래서 객체 내용 존재유무 sysout넣음.
					if (pvo != null) {
						System.out.println("존재");
					} else {
						System.out.println("존재안함");
					}
		%>
		<%--컨텐츠  list--%>
		<div class="md_main">
			<a href ="/hmjm/Talent/Detail.jsp?p_num=<%=pvo.getP_num()%>">
			<table class="mbox" border="1">
				<tr>
					<td rowspan="2"><img id="cont_img"src="/hmjm/Images/Classimg/<%=cidao.getImgRealName(num)%>"/></td>
					<td>
						<p>[수업 명]<%=pvo.getP_classname()%></p>
					</td>
				</tr>
				<tr>
					<td>
						<p>[가격]<%=pvo.getP_cost()%>원</p>
						<%--별점평균, img로찍어주기--%>
						<p>	★★★☆☆(<%=rdao.reviewCount(num)%>)</p>
				</tr>
			</table>
			|
			</a> 
		</div>
	</div>
	<%}
	}%>

	<jsp:include page="footer.jsp" />
</body>
</html>