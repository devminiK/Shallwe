<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="hmjm.bean.message.messageDAO" %>
<%@ page import="hmjm.bean.message.messageVO" %>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<% 
	String id = (String)session.getAttribute("loginId");
	String send = request.getParameter("sender");
	int num=0;
	try{  
    	if(request.getParameter("s_num")!=null){
		num=Integer.parseInt(request.getParameter("s_num"));
		}
    int snum = Integer.parseInt(request.getParameter("s_num"));
    messageDAO dbPro = messageDAO.getInstance();
    messageVO vo = dbPro.getArticle(snum);
%>
<body>
<h2>쪽지 답장하기</h2>
<form method="post" name="messageReplyForm" action="/hmjm/Message/messageWritePro.jsp">
	<input type="hidden" name="s_num" value="<%=num%>">
	<!-- 답장하기를 누르면 받는사람 아이디에 보내는 사람 아이디 자동입력 -->
	<table width="550" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr><td align="center">받는사람</td>
	    	<td><%=send%>
	    		<input type="hidden" name="s_send" value="<%=id%>">
	    		<input type="hidden" name="s_receive" value="<%=send%>"></td>
		</tr>
  
		<tr><td align="center">내 용</td>
		  	<td><textarea name="s_content" rows="5" cols="65" required><%=vo.getS_content() %> 의 답장: </textarea></td>
		</tr>
	</table>
	
	<table align="center">  
		<tr><td colspan=2 align="center"> 
				<input type="submit" value="보내기"/>
				<input type="button" value="닫기" onclick="window.close()"/></td>
		</tr>
	</table>    
<%}catch(Exception e){}%>     
</form>
</body>
</html>      
