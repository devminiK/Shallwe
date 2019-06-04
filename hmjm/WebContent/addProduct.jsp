<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.dao.memberDAO"%>
<%@ page import="hmjm.bean.vo.memberVO"%>
<%@ page import="hmjm.bean.dao.tutorDAO"%>
<%@ page import="hmjm.bean.vo.tutorVO"%>

<%-- 19.06.04성민 작성 , 미완성, --%>
<%--

 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String preUser = (String) session.getAttribute("loginId");//현재 세션,이메일이 들어감
	//일반유저 정보
	memberDAO mdao = memberDAO.getInstance();
	memberVO mvo = mdao.getMember(preUser);
	//튜터 등록 정보, 주석풀면 에러발생. 우선 주석달아둠
	//nick값 받아오기위함
	//tutorDAO tdao = tutorDAO.getInstance();		
	//tutorVO tvo = tdao.getMember(preUser);
%>


<html>
<head>
<title>수업 등록</title>
<script language="JavaScript" src="script.js"></script>
<script>
	function div_onoff(v,id){/*라디오 버튼 value값 조건 비교*/
		if(v=="2"){
			document.getElementById(id).style.display="";//보여줌
		}else
			document.getElementById(id).style.display="none";//숨김		
	}
</script>
<style>
	 input[type=number]{
		width:80px;	
	}
</style>
</head>
<%--
	//튜터 등록을 하지않고, 접근했을 시 (튜터 정보x(세션 존재x)
	if(session.getAttribute("memId")==null){--%>
<%-- 
		<script>
			alert("튜터 기본 입력 정보에서 [휴대전화 번호], [신분/학력 인증] 정보를 먼저 등록해주세요");
			window.location='tutorRegister.jsp';
		</script>
	--%>

<%--}--%>
<%
	int num = 0; //글 순서번호
	try {
		if (request.getParameter("num") != null) {//새글일때 동작x
			num = Integer.parseInt(request.getParameter("num"));
		}
%>
<%--
 수업번호> 자동으로 값 부여p_num;
이메일> 튜터table에서 가져올것
>입력
수업명p_classname;
분류	p_category;
강사소개 p_self;
수업소개p_class;
소요시간p_time;
가격p_cost;
인원p_student;
ps글 p_memo;
private String imgsrc;	//이미지파일을 가져오기위한 변수 추가 작성
    --%>

<body>
	<b>수업등록</b>
	<br>
	<div class="container">
		<form method="post" name="writeform" action="writePro.jsp"
			onsubmit="return writeSave()">
			<%--수업 번호 자동 부여해야함 hidden--%>
			<input type="text" name="num" value="<%=num%>">

			<div>
				<label>[이름]</label><%=mvo.getM_name()%>
			</div>
			<%-- 
	<div>
		<label>닉네임</label><%=tvo.getT_nick()%>
	</div>
	--%>
			<div>
				<label>[이메일]</label><%=mvo.getM_email()%>
			</div>

			<div>
				<%--목록 그룹 --%>
				<label>수업 명</label> <input type="text" size="40" maxlength="50"
					name="p_classname" placeholder="이목을 끌 톡톡튀는 수업명을 입력하세요!">
			</div>

			<div>
				<%--목록 그룹:select로 고를 수 있도록 구현할것 --%>
				<label>카테고리(대>소)</label>
				<select id="p_category" name="p_category">
					<optgroup label="인기수업">
						<option value="archi">ㅇㅇ</option>
						<option value="computer" selected>ㅇㅇ</option>
					</optgroup>
					<optgroup label="디자인">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="실무역량">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="뷰티">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="영상">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="외국어">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="음악">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="라이프스일">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="기타">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
				</select><br />
			</div>

			<div>
				<%--목록 그룹 /rows="15" cols="100"로 설정하기--%>
				<label>강사소개</label><br>
				<textarea name="p_self" rows="3" cols="5"></textarea>
			</div>
			<div>
				<%--목록 그룹 --%>
				<h3>소개하기</h3>
				<label>튜터정보</label><br>
				<textarea name="p_class1" rows="3" cols="5"></textarea><br>
				<label>수업소개</label><br>
				<textarea name="p_class2" rows="3" cols="5"></textarea><br>
				<label>수업 대상</label><br>
				<textarea name="p_class3" rows="3" cols="5"></textarea><br>
				<label>커리큘럼</label><br>
				<textarea name="p_class4" rows="3" cols="5"></textarea>
			</div>

			<div>
				<%--목록 그룹 --%>
				<label>소요시간</label> 
				<input type="number" name="p_time" min=1>
			</div>
			<div>
				<%--목록 그룹 --%>
				<label>가격</label> 
				<input type="number" name="p_cost" step="1000" min=0>원
			</div>
			<div>
				<%--목록 그룹 --%>
				<label>인원</label><br>
				<input type="radio" name="howmany" value="1" onclick="div_onoff(this.value,'con');">1:1 강습<br>
				<input type="radio" name="howmany" value="2" onclick="div_onoff(this.value,'con');">1:N 강습
				<div id="con" style="display:none">
					최소인원: <input type="number" name="p_count_min" min=1>
					최대인원: <input type="number" name="p_count_max" min=1>
				</div>

			</div><br>
			
			<div>
				<%--목록 그룹 --%>
				<label>PS</label><br>
				<textarea name="p_memo" rows="5" cols="100"></textarea>
			</div>

			<input type="submit" value="수업 등록"> 
			<input type="reset"	value="모든 내용 취소"> 
			<input type="button" value="목록보기"	OnClick="window.location='list.jsp'">
			<%} catch (Exception e) {}%>
		</form>
	</div>
</body>
</html>
