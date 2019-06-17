<!-- 전체 게시글, 리뷰, 회원관리 페이지로 연결-->
<!-- memberList, productList로 링크 또는 출력 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("loginId");
%>
<html>
<head>
<title>Admin Main</title>
</head>
<body>
<%if(id.equals("admin")){ %>
<h1>Welcome Admin</h1>
<input type="button" value="Home" onclick="document.location.href='/hmjm/Home/main.jsp'"/>
<input type="button" value="Admin Logout" onclick="document.location.href='/hmjm/Admin/adminLogout.jsp'"/>
<hr/>
<!-- 회원 목록/수정/탈퇴/삭제 -->
<jsp:include page="memberList.jsp"/>
<hr/>
<!-- 상품 목록/수정/삭제/작성? -->
<jsp:include page="productList.jsp"/>
<hr/>
<!-- 쪽지목록 넣을까말까 -->
<jsp:include page="messageList.jsp"/>
<%}else{ %>
	<script>
		alert("누구세요");
	</script>
<%} %>
</body>
</html>
