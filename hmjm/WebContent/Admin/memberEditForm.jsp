<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.member.memberVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>admin - member info edit</title>
</head>
<body>
	<script type="text/javascript"></script>

<%	
	int num = Integer.parseInt(request.getParameter("m_num"));
	adminDAO edit = adminDAO.getInstance();
	memberVO c = edit.getMember(num);
%>

<form action ="/hmjm/Admin/memberEditPro.jsp" name="AME" method="post" align ="center">
<table width ="550" align ="center">
	<tr height ="80" bgcolor ="333F48">
		<th colspan ="3"><font color ="white">관리자 - 회원정보 수정</th>
	</tr>
	<tr height ="50">
		<th>이메일</th>
		<th><input type="text" autofosus name="m_email" value="<%=c.getM_email()%>"></th>
	</tr>
	<tr height ="50">
		<th>이 름</th>
		<th><input type="text" name="m_name" value="<%=c.getM_name()%>"></th>
	</tr>
	<tr height ="50">
		<th>전화번호</th>
		<th><input type="text" name="m_phone" value="<%=c.getM_phone()%>"></th>
	</tr>
	<tr height ="50">
		<th>비밀번호</th>
		<th><input type ="password" name ="m_pw" value="<%=c.getM_pw()%>"></th>
	</tr>
	<tr height ="50">
		<th>유저타입</th>
		<th><input type ="text" name ="m_usertype" value="<%=c.getM_usertype()%>"></th>
	</tr>
 </table><br>
	<input type ="submit" name="modify" value ="회원정보 수정"/>
	<input type ="button" value ="취소" onclick="document.location.href='/hmjm/Admin/memberList.jsp'"/>

</form>


</body>
</html>