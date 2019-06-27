<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.message.messageDAO" %>
<%@ page import = "hmjm.bean.message.messageVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Received Message</title>
</head>
<%!
    int pageSize = 10; //한 화면에 보여줄 리스트 갯수
%>

<%
	String id = (String)session.getAttribute("loginId");
	String pageNum = request.getParameter("pageNum");
		
    if (pageNum == null) { pageNum = "1"; }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number= 0;
    
    List articleList = null;
    messageDAO dbPro = messageDAO.getInstance();
    count = dbPro.getArticleCount(id);
    
    if (count > 0) {
    	articleList = dbPro.getArticles(startRow, endRow, id);
    }
    number=count-(currentPage-1)*pageSize;
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<body align="center">
<%if(id == null){%>
	<script>
		alert("로그인이 필요합니다.");
		window.location="/hmjm/Log/loginForm.jsp";
	</script>
<%} %> 

<b>받은 쪽지목록(전체 쪽지:<%=count%>)</b>
<%if(count == 0){%>
	<table width="600" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr><td align="center">쪽지가 없습니다.</td></tr>
	</table>
<%}else{%>
<form method="post" name="message">
	<table border="1" cellpadding="0" cellspacing="0" align="center"> 
	<%for(int i = 0 ; i < articleList.size() ; i++) {
		messageVO article = (messageVO)articleList.get(i);
		String login = article.getS_receive();
		//새 쪽지 알림
		int newm = article.getS_count();
		if(newm == 2){%>
			<script>
				alert("new message");
			</script>
		<%}if(id.equals(login)) {%>
		<tr><td align="center" width="30" ><%=number--%></td>
		    <td align="center" width="100">from <%=article.getS_send()%>
		    	<input type="hidden" name="sender" value="<%=article.getS_send() %>"/></td>
		    <td align="center" width="100"><%=article.getS_reg()%></td>
		    <td align="left" width="350"><%=article.getS_content()%></td>
		    <td align="center">
		    	<button type="button" class="btn btn-primary btn-sm"
		    		onclick="document.location.href='/hmjm/Message/messageReplyForm.jsp?s_num=<%=article.getS_num()%>&sender=<%=article.getS_send()%>'">답장</button>
				<button type="button" class="btn btn-danger btn-sm"
					onclick="document.location.href='/hmjm/Message/messageDeleteForm.jsp?num=<%=article.getS_num()%>'">삭제</button></td>
		</tr>
	<%}}}%>
	</table>
	<button type="button" class="btn btn-dark" onclick="window.close()">닫기</button>
<%if (count > 0) {
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
    int startPage = (int)(currentPage/10)*10+1;
	int pageBlock=10;
    int endPage = startPage + pageBlock-1;
    if (endPage > pageCount) endPage = pageCount;
    if (startPage > 10) {%>
    	<a href="message.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%}
	for (int i = startPage ; i <= endPage ; i++) {%>
    	<a href="message.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	<%}
    if (endPage < pageCount) {%>
		<a href="message.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%}
}%>
</form>
</body>
</html>
