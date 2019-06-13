<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.product.*" %>
<!DOCTYPE html>
<html>
<head>
<title>내 수업</title>
<style>
	.top{
		background-color:#FF007F;
		margin: 0 auto;
		padding: 15px;
		
	}
	.row{
		width: 100%;
		display:table;
	}
	.rowele1{
		background-color: white;
		display: table-cell;
		width: 50%;
		padding: 50px 20px;	
		text-align:center;	
	}
	.rowele2{
		background-color: #D5D5D5;
		display: table-cell;
		width: 50%;
		padding: 50px 20px;	
		text-align:center;			
	}
	.btntxt{
		text-decoration:none;
		font-weight:bold;
	}

	span{
		color:white;
		font-size:15px;
	}
	
</style>
</head>
<%
		int num = Integer.parseInt(request.getParameter("p_num"));
		//String id = (String) session.getAttribute("loginId");
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);

%>
<body>
	<jsp:include page="/Home/header.jsp"/>
	<jsp:include page="nav_top.jsp" />
	<div class="content">
		 <div class="top" >
			
			<span>내가 등록한 수업들</span><br>
			<span onclick="javascript:window.close();">페이지 닫기</span>
		</div>
		<div class="row" >
			<div class="rowele1 btntxt">테스트용</div>
			<div class="rowele2 btntxt">????</div>
		</div>
		<div class="bottom" align="center">
			<%--내가 등록한 수업을 보여준다 --%>
			
			강의제목:::::::: <%=vo.getP_classname() %><br>
			강사소개:::::::: <%=vo.getP_self() %><br>
			카테고리:::::::: <%=vo.getP_category() %><br>
		</div>
	</div>
	<jsp:include page="/Home/footer.jsp" />
</body>
</html>