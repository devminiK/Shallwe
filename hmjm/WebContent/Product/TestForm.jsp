<%@ page contentType="text/html; charset=utf-8"%>

<%-- 19.06.11성민 작성 --%>
<%
	request.setCharacterEncoding("UTF-8");
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
		}else{//1:1체크되었을때..진행중2019.06.11
		}
	}

	/*라디오 버튼 value값 조건비교로, 보여주기/숨김*/
	function divChoice(v, id) {
		if (v == "1")
			document.getElementById(id).style.display = "none";//숨김		
		else
			document.getElementById(id).style.display = "";//보여줌
			
	}
	
	
</script>

<style>
input[type=number] {
	width: 80px;
}

</style>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">수업 등록</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addProductForm"
			action="TestPro.jsp" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">인원</label>
				<div class="col-sm-3">
					<input type="radio" name="howMany"
						id="oto" value="1" onclick="divChoice(this.value,'con');">1:1강습<br> 
						
					<input type="radio" name="howMany"
						id="otm" value="2"	onclick="divChoice(this.value,'con');">1:N 강습<br>
					
					<div id="con" style="display: none">
						최소인원: <input type="number" name="count_min" min=1><br>
						최대인원: <input type="number" name="count_max" min=1>
					</div>
					
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="등록하기">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="리셋">
				</div>
			</div>
	</form>
		
	</div>
</body>
</html>
