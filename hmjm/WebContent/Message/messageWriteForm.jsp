<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="hmjm.bean.product.*" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<% 
	String id = (String)session.getAttribute("loginId");
	String p_email = request.getParameter("p_email");
	int num=0;
	try{  
    	if(request.getParameter("s_num")!=null){
		num=Integer.parseInt(request.getParameter("s_num"));
		}
    int pnum = Integer.parseInt(request.getParameter("p_num"));
    productDAO dbPro = productDAO.getInstance();
    productVO vo = dbPro.getProduct(pnum);
    
%>
<body>
<h2>튜터에게 쪽지 보내기</h2>
<form method="post" name="messageWriteForm" action="/hmjm/Message/messageWritePro.jsp">
		<input type="hidden" name="s_num" value="<%=num%>">
	<table border="1" width=550 cellspacing="0" cellpadding="0" align="center">
		<!-- 보내는 사람은 로그인한 아이디, 받는사람 아이디는 수동입력 -->
		<tr><td align="center">받는사람</td>
	    	<td><%=p_email%>
	    		<input type="hidden" name="s_send" value="<%=id%>"/>
	    		<input type="hidden" name="s_receive" value="<%=p_email%>"></td>
		</tr>
	  
		<tr><td align="center">내 용</td>
		  	<td><textarea name="s_content" rows="5" cols="65" required>[<%=vo.getP_classname()%>]문의드려요! : </textarea></td>
		</tr>
	</table>
	
	<table align="center">  
		<tr><td colspan=2 align="center"> 
				<button type="submit" class="btn btn-primary">보내기</button>
				<button type="button" class="btn btn-dark" onclick="window.close()">닫기</button></td>
		</tr>
	</table>    
<%}catch(Exception e){}%>     
</form>   
</body>
</html>      
