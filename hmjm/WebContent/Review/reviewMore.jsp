<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.review.reviewDAO"%>
<%@ page import="hmjm.bean.review.reviewVO"%>
<%@ page import="hmjm.bean.product.productDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%!
    int rpageSize = 100; //한 화면에 보여줄 리스트 갯수
%>

<%
	String id = (String)session.getAttribute("loginId");
	String rpageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	
    if (rpageNum == null) { rpageNum = "1"; }

    int rcurrentPage = Integer.parseInt(rpageNum);
    int rstartRow = (rcurrentPage - 1) * rpageSize + 1;
    int rendRow = rcurrentPage * rpageSize;
    int recount = 0;
    int number= 0;

    List articleList = null;
    reviewDAO dbPro = reviewDAO.getInstance();
    recount = dbPro.getArticleCount(pnum);

    if (recount > 0) {
        articleList = dbPro.getArticles(pnum, rstartRow, rendRow);
    }
	number=recount-(rcurrentPage-1)*rpageSize;

	int rcount = 0; //판매글 리뷰 갯수 초기화
	rcount = dbPro.reviewCount(pnum);
	
	double avg = dbPro.avgScore(pnum); //리뷰 별점의 평균점수
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">

<body align="center">
<b>모든 리뷰: <%=rcount%>개</b>
<p>평균점수: <%=avg%> / 5</p>
<%if (rcount == 0) {%>
	<table width="800" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr><td align="center">작성된 후기가 없습니다.</td></tr>
	</table>

<%}else{%>
	<table border="2" cellpadding="0" cellspacing="0" align="center"> 
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
						onclick="document.location.href='/hmjm/Review/reviewMoreUpdateForm.jsp?num=<%=article.getR_num()%>&rpageNum=<%=rpageNum%>&p_num=<%=pnum%>'"/>
					<input type="button" value="삭제" 
						onclick="document.location.href='/hmjm/Review/reviewMoreDeleteForm.jsp?num=<%=article.getR_num()%>&p_num=<%=pnum%>'">
			<%}}%> </td>
		</tr>
	<%}}%>
</table>
<%
if (recount > 0) {
	int rpageCount = recount / rpageSize + ( recount % rpageSize == 0 ? 0 : 1);
    int rstartPage = (int)(rcurrentPage/10)*10+1;
	int rpageBlock=10;
    int rendPage = rstartPage + rpageBlock-1;
    if (rendPage > rpageCount) rendPage = rpageCount;
	if (rstartPage > 10) {%>
		<a href="/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>&rpageNum=<%=rstartPage-10%>">[이전]</a>
	<%}
	for (int i = rstartPage ; i <= rendPage ; i++) {  %>
		<a href="/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>&rpageNum=<%=i%>">[<%=i%>]</a>
	<%}
	if (rendPage < rpageCount) {%>
		<a href="/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>&rpageNum=<%=rstartPage+10%>">[다음]</a>
	<%}
}%>
</body>
</html>
