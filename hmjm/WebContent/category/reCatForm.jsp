<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.classtimeDAO"%>
<%@ page import="hmjm.bean.product.*"%>

<%--06.17 성민 작성 --%>
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("UTF-8");

	//지역별 카테고리 갯수를 가져오기위해함
	classtimeDAO ctdao = classtimeDAO.getInstance();
%>
<head>
<title>지역별 카테고리 검색</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
#reCatForm {
	margin: 0 auto;
}

#recat_new {
	background-color: #EEEEEE;
	width: 100%;
	height: 270px;
}

#items {
	position: absolute;
	left: 20%;
}

#row {
	display: table-row;
	width: 100%;
	height: 30%;
}

#boxl {
	display: table-cell;
	padding: 20px;
	width: 35%;
}

#boxr {
	display: table-cell;
	padding: 20px;
	width: 65%;
}

#bottom {
	margin-top: 10px;
	float: right;
}

.icon {
	width: 25px;
	margin: 3px;
}

table {
	width: 100%;
	hegith: 250px;
}

td {
	padding: 10px;
	text-align: center;
	font-weight: bold;
}

p {
	margin: 20px 0px;
}
</style>

</head>

<body id="reCatForm">
	<div id="recat_new">
		<div id="items">
			<div id="row">
				<div id="boxl">
					<h2>
						어디에서 <img class="icon" src="/hmjm/Images/Icon/mapmark.png" />
					</h2>
					<h2>배우고 싶으세요?</h2>
					<h4>지역을 선택해주세요</h4>
				</div>
				<div id="boxr">
					<form action="reCatPro.jsp" method="get">
						<table border=1>
							<tr>
								<%-- <div class="btn-group-toggle" data-toggle="buttons">--%>
								<td><label class="btn btn-primary"> <input
										type="checkbox" name="reNum" value="101"><span>강남(<%=ctdao.getRegionCount("101")%>)
									</span>
								</label></td>
								<td><label class="btn btn-primary"> <input
										type="checkbox" name="reNum" value="102"><span>신촌홍대(<%=ctdao.getRegionCount("102")%>)
									</span>
								</label></td>
								<td><label class="btn btn-primary"> <input
										type="checkbox" name="reNum" value="103"><span>건대(<%=ctdao.getRegionCount("103")%>)
									</span></label></td>
							</tr>
							<tr>
								<td><label class="btn btn-primary"> <input
										type="checkbox" name="reNum" value="201"><span>수원(<%=ctdao.getRegionCount("201")%>)
									</span></label></td>
								<td><label class="btn btn-primary"> <input
										type="checkbox" name="reNum" value="202"><span>분당(<%=ctdao.getRegionCount("202")%>)
									</span></label></td>
								<td><div class="btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-primary"> <input type="checkbox"
											name="reNum" value="203"><span>죽전(<%=ctdao.getRegionCount("203")%>)
										</span></label>
									</div></td>
							</tr>
							<tr>
								<td><div class="btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-primary"> <input type="checkbox"
											name="reNum" value="301"><span>부산서면(<%=ctdao.getRegionCount("301")%>)
										</span></label>
									</div></td>
								<td><div class="btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-primary"> <input type="checkbox"
											name="reNum" value="302"><span>부산해운대(<%=ctdao.getRegionCount("302")%>)
										</span></label>
									</div></td>
								<td><div class="btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-primary"> <input type="checkbox"
											name="reNum" value="303"><span>부산사상(<%=ctdao.getRegionCount("303")%>)
										</span></label>
									</div></td>
							</tr>
						</table>
						<div id="bottom">
							<input type="submit" class="btn btn-danger" value="선택지역 결과 보기">
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>