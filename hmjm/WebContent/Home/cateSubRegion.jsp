<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.*"%>
<%@ page import="hmjm.bean.classimg.*"%>
<%@ page import="hmjm.bean.review.*"%>
<%@ page import="hmjm.bean.product.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%--06.19 성민 작성 --%>

<!DOCTYPE html>
<html>
<head>
<title>지역별 카테고리 검색 시, 아래에 나올 컨텐츠</title>
<style>



.pd_container{
	background-color:#E1E1E1;
	float:left;
	margin:2px;
}
.pd_info{
	display:table-row;
}
.pd_infoEle{
	display:table-cell;
	margin-left:auto;
	margin-right:auto;
	padding:5px;
	
}

#cont_img{
	width: 300px;
}

a:link {	color: black;
			text-decoration: none;}

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
	<%-- 
	<jsp:include page="/category/reCatForm.jsp" />--%>
	<%
		request.setCharacterEncoding("UTF-8");

		//reNum값은 String 하나로 받은 뒤, split를 이용해 자른다.
		String reNumValues = request.getParameter("reNum");
		classtimeDAO ctdao = classtimeDAO.getInstance();
		classimgDAO cidao = classimgDAO.getInstance();
		productDAO pdao = productDAO.getInstance();
		reviewDAO rdao = reviewDAO.getInstance();
		
		String[] eachReNum = reNumValues.split(",");//마지막에 .jsp가 값으로 들어가게됨
		
		System.out.println("test번호갯수:"+eachReNum.length);
		
		for(int i=0;i<eachReNum.length-1;i++){
			String x = eachReNum[i];	//지역번호
			System.out.println("test:"+x);
			System.out.println("test:"+ctdao.getRegionCount(x));
		}
		
		for (String x : eachReNum) {

			String ern = x; //지역번호

			//해당 지역번호로 등록된 수업 갯수
			int pdCount = ctdao.getRegionCount(x);
			//System.out.print("해당지역 수업갯수:"+pdCount);
	%>
	
		<div id="top">
			<div id="t_box"><%=pdCount%>개의 수업</div>
			<div id="t_box">
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
		<div id="contents">
			<a href ="/hmjm/Talent/Detail.jsp?p_num=<%=pvo.getP_num()%>"></a>
			<div class="pd_container">
				<div class="pd_img"><img id="cont_img"src="/hmjm/Images/Classimg/<%=cidao.getImgRealName(num)%>"/></div>
				<div class="pd_info">
				<div class="pd_infoEle"><b>[<%=pvo.getP_classname()%>]</b></div>
				<div class="pd_infoEle"><p><img src="/hmjm/Images/Icon/coin.png"/><%=pvo.getP_cost()%></p>
				<%
					long stScore =Math.round(rdao.avgScore(num)); //반올림
					//별찍기
					for(int i=0;i<stScore;i++){%>
						<span><img src="/hmjm/Images/Icon/star_f.png"/></span>
						<%}
					for(int i=0;i<5-stScore;i++){%>
						<span><img src="/hmjm//Images/Icon/star_empty.png"/></span>
					<%}%>
						<span><%=rdao.avgScore(num)%>(<%=rdao.reviewCount(num)%>)</span>
				</div>
					</div>
			</div>
		</div><%--id=contents--%>
	
		
	<%}
	}%>
<%-- 
	<jsp:include page="footer.jsp" />--%>
</body>
</html>