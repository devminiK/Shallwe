<!-- 전체 게시글, 리뷰, 회원관리 페이지로 연결-->
<!-- memberList, productList로 링크 또는 출력 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Admin Main</title>
</head>
<body>
<h1>Welcome Admin</h1>
<hr/>
<!-- 회원 목록/수정/탈퇴/삭제 -->
<jsp:include page="memberList.jsp"/>
<hr/>
<!-- 상품 목록/수정/삭제/작성? -->
<jsp:include page="productList.jsp"/>
<hr/>
<!-- 쪽지목록 넣을까말까 -->
<jsp:include page="messageList.jsp"/>

</body>
</html>