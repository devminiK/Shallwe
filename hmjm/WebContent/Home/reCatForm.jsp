<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classtime.classtimeDAO"%>
<%@ page import="hmjm.bean.product.*"%>
<%--06.17 성민 작성 --%>
<%--등록상품 리셋할경우, DB:product, classimg, classtime 모두 리셋해야함, 그렇지 않으면 nullpointerEeception --%>
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("UTF-8");
	//지역별 카테고리 갯수를 가져오기위해함
	classtimeDAO ctdao = classtimeDAO.getInstance();
%>
<head>
<title>지역별 카테고리 검색</title>
<%-- <link rel="stylesheet" href="/css/bootstrap.min.css" />--%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script language="javascript" type="text/javascript">
	/*유효성 검사*/
	function chSave() {
		var chk_obj = document.getElementsByName("reNum");
		var chk_leng = chk_obj.length;
		var checked = 0;

		for (i = 0; i < chk_leng; i++) {
			if (chk_obj[i].checked == true)
				checked += 1;
		}
		if (checked < 1) {
			alert("하나이상의 지역을 선택해주세요");
			return false;
		}
	}
</script>
<style>
#reCatForm {
	width: 1200px;
	margin:0 auto;
}

#recat_new {
	background-color: #EEEEEE;
	width: 1200px;
	height: 275px;/*form을 감싸는 배경색*/
	margin: auto auto;
}

#items {
	position: absolute;
	left: 20%;
}

#row {
	display: table-row;
	width: 100%;
	height: 30%;
	margin-left: auto;
	margin-right: auto;
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

#bot_btn {
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

</style>

</head>

<body id="reCatForm">
	<div id="recat_new">
		<div id="items">
			<div id="row">
				<div id="boxl">
					<h2>어디에서 <img class="icon" src="/hmjm/Images/Icon/mapmark.png" /></h2>
					<h2>배우고 싶으세요?</h2>
					<h4>지역을 선택해주세요</h4>
				</div>
				<div id="boxr">
					<form action="reCatPro.jsp" method="get"
						onsubmit="return chSave();">
						<table border=2>
							<tr>
								<td><label class="btn btn-primary"> <input type="checkbox" name="reNum" value="101" />
									<span>강남(<%=ctdao.getRegionCount("101")%>)</span>
									</label>
								</td>
								<td><label class="btn btn-primary"><input type="checkbox" name="reNum" value="102" />
									<span>신촌홍대(<%=ctdao.getRegionCount("102")%>)</span>
									</label>
								</td>
								<td><label class="btn btn-primary"> 
									<input type="checkbox" name="reNum" value="103" />
									<span>건대(<%=ctdao.getRegionCount("103")%>)</span>
									</label>
								</td>
							</tr>
							<tr>
								<td><label class="btn btn-primary"> 
									<input type="checkbox" name="reNum" value="201" />
									<span>수원(<%=ctdao.getRegionCount("201")%>)</span>
									</label>
								</td>
								<td><label class="btn btn-primary">
								    <input type="checkbox" name="reNum" value="202" />
								    <span>분당(<%=ctdao.getRegionCount("202")%>)</span>
								    </label>
								</td>
								<td><label class="btn btn-primary"> 
									<input type="checkbox" name="reNum" value="203" />
									<span>죽전(<%=ctdao.getRegionCount("203")%>)</span>
									</label>
								</td>
							</tr>
							<tr>
								<td><label class="btn btn-primary"> 
									<input	type="checkbox" name="reNum" value="301" />
									<span>부산서면(<%=ctdao.getRegionCount("301")%>)</span>
									</label>
								</td>
								<td><label class="btn btn-primary"> 
									<input type="checkbox" name="reNum" value="302" />
									<span>부산해운대(<%=ctdao.getRegionCount("302")%>)</span>
									</label>
								</td>
								<td><label class="btn btn-primary"> 
									<input type="checkbox" name="reNum" value="303" />
									<span>부산사상(<%=ctdao.getRegionCount("303")%>)</span>
									</label>
								</td>
							</tr>
						</table>
						<div id="bot_btn">
							<input type="submit" class="btn btn-danger" value="선택지역 결과 보기" />
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>