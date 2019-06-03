<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.dao.memberDAO" %>
<%@ page import="hmjm.bean.vo.memberVO" %>
<%@ page import="hmjm.bean.dao.tutorDAO" %>
<%@ page import="hmjm.bean.vo.tutorVO" %>

<%-- 19.06.03성민 작성 , 미완성, --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String preUser = (String)session.getAttribute("loginId");//현재 세션,이메일이 들어감

	//일반유저 정보
	memberDAO mdao = memberDAO.getInstance();	
	memberVO mvo = mdao.getMember(preUser);	
	
	//튜터 등록 정보
	//nick값 받아오기위함
	tutorDAO tdao = tutorDAO.getInstance();		
	tutorVO tvo = tdao.getMember(preUser);
%>


<html>
<head>
<title>수업 등록</title>
<script language="JavaScript" src="script.js"></script>
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
	<form method="post" name="writeform" action="writePro.jsp"
		onsubmit="return writeSave()">
		<%--수업 번호 자동 부여해야함 --%>
		<input type="hidden" name="num" value="<%=num%>">
 
	<div>
		<label>이름</label><%=mvo.getM_name() %>
	</div>
	<div>
		<label>닉네임</label><%=tvo.getT_nick()%>
	</div>
	<div>
		<label>이메일</label><%=mvo.getM_email() %>
	</div>

		<div>
			<%--목록 그룹 --%>
			<label>수업 명</label> <input type="text" size="40" maxlength="50"
				name="p_classname" placeholder="이목을 끌 톡톡튀는 수업명을 입력하세요!">

		</div>
		<%--select로 고를 수 있도록 구현할것 --%>
		<div>
			<%--목록 그룹 --%>
			<label>대분류 & 소분류</label> <input type="text" size="40" maxlength="30"
				name="p_category">
		</div>
		<div>
			<%--목록 그룹 --%>
			<label>강사소개</label>
			<textarea name="p_self" rows="15" cols="100"></textarea>
		</div>
		<div>
			<%--목록 그룹 --%>
			<label>수업소개</label>
			<textarea name="p_class" rows="15" cols="100"></textarea>
		</div>

		<div>
			<%--목록 그룹 --%>
			<label>소요시간</label> <input type="text" size="40" maxlength="30"
				name="p_time">
		</div>
		<div>
			<%--목록 그룹 --%>
			<label>가격</label> <input type="text" size="40" maxlength="30"
				name="p_cost">
		</div>
		<div>
			<%--목록 그룹 --%>
			<label>인원</label> <input type="text" size="40" maxlength="30"
				name="p_student">
		</div>
		<div>
			<%--목록 그룹 --%>
			<label>PS</label>
			<textarea name="p_memo" rows="5" cols="100"></textarea>
		</div>

		<input type="submit" value="수업 등록"> <input type="reset"
			value="모든 내용 취소"> <input type="button" value="목록보기"
			OnClick="window.location='list.jsp'">

		<%
			} catch (Exception e) {
			}
		%>
	</form>
</body>
</html>
