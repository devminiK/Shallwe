<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.dao.messageDAO" %>
<%@ page import = "hmjm.bean.vo.messageVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 5; //한 화면에 보여줄 리스트 갯수
%>

<%
	String id = (String)session.getAttribute("loginId");
	String pageNum = request.getParameter("pageNum");
	
	//String sender = (String)session.getAttribute("s_send");
	//session.setAttribute("sender",sender);	
	
    if (pageNum == null) { pageNum = "1"; }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number= 0;

    List articleList = null;
    messageDAO dbPro = messageDAO.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
    	articleList = dbPro.getArticles(startRow, endRow);
    }
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<body align="center">
<%--
if(s_count == 0){}
alert("NEW MSG");
--%>


<%if(id != null){%> 
<b>쪽지목록(전체 쪽지:<%=count%>)</b>
<%if (count == 0) {%>
	<table width="800" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr><td align="center">쪽지가 없습니다.</td></tr>
	</table>
<%}else{%>
	<table border="2" width="800" cellpadding="0" cellspacing="0" align="center"> 
	<%for (int i = 0 ; i < articleList.size() ; i++) {
		messageVO article = (messageVO)articleList.get(i);
		String login = article.getS_receive();
		if(id.equals(login)) {%>
		<tr>
		    <td align="center" width="50" ><%=number--%></td>
		    <td align="center" width="100" name="s_send">from <%=article.getS_send()%></td>
		    <td align="center" width="100" name="s_receive">to <%=article.getS_receive()%></td>
		    <td align="center" width="100" name="s_reg"><%=article.getS_reg()%></td><br/>
		    <td align="left" width="375" colspan="3" name="s_content"><%=article.getS_content()%></td>
		    <td align="center">
				<input type="button" value="답장" 
					onclick="document.location.href='messageReplyForm.jsp?num=<%=article.getS_num()%>&pageNum=<%=pageNum%>'"/>
				<input type="button" value="삭제" 
					onclick="document.location.href='messageDeleteForm.jsp?num=<%=article.getS_num()%>'"></td>
		</tr>
	<%}}%>
	</table>
<%}
	if (count > 0) {
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
	    int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
	    int endPage = startPage + pageBlock-1;
	    if (endPage > pageCount) endPage = pageCount;
		if (startPage > 10) {%>
			<a href="message.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
		<%}
		for (int i = startPage ; i <= endPage ; i++) {  %>
			<a href="message.jsp?pageNum=<%= i %>">[<%= i %>]</a>
		<%}
		if (endPage < pageCount) {%>
			<a href="message.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
		<%}
	}%>
<br/><br/>
<jsp:include page="messageWriteForm.jsp" />
<%}else{%>
	<script>
		alert("로그인필요");
	</script>
<%} %>
</body>
</html>

