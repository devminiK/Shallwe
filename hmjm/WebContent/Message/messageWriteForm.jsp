<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<% 
	String id = (String)session.getAttribute("loginId");
	String p_email = request.getParameter("p_email");
	int num=0;
	try{  
    	if(request.getParameter("s_num")!=null){
		num=Integer.parseInt(request.getParameter("s_num"));
		}
%>
<body>
<form method="post" name="messageWriteForm" action="/hmjm/Message/messageWritePro.jsp">
		<input type="hidden" name="s_num" value="<%=num%>">
	<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
		<!-- 보내는 사람은 로그인한 아이디, 받는사람 아이디는 수동입력 -->
		<tr><td width="100" align="center">보내는사람</td>
	    	<td width="330"><%=id%>
	    		<input type="hidden" name="s_send" value="<%=id%>">
	    	<td width="100" align="center">받는사람</td>
	    	<td width="330"><%=p_email%>
	    		<input type="hidden" name="s_receive" value="<%=p_email%>"></td>
		</tr>
	  
		<tr><td width="70" align="center">내 용</td>
		  	<td width="330" colspan="3">
		  		<textarea name="s_content" rows="5" cols="100" required></textarea></td>
		</tr>
	</table>
	
	<table align="center">  
		<tr><td colspan=2 align="center"> 
				<input type="submit" value="보내기"/>
				<input type="reset" value="취소"/></td>
		</tr>
	</table>    
<%}catch(Exception e){}%>     
</form>   
</body>
</html>      
