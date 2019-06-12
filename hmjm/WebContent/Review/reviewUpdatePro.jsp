<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.review.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
    String pageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	reviewDAO dbPro = reviewDAO.getInstance();
    int check = dbPro.updateArticle(article);
    if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=/hmjm/Talent/Detail.jsp?pageNum=<%=pageNum%>&p_num=<%=pnum %>" >
	<script language="JavaScript">
		alert("수정완료");
	</script>
	response.sendRedirect("review.jsp");
<% }%>
      
