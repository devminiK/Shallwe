<!-- 회원 목록 조회, 수정, 삭제, 탈퇴 등 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.member.memberVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
    adminDAO member = adminDAO.getInstance();
	ArrayList<memberVO> mlist = member.getAllMember();
%>
<html>
<head>
<title>admin - members info</title>
</head>
<body>
<!-- db에서 전체 회원 목록 조회 -->
<!-- 회원정보 수정, 탈퇴, 삭제 가능 -->
<table border="1">
	<tr align="center">
		<td>회원번호</td>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>유저타입</td>
		<td>가입일</td>
		<td>관리</td>
	</tr>
<%for(memberVO vo : mlist){%>
	<tr><td><%=vo.getM_num()%></td>
		<td><%=vo.getM_email()%></td>
		<td><%=vo.getM_pw()%>
		<td><%=vo.getM_name()%></td>
		<td><%=vo.getM_usertype()%></td>
		<td><%=vo.getM_reg()%></td>
		<td><input type="button" name="edit" value="정보수정" 
			onclick="document.location.href='/hmjm/Admin/memberEditForm.jsp?m_num=<%=vo.getM_num()%>'"/>
			<input type="button" name="zero" value="탈퇴"
			onclick="document.location.href='/hmjm/Admin/memberZeroPro.jsp?num=<%=vo.getM_num()%>'"/>
			<input type="button" name="delete" value="계정삭제"
			onclick="document.location.href='/hmjm/Admin/memberDeletePro.jsp?num=<%=vo.getM_num()%>'"/>
		</td>
	</tr>
		
<%}%>
</table>
</body>
</html>