<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<form method="POST" name="MsgDelForm" action="/hmjm/Message/messageDeletePro.jsp?num=<%=num%>">
<form method="POST" name="MsgDelForm" action="/hmjm/Message/messageDeletePro.jsp?pageNum=<%=pageNum%>">
	<table>
		<tr><td>쪽지를 삭제하시겠습니까?
				<input type="hidden" name="s_num" value="<%=num%>">
			</td></tr>
			
		<tr><td><button type="submit" class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-dark" onclick="document.location.href='/hmjm/Message/message.jsp'">돌아가기</button>
      		</td></tr>    
	</table>
</form>