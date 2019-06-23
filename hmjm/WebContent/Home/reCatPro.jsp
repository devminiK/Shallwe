<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.*"%>
<%@ page import="hmjm.bean.product.productDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%--06.17 성민 작성 --%>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.buttonload {
	background-color: #4CAF50; /* Green background */
	border: none; /* Remove borders */
	color: white; /* White text */
	padding: 12px 24px; /* Some padding */
	font-size: 16px; /* Set a font-size */
}

/* Add a right margin to each icon */
.fa {
	margin-left: -12px;
	margin-right: 8px;
}

div {
	margin-top: 300px;
	text-align: center;
}
</style>
</head>
<%
	String[] values = request.getParameterValues("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	productDAO pdao = productDAO.getInstance();
	String plus = "reNum=";

	for (String val : values) {
		//out.print("선택한 지역 번호: ["+val+"]");
		plus += val + ",";
	}
	//System.out.println("[reCatPro.jsp]cateSubRegion.jsp?" + plus + "로 이동한다.");
%>
<body>

	<div>
		<h2>해당 지역의 상품을 검색중입니다.잠시만 기다려주세요 :)</h2>
		<button class="buttonload">
			<i class="fa fa-refresh fa-spin"></i>Loading
		</button>
	</div>

</body>
<%-- <a href="/hmjm/Home/cateSubRegion.jsp?<%=plus%>">링크일단</a>--%>
<META http-equiv="Refresh"
	content="0; URL=/hmjm/Home/cateSubRegion.jsp?<%=plus%>" />
</html>


