<%-- 전체 게시글, 리뷰, 회원관리 페이지로 연결--%>
<%-- memberList, productList로 링크 또는 출력 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("loginId");
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Admin Main</title>
</head>

<body>
<jsp:include page="/SideMenu/sideMenu.jsp"/>
<%if(id.equals("admin")){ %>
<h1>Welcome Admin</h1>
<button type="button" class="btn btn-success" onclick="window.location='/hmjm/Home/main.jsp'">Home</button>
<button type="button" class="btn btn-warning" onClick="window.open('/hmjm/Message/msg.jsp','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=620,height=600')">
	Message</button>
<button type="button" class="btn btn-danger" onclick="document.location.href='/hmjm/Admin/adminLogout.jsp'">로그아웃</button>
<hr/>

<%-- 회원 목록/수정/탈퇴/삭제 --%>
<jsp:include page="memberList.jsp"/>
<hr/>

<%-- 상품 목록/수정/삭제/작성? --%>
<jsp:include page="productList.jsp"/>
<hr/>

<%-- 쪽지목록 넣을까말까 --%>
<jsp:include page="messageList.jsp"/>

<%}else{ %>
	<script>
		alert("누구세요");
		window.location="/hmjm/Home/main.jsp";
	</script>
<%} %>
</body>
</html>
