<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.message.messageVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
    adminDAO msg= adminDAO.getInstance();
	ArrayList<messageVO> slist = msg.getAllMsg();
	int scount = 0;
	scount = msg.getMsgCount();
%>
<html>
<head>
<title>admin - all messages list</title>
</head>
<body>
<h3>List of all messages- <%=scount%></h3>
<table border="1">
	<tr align="center">
		<td>num</td>
		<td>from</td>
		<td>to</td>
		<td>content</td>
		<td>time</td>
		<td>관리</td>
	</tr>
	<%for(messageVO vo : slist){%>
		<tr><td><%=vo.getS_num()%></td>
			<td><%=vo.getS_send()%></td>
			<td><%=vo.getS_receive()%>
			<td><%=vo.getS_content()%></td>
			<td><%=vo.getS_reg()%></td>
			<td><input type="button" name="delete" value="삭제"
				onclick="document.location.href='/hmjm/Admin/messageDeletePro.jsp?s_num=<%=vo.getS_num()%>'"/>
			</td>
		</tr>
<%}%>
</table>
</body>
</html>



