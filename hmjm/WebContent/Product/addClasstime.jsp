<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<%@ page import="hmjm.bean.product.*"%>

<%-- 19.06.11 성민 작성 , 미완성, --%>

<%
	request.setCharacterEncoding("UTF-8");
	String preUser = (String) session.getAttribute("loginId");//현재 세션,이메일이 들어감
	
	
	//상품 정보
	productDAO pdao = productDAO.getInstance();

	
%>
<html>
<head>
<link rel="stylesheet" href="/hmjm/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>수업 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*모든 요소 유효성 검사*/
	function writeSave() {
		var form = document.addProductForm;

		if (form.p_classname.value == "") {
			alert("수업의 이름을 입력하십시요.");
			form.p_classname.focus();
			return false;
		}
		/*id값으로 체크 여부 확인*/
		if (document.getElementById("oto").checked != true
				&& document.getElementById("otm").checked != true) {
			alert("참여 인원에 대한 정보를 체크해주세요.");
			return false;
		}
		if (document.getElementById("otm").checked == true) {//1:N 체크되었을때
			if (form.p_count_min.value == "") {
				alert("수업에 참여가능한 최소 인원을 지정해주세요.");
				form.p_count_min.focus();
				return false;
			}
			if (form.p_count_max.value == "") {
				alert("수업에 참여가능한 최대 인원을 지정해주세요.");
				form.p_count_max.focus();
				return false;
			}
		}
	}

</script>

<body>

	<jsp:include page="/Home/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">수업 시간 등록</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addProductForm"
			action="addProductPro.jsp" onsubmit="return writeSave()">
			<div class="form-group row">
				<label class="col-sm-2">수업제목</label>
				<div class="col-sm-3">
					<input type="text" name="p_classname" class="form-control" value="<%=p_classname%>">
				</div>
			</div>


			
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="수업 등록">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="모든 내용 취소"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="목록보기" OnClick="window.location='list.jsp'">
				</div>
			</div>
	</form>
		
	</div>
	
		<jsp:include page="/Home/footer.jsp" />
	
</body>
</html>
