<%-- 튜터 리스트 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hmjm.bean.admin.adminDAO"%>
<%@ page import="hmjm.bean.tutor.tutorVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	adminDAO tutor = adminDAO.getInstance();
	ArrayList<tutorVO> tlist = tutor.getAllTutor();
	int tcount = 0;
	tcount = tutor.getTutorCount();
%>
<html>
<head>
<title>admin - tutors info</title>
</head>
<body>
<h3>List of all tutors - <%=tcount%></h3>
<table border="1">
	<tr align="center">
		<td>튜터번호</td>
		<td>학교</td>
		<td>전공</td>
		<td>IDcard</td>
		<td>자격증</td>
		<td>가입일</td>
		<td>이메일</td>
		<td>닉네임</td>
		<td>관리</td>
	</tr>
	<%for(tutorVO vo : tlist){%>
		<tr><td><%=vo.getT_num()%></td>
			<td><%=vo.getT_school()%></td>
			<td><%=vo.getT_major()%>
			<td><%=vo.getT_idcard()%></td>
			<td><%=vo.getT_c()%></td>
			<td><%=vo.getT_reg()%></td>
			<td><%=vo.getT_email()%></td>
			<td><%=vo.getT_nick()%></td>
			<td>				
				<button type="button" class="btn btn-danger btn-sm"
				onclick="document.location.href='/hmjm/Admin/tutorDeletePro.jsp?t_num=<%=vo.getT_num()%>'">삭제</button>
			</td>
		</tr>
<%}%>
</table>
</body>
</html>