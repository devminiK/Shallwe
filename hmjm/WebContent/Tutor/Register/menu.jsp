<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hmjm.bean.dao.*"%>
<%@ page import="hmjm.bean.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<title>튜터등록 메뉴</title>
<style>
#menu {
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}

.menu_new {
	width: 1080;
}

}
.twoButton {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400;
	hegith: 300;
	background: yellow;
	margin: -50px 0 0 -50px;
	display:table-row;
}

.eachButton {
	display:table-cell;
}
</style>
</head>


<body id="menu">
	<jsp:include page="/Home/header.jsp" />
	
	<div class="menu_new">
		<div class="twoButton">
		<%
			if (session.getAttribute("loginId") == null) {
		%>
			<script>
				alert("로그인 후 이용바랍니다.");
				window.location = '/hmjm/Log/loginForm.jsp';
			</script>

		<%
			} else {

				String m_email = (String) session.getAttribute("loginId");
				memberDAO manager = memberDAO.getInstance();
				memberVO c = manager.getMember(m_email);

				//String t_email = (String)session.getAttribute("loginId");
				//String t_email = request.getParameter((String)session.getAttribute("loginId"));
				tutorDAO vo = tutorDAO.getInstance();
				tutorVO e = vo.getMember(m_email);
		%>

		<div>
			확인용 이메일: <%=c.getM_email()%><br>
			확인용 이름:<%=c.getM_name()%><br>
			<hr>
			
				<div class="eachButton">
					<%
				if (e == null) {
			%>
			<input type="button" value="튜터등록"
				onclick="javascript:window.location='/hmjm/Tutor/tutorRegister.jsp'">


			<%
				} else {
			%>
			<input type="button" value="튜터수정"
				onclick="javascript:window.location='/hmjm/Tutor/tutorModifyForm.jsp'">


			<%}
			}%>
				</div>
				
				<div class="eachButton">
					<input type="button" value="강의등록"
				onclick="javascript:window.location='./hmjm/Home/main.jsp'">
				</div>
			</div>
		
			
			

			
		</div>
	</div>


	<jsp:include page="/Home/footer.jsp" />
</body>
</html>