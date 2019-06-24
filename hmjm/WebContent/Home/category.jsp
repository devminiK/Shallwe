<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
#cate {
    height:180px;/*160px보다 작으면 border 가려짐*/
	width:90%;
}

/*전체 nav bar*/
.navbar {
	width: 900px;
	height: 180px;
	margin: 0 auto;/*가운데 정렬*/
	overflow: hidden;
	background-color: white; /*white*/
}

.navbar a { /*havor하면 나오는 링크*/
	float: left;
	font-size: 14px;
	color: black; /*??*/
	padding: 13px 10px;
	text-decoration: none;
}

.subnav {
	float: left;
	overflow: hidden;
}

.subnav .subnavbtn {
	font-size: 15px;
	border: none;
	outline: none;
	color: black;
	padding: 10px 10px;
	background-color: inherit;
	font-family: inherit;
	font-weight: bold;
	margin: 0;
}

.subnavbtn:hover { /*border때문에 글씨가 살짝 내려감_ok*/
	border-top: 1.5px solid black;
	border-right: 1.5px solid black;
	border-left: 1.5px solid black;
	border-bottom: 1.5px solid black;
}

.subnav-content {/*hovor cont*/
	display: none;
	position: absolute;
	left: 0;
	background-color: white;
	width: 80%;/*border안잘리도록*/
	height:10p%;
	z-index: 1;
	background-color:white;
	margin:0;
}

.subnav-content a {
	float: left;
	color: black;
	text-decoration: none;
}

.subnav-content a:hover {
	color: gray;
	text-decoration: none;
}

.subnav-content:hover { /*위아래가 이어져야함*/
	border-top: 1.5px solid black;
	border-right: 1.5px solid black;
	border-left: 1.5px solid black;
	border-bottom: 1.5px solid black;
}

.subnav:hover .subnav-content {
	display: block;
}

</style>
</head>
<body id="cate">

	<div class="navbar">
		<div class="subnav">
			<button class="subnavbtn">
				디자인 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a href="/hmjm/Home/cateSub.jsp?c_code=101">포토샵</a></span> <span><a
					href="/hmjm/Home/cateSub.jsp?c_code=102">일러스트</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				영상<i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<a href="/hmjm/Home/cateSub.jsp?c_code=201">프리미어</a> <a
					href="/hmjm/Home/cateSub.jsp?c_code=202">에프터이펙트</a>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				외국어 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a href="/hmjm/Home/cateSub.jsp?c_code=301">영어</a></span> <span><a
					href="/hmjm/Home/cateSub.jsp?c_code=302">중국어</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				실무역량 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a id="notwork" href="#">x엑셀</a></span> <span><a
					id="notwork" href="#">x파워포인트</a></span> <span><a id="notwork"
					href="#">x커뮤니케이션 스킬</a></span> <span><a id="notwork" href="#">x마케팅</a></span>
				<span><a id="notwork" href="#">xDataScience</a></span> <span><a
					id="notwork" href="#">x창업</a></span> <span><a id="notwork" href="#">x재무회계</a></span>
				<span><a id="notwork" href="#">x기획서</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				뷰티 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a id="notwork" href="#">x메이크업</a></span> <span><a
					id="notwork" href="#">x퍼스널컬러</a></span> <span><a id="notwork"
					href="#">x헤어</a></span> <span><a id="notwork" href="#">x패션</a></span> <span><a
					id="notwork" href="#">x스킨케어/마사지</a></span> <span><a id="notwork"
					href="#">x네일</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				음악 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a id="notwork" href="#">x보컬</a></span> <span><a
					id="notwork" href="#">x피아노</a></span> <span><a id="notwork"
					href="#">x미디작곡</a></span> <span><a id="notwork" href="#">x기타연주</a></span>
				<span><a id="notwork" href="#">x드럼</a></span> <span><a
					id="notwork" href="#">x디제잉</a></span> <span><a id="notwork"
					href="#">x국악</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				라이프스타일 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a id="notwork" href="#">x핸드메이드</a></span> <span><a
					id="notwork" href="#">x사진</a></span> <span><a id="notwork" href="#">x술</a></span>
				<span><a id="notwork" href="#">x도예/물레</a></span> <span><a
					id="notwork" href="#">x커피/차</a></span> <span><a id="notwork"
					href="#">x요리/베이킹</a></span> <span><a id="notwork" href="#">x가죽공예</a></span>
				<span><a id="notwork" href="#">x여행/투어</a></span> <span><a
					id="notwork" href="#">x연기</a></span>
			</div>
		</div>

		<div class="subnav">
			<button class="subnavbtn">
				재테크 <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<span><a id="notwork" href="#">x투잡</a></span> <span><a
					id="notwork" href="#">x주식투자</a></span> <span><a id="notwork"
					href="#">x기타 재테크</a></span> <span><a id="notwork" href="#">x가상화폐</a></span>
			</div>
		</div>
	</div>
	<br>
</body>
</html>