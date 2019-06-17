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
<title>수업 시간 등록</title>
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
		if(form.ct_mon.value == ""
				&& form.ct_tue.value == ""
				&& form.ct_wed.value == ""
				&& form.ct_thu.value == ""
				&& form.ct_fri.value == ""
				&& form.ct_sta.value == ""
				&& form.ct_sun.value == ""){
			alert("적어도 하나의 요일별 시간을 입력해야합니다.");
			form.ct_mon.focus();
			return false;		
		}
		/*
		if (form.ct_day.value == "") {
			alert("가능한 날짜를 입력해주세요");
			form.ct_day.focus();
			return false;
		}
		*/

	}
	
	/*지역별 카테고리 정하기*/
	function regionCategory(r){
		//대분류 > 소분류 지역 이름
		var regName_a = ["강남","신촌홍대","건대"]
		var regName_b = ["수원","분당","죽전"]
		var regName_c = ["부산서면","부산해운대","부산사상"]
		
		// 지역에 따른따른 value값
		var regNum_a = ["1","2","3"]
		var regNum_b = ["11","12","13"]
		var regNum_c = ["21","22","23"]
		
					/* 	,"분당","성북","영등포","온라인",
						  "목동","부평","마포","혜화",
						  "일산","용산","구로","노원",
						  "대구중앙","부산서면","왕십리","부산해운대",
						  "의정부","신사","구월동","동작",
						  "회기","계양","수유","부산대",
						  "송도","충무로","부산부경대","대전역",
						  "부산동래","전주","부산사상","서현",
						  "제주","청주","전남대","천안",
						  "청량리","은평","미아","창원"  */

		var target = document.getElementById("ct_place");
		var rname ='';
		var rnum = 0;
		
		  if(r.value == "a") {
			  rname = regName_a;		
			  rnum = regNum_a;
		}
		  else if(r.value == "b"){
			  rname = regName_b;
			  rnum = regNum_b;
			}
			else if(r.value == "c"){
			  rname = regName_c;
			  rnum = regNum_c;
			}
		  target.options.length = 0;
		 
		  for (x in rname&&rnum ) {
		    var opt = document.createElement("option");
		    opt.value = rnum[x];
		    opt.innerHTML = rname[x];
		    target.appendChild(opt);
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
			<h1 class="display-3">
				"<%=pvo.getP_classname()%>" :수업 시간 등록
			</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addClassTimeForm"
			action="addClasstimePro.jsp" onsubmit="return writeSave()">

			<input type="hidden" name="ct_classnum" value="<%=productNum %>" />



			<div class="form-group row">
				<label class="col-sm-2">지역 별 카테고리</label> <select
					onchange="regionCategory(this)">
					<option>지역을 선택해주세요</option>
					<option value="a">서울특별시</option>
					<option value="b">경기도</option>
					<option value="c">부산</option>
				</select> <select id="ct_place" name="ct_place">
					<option value="" name="ct_place">세부 지역을 선택해주세요</option>
				</select>
			</div>

			<%----- --%>
			<div class="form-group row">
				<label class="col-sm-2">월</label>
				<div class="col-sm-3">
					<input type="text" name="ct_mon" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">화</label>
				<div class="col-sm-3">
					<input type="text" name="ct_tue" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">수</label>
				<div class="col-sm-3">
					<input type="text" name="ct_wed" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">목</label>
				<div class="col-sm-3">
					<input type="text" name="ct_thu" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">금</label>
				<div class="col-sm-3">
					<input type="text" name="ct_fri" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">토</label>
				<div class="col-sm-3">
					<input type="text" name="ct_sta" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">일</label>
				<div class="col-sm-3">
					<input type="text" name="ct_sun" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">날짜</label>
				<div class="col-sm-3">
					<input type="date" name="ct_day" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="다음으로">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="모든 내용 취소">
				</div>
			</div>
		</form>

	</div>

	<jsp:include page="/Home/footer.jsp" />
</body>
</html>