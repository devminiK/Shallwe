<!-- 회원 목록 조회, 수정, 삭제, 탈퇴 -->
<!-- 탈퇴는 usertype: 0 -->
<!-- 삭제는 db에서 계정 삭제 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.member.memberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
    adminDAO member = adminDAO.getInstance();
	ArrayList<memberVO> mlist = member.getAllMember();
	int mcount = 0;
	mcount = member.getMemberCount();
%>
<html>
<head>
<title>admin - members info</title>
</head>
<body>
<h3>List of all members - <%=mcount%></h3>
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
			<td><input type="button" name="edit" value="수정" 
				onclick="document.location.href='/hmjm/Admin/memberEditForm.jsp?m_num=<%=vo.getM_num()%>'"/>
				
				<input type="button" name="zero" value="탈퇴"
				onclick="document.location.href='/hmjm/Admin/memberZeroPro.jsp?m_num=<%=vo.getM_num()%>'"/>
				
				<input type="button" name="delete" value="삭제"
				onclick="document.location.href='/hmjm/Admin/memberDeletePro.jsp?m_num=<%=vo.getM_num()%>'"/>
			</td>
		</tr>
<%}%>
</table>
</body>
</html>