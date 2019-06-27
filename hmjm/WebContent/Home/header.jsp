<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.tutor.*"%>

<%--성민 작성 --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>HEADER</title>
<style>
/*#header{box-sizing: border-box;}*/
#header {
	width: 100%;
	height:100%;
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}

.header_new {
	width: 1000px;
	margin: 0 auto; /*중간으로 배열하기위한값을 줌*/
}

/* 좌측 아이콘 */
.hd_icon img {
	float: left;
	width: 140px; /*제대로 된 로고 넣으면 조정할것*/
	cursor: pointer;
	/*가운데 정렬*/
	margin-left:auto;
	margin-right:auto;
}

.category {
	display: table;
    /*border:1px solid #000;  */
	text-align:center;
	float:right;
	
	
}
.inner_category{
	display: table-cell;
    vertical-align: middle;
    margin: 0 auto;
}

.category a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	/*padding-top: 20px;*/
	padding-right: 18px;
	margin-top:10px;
	margin-left: 10px; /*글자 사이간격*/
	text-decoration: none;
	font-size: 15px;
	font-weight: bold;
}

.category a:hover {
	color: gray;
	text-decoration: none;
	
}

#selfImg {
	border-radius: 50%;
	width:40px;
	height:40px;
	margin:0 auto; 
}

/********************************************SEPARATE***********/
* {
	box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.hd_column1 {
	float: left;
	width: 15%;
	padding: 7px;
	height: 55px; /* Should be removed. Only for demonstration */
}

.hd_column2 {
	float: left;
	width: 42%;
	padding: 7px;
	height: 55px; /* Should be removed. Only for demonstration */
}

.hd_column3 {
	float: left;
	width: 43%;
	padding: 7px;
	height: 55px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/*********************************************SEARCH INPUT************/
@import
	url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');

/* Base styling */
.search_body {
	width: 430px;
	@import
	url("https://fonts.googleapis.com/css?family=Raleway:400,700,900");
	margin : 0 auto;
  	font-family	:'Raleway',sans-serif;
}

.search__input {
	width: 100%; /*검색 창 길이*/
	padding: 12px 24px; /*검색 입력 값 안의 padding*/
	background-color: transparent;
	transition: transform 250ms ease-in-out;
	font-size: 11px;
	line-height: 18px;
	color: #575756;
	background-color: transparent;
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-size: 18px 18px;
	background-position: 95% center;
	border-radius: 50px;
	border: 3px solid pink;
	transition: all 250ms ease-in-out;
	backface-visibility: hidden;
	transform-style: preserve-3d;
}

.search__input::placeholder {
	color: rgba(87, 87, 86, 0.8);
	/* text-transform: uppercase;*/
	letter-spacing: 1.5px;
}

.search__input:hover, .search__input:focus {
	padding: 12px 0;
	outline: 0;
	border: 1px solid transparent;
	border-bottom: 2px solid pink;
	border-radius: 0;
	background-position: 100% center;
}
</style>
<script type="text/javascript">
	function openRealtimetalk() {
		url = "/hmjm/Message/msg.jsp";
		//새로운 윈도우로 열기
		open(url,"qnatutee","toolbar=no,location=no,status=no,menubar=no,resizable=no,location=no,directories=no,width=650,height=660");
	}
	
	function searchCheck() {
		var str = document.getElementById('search');
		var blank = /^[\s]/g;

		//검색어 입력필수
		if (str.value == '' || str.value == null) {
			alert("검색어를 입력하세요.");
			return false;
		}

		//공백금지
		if (blank.test(str.value) == true) {
			alert("제대로 좀 입력하세요.")
			return false;
		}
	}
</script>
</head>
<%
	String loginbarName; //로그인바	
	String logURL;

	String statebarName; //로그인 여부에 따른 상태바
	String stateURL;

	if (session.getAttribute("loginId") == null) {
		loginbarName = "로그인";
		logURL = "/hmjm/Log/loginForm.jsp";

		statebarName = "회원가입";
		stateURL = "/hmjm/Register/register.jsp";
	} else {
		loginbarName = "쪽지"; //로그아웃기능은, 수업신청서안에서 사용할것_by.sm
		logURL = "/hmjm/Message/msg.jsp";

		statebarName = "수업신청서";
		stateURL = "/hmjm/My/application.jsp";
	}
	String preUser = (String) session.getAttribute("loginId");//이메일 값
	tutorDAO vo = tutorDAO.getInstance();
	tutorVO e = vo.getMember(preUser);
%>
<body id="header">
	<div class="header_new">
		<div class="row">
			<div class="hd_column1">
				<div class="hd_icon">
					<a href="/hmjm/Home/main.jsp">
					<img src="/hmjm/Images/Icon/shallwe_logo.png" /></a>
				</div>
			</div>
			<div class="hd_column2">
				<div class=".search_body">
					<form name="searchBar" action="/hmjm/Home/search.jsp"
						onSubmit="return searchCheck();">
						<input type="text" name="search" id="search" class="search__input"
							placeholder="배우고싶은 수업 또는 튜터를 검색해보세요!">
					</form>
				</div>

			</div>
			<div class="hd_column3">
				<div class="category">
					<div class="inner_category">
						<% if (session.getAttribute("loginId") != null) {%>
							<a href="/hmjm/Log/logout.jsp">로그아웃</a>
						<%}%>
					</div>
					
					<div class="inner_category">
						<a href="/hmjm/Tutor/Register/menu.jsp">튜터등록</a>
					</div>
					
					<div class="inner_category">
						<a href="<%=stateURL%>"><%=statebarName%></a>
					</div>
					
					<% if (session.getAttribute("loginId") == null) {%>
						<div class="inner_category">
							<a href="<%=logURL%>"><%=loginbarName%></a>
						</div>
					<%} else {%>
						<div class="inner_category">
							<a href="" onclick="openRealtimetalk()"><%=loginbarName%></a> 
						</div> 
						<%if (e == null) {%> 
							<%--등록한 이미지사진 불러오기 --%> 
							<div class="inner_category">
								<a href="/hmjm/My/application.jsp">
								<img src="/hmjm/Images/TutorImg/user.png" width="40px" />
								</a>
							</div>
						<%} else {%>
							<%--등록한 이미지사진 불러오기 --%>
							<div class="inner_category">
								<a href="/hmjm/My/application.jsp">
								<img id="selfImg" src="/hmjm/Images/TutorImg/<%=e.getT_selfimg()%>"/>
								</a>
							</div>
						<%}
					}%>
				</div>
			</div>
			
		</div>
	</div>

</body>
</html>