<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.review.reviewDAO"%>
<%@ page import="hmjm.bean.review.reviewVO"%>
<%@ page import="hmjm.bean.product.productDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%!
    int pageSize = 10; //한 화면에 보여줄 리스트 갯수
%>

<%
	String id = (String)session.getAttribute("loginId");
	String pageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	
    if (pageNum == null) { pageNum = "1"; }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number= 0;

    List articleList = null;
    reviewDAO dbPro = reviewDAO.getInstance();
    count = dbPro.getArticleCount(pnum);

    if (count > 0) {
        articleList = dbPro.getArticles(pnum, startRow, endRow);
    }
	number=count-(currentPage-1)*pageSize;

	int rcount = 0; //판매글 리뷰 갯수 초기화
	rcount = dbPro.reviewCount(pnum);
	
	
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">

<body align="center">
<b>사용자 후기</b>
<%if (rcount == 0) {%>
	<table width="800" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr><td align="center">작성된 후기가 없습니다.</td></tr>
	</table>

<%}else{%>
	<table border="2" width="900" cellpadding="0" cellspacing="0" align="center"> 
	<%for (int i = 0 ; i < articleList.size() ; i++) {
		reviewVO article = (reviewVO)articleList.get(i);%>
		<tr><td align="center"  width="50" ><%=number--%></td>
		    <td align="left" width="375" colspan="3"><%=article.getR_re()%></td>
		    <td align="center"  width="100"><%=article.getR_name()%></td>
		    <td align="center"  width="100"><%=article.getR_reg()%></td>
		</tr>
			<!-- 점수에 따라 별 갯수 1~5개 -->
		<tr><td align="center" width="150">커리큘럼<br/>
			<%int curr = article.getR_s_curr();
			for(int cu=0; cu<curr; cu++){%>	<img src="/hmjm/Images/star.jpg"> <%}%> </td>

			<td align="center" width="150">준비성<br/>
			<%int pre = article.getR_s_pre();
			for(int pr=0; pr<pre; pr++){%> <img src="/hmjm/Images/star.jpg"> <%}%> </td>

			<td align="center" width="150">시간준수<br/>
			<%int tk = article.getR_s_tk();
			for(int t=0; t<tk; t++){%> <img src="/hmjm/Images/star.jpg"> <%}%> </td>

			<td align="center" width="150">전달력<br/>
			<%int deli = article.getR_s_deli();
			for(int de=0; de<deli; de++){%>	<img src="/hmjm/Images/star.jpg"> <%}%> </td>

			<td align="center" width="150">친절도<br/>
			<%int kind = article.getR_s_kind();
			for(int ki=0; ki<kind; ki++){%> <img src="/hmjm/Images/star.jpg"> <%}%> </td>
			
			<!-- 로그인을 한상태 + 작성글의 아이디와 로그인 아이디가 일치할때만 수정/삭제 가능-->
			<td align="center">
			<%String login = article.getR_name();
			if (id!=null){
				if(id.equals(login) || id.equals("admin")) {%>
					<input type="button" value="수정" 
						onclick="document.location.href='/hmjm/Review/reviewUpdateForm.jsp?num=<%=article.getR_num()%>&pageNum=<%=pageNum%>&p_num=<%=pnum%>'"/>
					<input type="button" value="삭제" 
						onclick="document.location.href='/hmjm/Review/reviewDeleteForm.jsp?num=<%=article.getR_num()%>&p_num=<%=pnum%>'">
			<%}}%> </td>
		</tr>
	<%}}%>
</table>
<%
if (count > 0) {
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
    int startPage = (int)(currentPage/10)*10+1;
	int pageBlock=10;
    int endPage = startPage + pageBlock-1;
    if (endPage > pageCount) endPage = pageCount;
	if (startPage > 10) {%>
		<a href="/hmjm/Talent/Detail.jsp?p_num=<%=pnum%>&pageNum=<%=startPage-10%>">[이전]</a>
	<%}
	for (int i = startPage ; i <= endPage ; i++) {  %>
		<a href="/hmjm/Talent/Detail.jsp?p_num=<%=pnum%>&pageNum=<%=i%>">[<%=i%>]</a>
	<%}
	if (endPage < pageCount) {%>
		<a href="/hmjm/Talent/Detail.jsp?p_num=<%=pnum%>&pageNum=<%=startPage+10%>">[다음]</a>
	<%}
}%>
<br/><br/>
<%
/*
1. 로그인 확인
2. buy테이블에서 b_email 확인 
3. 리뷰 작성 아이디 중복확인
로그인 true, b_email true , 중복 false 일때 reviewWriteForm include  
*/

//리뷰 작성 아이디 중복확인
reviewDAO chk = reviewDAO.getInstance();
int check = chk.checkArticle(pnum, id);
int bcheck = chk.buyCheck(pnum, id);

if(id != null){ //로그인 상태일 때
	if(check == 0){ //작성된 리뷰 중 중복 아이디가 없을 때
		if(bcheck != 0){%> <!-- 구매확인 true일때 -->
			<jsp:include page="/Review/reviewWriteForm.jsp"/>
		<%}else{%> <!-- 구매자가 아닐경우 출력 -->
			<p>강의 신청부터...</p>
		<%}	
	}else{%> <!-- 중복아이디가 있으면 출력 -->
		<p>리뷰는 한번만...</p>
	<%}
}else{%> <!-- 로그아웃 상태면 출력 -->
	<p>로그인 좀...</p>
<%}%>

<%
if(id!=null){
if(id.equals("admin")){ %>
	<jsp:include page="/Review/reviewWriteForm.jsp"/>
<%} %>
<%} %>
</body>
</html>

