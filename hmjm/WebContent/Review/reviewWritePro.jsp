<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.review.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
	String id = (String)session.getAttribute("loginId");
	reviewDAO dbPro = reviewDAO.getInstance();
    dbPro.insertArticle(article);
    response.sendRedirect("review.jsp");
%>
