<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--성민 작성 --%>
<!DOCTYPE html>
<html>
<head>
<title>FOOTER</title>
<style>

#footer{
/*너비, 스크롤 나옴, 수정해야함*/
	width:100%;
	height:300px;
	margin: 0 auto;
}
.footer_cont {
	width:925;
	height:300px;
	display:table;
	margin-left:auto;
	margin-right:auto;
	padding: 35px 0px 70px;
}

/*ul요소 포함 박스*/
.info_box {
	display: table-row;	/*tr같이 나열*/
	width: 300px;
	height: 138px;
	
}

/*info_box 내의 정보 블럭*/
.info_cell {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
    float:left;
    margin-right:50px;
}
.info_cell_kko {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
    float:right;
}
.footer_mid {
	width:100%;
    padding: 79px 0px 0px;
	height:79px;  	
}

.footer_bot {
	display: table-row;	/*tr같이 나열*/
	width:100%;
	height:50;
	padding: 79px 0px 0px;
	font-family: Arial, Helvetica, sans-serif;
  	
}
.bot_info {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
	width: 100%;
	height: 60px;
   
}

.bot_logo {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
	width: 330px;
	height: 38px;
	margin:20px;
   
}
.bot_logo a{
	margin:10px;
}

/*개별 요소 태그 속성*/
b.ft_b {
	text-transform: uppercase;
}


ul.ft_ul {
	list-style-type: none;
	padding-left: 0;
}

li.ft_li {
	color: gray;
	margin: 5px;
}
li a {
	color: gray;
	font-size: 15px;
	text-decoration: none;
}
p{
	font-size:13px;
}
span.ft{
	color:white;
}
.ft_icon{
	width:29px;
}


</style>
</head>
<body id="footer">
	<div class="footer_cont">
		<div class="info_box">
			<div class="info_cell">
				<b class="ft_b">company</b>
				<ul class="ft_ul"><li><a href="#">서비스 소개</a></li>
					<li><a href="#">튜터 컨텐츠</a></li>
					<li><a href="#">블로그</a></li>
					<li><a href="#">언론보도</a></li></ul>
			</div>

			<div class="info_cell">
				<b class="ft_b">policies</b>
				<ul class="ft_ul"><li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보취금방침</a></li>	</ul>
			</div>

			<div class="info_cell">
				<b class="ft_b">support</b>
				<ul class="ft_ul"><li><a href="#">FAQ</a></li>
					<li><a href="#">쉘위 센터</a></li>
					<li><a href="/hmjm/Admin/adminLogin.jsp">admin</a></li></ul>
			</div>

			<div class="info_cell">
				<b class="ft_b">기업교육</b>
				<ul class="ft_ul"><li><a href="#">shallwe Biz</a></li></ul>
			</div>
			<%--아래로 표시됨, 수정 요망 --%>
			<div class="info_cell">
				<b class="ft_b">shallweing center</b>
				<ul class="ft_ul"><li><span><img src="/hmjm/Images/Icon/kakao.jpg" width="18px"/></span>&nbsp;&nbsp;KAKAO 플러스친구 / @쉘위센터</li>
					<li>운영시간 / 평일 10:00 ~ 18:00</li>
					<li><span class="ft">ㅁㅁㅁㅁ</span>/점심 13:00 ~ 14:00</li></ul>
				<div class="bot_logo">
	                <a href="https://www.facebook.com/taling.me" target="_blank"><img class="ft_icon" src="/hmjm/Images/Icon/facebook.png"/></a>
	                <a href="https://www.instagram.com/" target="_blank"><img class="ft_icon"  src="/hmjm/Images/Icon/instagram.png"/></a>
	                <a href="https://www.youtube.com/channel/UCuFmmpVLaNNFoy-cHqELl_A" target="_blank"><img class="ft_icon"  src="/hmjm/Images/Icon/youtube.png"/></a>
	                <a href="https://post.naver.com/taling_me" target="_blank"><img class="ft_icon"  src="/hmjm/Images/Icon/naver.png"/></a>
				</div>
			</div>
		</div>
		<div class="footer_bot">
			<div class="bot_info">
				<p>상호 : (주)쉘위 | 주소 : 서울특별시 관악구 남부순환로 1820 에그옐로우빌딩 14층 | 사업자등록번호 : 000-00-00000 | 대표자명 : 김성민</p>
				<p>Copyright ⓒ2019 shallWe inc, ltd. All rights reserved</p>
			</div>
		</div>
	</div>
</body>
</html>