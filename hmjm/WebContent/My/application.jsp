<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--https://taling.me/My/Application --%>
<!DOCTYPE html>
<html>
<head>
<title>내가 등록한 재능</title>
<style>

#ft_position {
   left: 0;
   bottom: 0;
   width: 100%;
   color: black;
}
#main{
	width:1200px;
	margin:0 auto;
}

</style>
</head>
<body id="main">
	<jsp:include page="/Home/header.jsp"/><br>
	<jsp:include page="nav_top.jsp" />
	
	<div class="container" >	
	</div>
	
	<div id="ft_position">
		<jsp:include page="/Home/footer.jsp" />
	</div>
</body>
</html>