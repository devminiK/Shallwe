<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<%@ page import="hmjm.bean.product.*"%>

<%-- 19.06.11 성민 작성 , 미완성, --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String preUser = (String) session.getAttribute("loginId");		//현재 세션,이메일 존재
	String productNum = (String)session.getAttribute("productNum");	//현재 세션, 상품번호 존재
	
	//상품 이름 가져오기.
	productDAO pdao = productDAO.getInstance();
	productVO pvo = pdao.getProduct(Integer.parseInt(productNum));
%>


<html>
<head>
<link rel="stylesheet" href="/hmjm/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>수업  시간 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	
	/*유효성 검사*/
	function writeSave() {
		var form = document.addClassTimeForm;

		if (form.ct_place.value == "") {
			alert("수업 장소를 입력하세요.");
			form.ct_place.focus();
			return false;
		}
		if (form.ct_mon.value == "") {
			alert("월요일날 가능한 시간을 입력해주세요");
			form.ct_mon.focus();
			return false;
		}
		if (form.ct_tue.value == "") {
			alert("화요일날 가능한 시간을 입력해주세요");
			form.ct_tue.focus();
			return false;
		}
		if (form.ct_wed.value == "") {
			alert("수요일날 가능한 시간을 입력해주세요");
			form.ct_wed.focus();
			return false;
		}
		if (form.ct_thu.value == "") {
			alert("목요일날 가능한 시간을 입력해주세요");
			form.ct_thu.focus();
			return false;
		}
		if (form.ct_fri.value == "") {
			alert("금요일날 가능한 시간을 입력해주세요");
			form.ct_fri.focus();
			return false;
		}
		if (form.ct_sta.value == "") {
			alert("토요일날 가능한 시간을 입력해주세요");
			form.ct_sta.focus();
			return false;
		}
		if (form.ct_sun.value == "") {
			alert("일요일날 가능한 시간을 입력해주세요");
			form.ct_sun.focus();
			return false;
		}
		if (form.ct_day.value == "") {
			alert("가능한 날짜를 입력해주세요");
			form.ct_day.focus();
			return false;
		}
		
	}

</script>

<style>
input[type=number] {
	width: 80px;
}

</style>
</head>

<body>

	<jsp:include page="/Home/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> "<%=pvo.getP_classname()%>" :수업 시간 등록</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addClassTimeForm"
			action="addClasstimePro.jsp" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">수업 장소</label>
				<div class="col-sm-3">
					<input type="text" name="p_classname" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">닉네임</label>
				<div class="col-sm-3">
					<%--tvo.getT_nick()--%>
					<input type="text" readonly name="p_nick" class="form-control"
						value="<%=tvo.getT_nick()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_email" class="form-control"
						value="<%=mvo.getM_email()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">카테고리</label>
				<div class="col-sm-3">
					<%--목록 그룹:select로 고를 수 있도록 구현할것 --%>
					<select id="p_category" name="p_category">
						<optgroup label="인기수업">
							<option value="archi">1</option>
							<option value="computer" selected>2</option>
						</optgroup>
						<optgroup label="디자인">
							<option value="history">3</option>
							<option value="lang">4</option>
						</optgroup>
						<optgroup label="실무역량">
							<option value="history">5</option>
							<option value="lang">6</option>
						</optgroup>
						<optgroup label="뷰티">
							<option value="history">7</option>
							<option value="lang">8</option>
						</optgroup>
						<optgroup label="영상">
							<option value="history">9</option>
							<option value="lang">10</option>
						</optgroup>
						<optgroup label="외국어">
							<option value="history">11</option>
							<option value="lang">12</option>
						</optgroup>
						<optgroup label="음악">
							<option value="history">13</option>
							<option value="lang">14</option>
						</optgroup>
						<optgroup label="라이프스일">
							<option value="history">15</option>
							<option value="lang">16</option>
						</optgroup>
						<optgroup label="기타">
							<option value="history">17</option>
							<option value="lang">18</option>
						</optgroup>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">강사 소개</label>
				<div class="col-sm-5">
					<textarea name="p_self" rows="2" cols="50"></textarea>
				</div>
			</div>
			<h2>강의 소개</h2>
			
			<div class="form-group row">
				<label class="col-sm-2">튜터 정보</label>
				<div class="col-sm-3">
					<textarea name="p_class1" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">수업 소개</label>
				<div class="col-sm-3">
					<textarea name="p_class2" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">수업 대상</label>
				<div class="col-sm-3">
					<textarea name="p_class3" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">커리큘럼</label>
				<div class="col-sm-3">
					<textarea name="p_class4" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">소요시간</label>
				<div class="col-sm-3">
					<input type="number" name="p_time" min=1>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="number" name="p_cost" step="1000" min=0>원
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">인원</label>
				<div class="col-sm-3">
					<input type="radio" name="howmany"
						id="oto" value="1" onclick="div_onoff(this.value,'con');">1:1강습<br> 
					<input type="radio" name="howmany" id="otm" value="2"
						onclick="div_onoff(this.value,'con');">1:N 강습<br>
					
					<div id="con" style="display: none">
						최소인원: <input type="number" name="p_count_min" min=1><br>
						최대인원: <input type="number" name="p_count_max" min=1>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">PS</label>
				<div class="col-sm-3">
					<textarea name="p_memo" rows="2" cols="50"></textarea>
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