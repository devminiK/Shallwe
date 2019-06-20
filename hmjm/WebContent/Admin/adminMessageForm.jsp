<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="hmjm.bean.product.*" %>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<% 
	String id = (String)session.getAttribute("loginId");
	int num=0;
	try{  
    	if(request.getParameter("s_num")!=null){
		num=Integer.parseInt(request.getParameter("s_num"));
		}
%>
<body>
<h2>관리자에게 쪽지 보내기</h2>
<form method="post" name="adminMessageWriteForm" action="/hmjm/Message/messageWritePro.jsp">
		<input type="hidden" name="s_num" value="<%=num%>">
	<table width="550" border="1" cellspacing="0" cellpadding="0" align="center">
		
		<tr><td align="center">받는사람</td>
	    	<td>admin
	    		<input type="hidden" name="s_send" value="<%=id%>">
	    		<input type="hidden" name="s_receive" value="admin"></td>
		</tr>
	  
		<tr><td align="center">내 용</td>
		  	<td><textarea name="s_content" rows="5" cols="65" required>문의드려요! : </textarea></td>
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
