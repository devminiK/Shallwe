<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>

<!DOCTYPE html>
<html>
<head>
<title>상단 바</title>
<style>
/********************칼럼 박스*****************************/
* {
  box-sizing: border-box;
}
#main{
	width:1200px;
	margin:0 auto;
}
/* Create three equal columns that floats next to each other */
.nav_column1 {
	background-color:#333333;
  float: left;
  width: 32%;
  padding: 10px;
  height: 200px; /* Should be removed. Only for demonstration */
  text-align:center;
}
.nav_column2 {
  background-color:#333333;
  float: left;
  width: 2%;
  padding: 10px;
  height: 200px; /* Should be removed. Only for demonstration */
  text-align:center;
}
.nav_colBox{
	display: table;
    /*border:1px solid white; 없애기*/
	text-align:center;
	/*cont 중간으로*/
	margin-left:40px;
	margin-top:15px;
}
.nav_inner_colBox{
	display: table-cell;
    vertical-align: middle;
    margin: 0 auto;
    margin-left:10px; 
}
hr{ /*분할 선*/
	height:150px;
	width:0px;
	color:white;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
/****************BUTTON**************************/
.btn {
  border: 1px solid black;
  background-color: #333333;
  color: black;
  padding: 5px 10px;	/*윤곽 너비*/
  font-size: 12px;
  cursor: pointer;
}

/* Green */
.click {
  border-color: #999999;
  color: #A6A6A6;/*글자 색*/
}

.click:hover {
  background-color: black;
  color: white;
}
/*a태그 밀줄 제거, 폰트 사이즈 변경, 윤곽 잡기(버튼처럼)*/
a:link {	color: black;
			text-decoration: none;}

a:visited {
	color: black;
	text-decoration: none;
}

a:hovor {
	color: black;
	text-decoration: none;
}
/********************그 외 스타일*****************************/
#nav_icon{ /*아이콘 이미지 사이즈 */
	width: 50px;
}
#userImg{
	border-radius:50%;
	width:100px;
	
}
span{
	 font-size: 14px;
}

h2, p, span{
	color: #A6A6A6;
}

p{
	font-size:14px;
}


</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String preUser =(String)session.getAttribute("loginId");//이메일 값
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(preUser);
	
	tutorDAO vo = tutorDAO.getInstance();
	tutorVO e = vo.getMember(preUser);
	
	productDAO product = productDAO.getInstance();
	productVO p = product.getProduct4(preUser);
	
	buyDAO buyer = buyDAO.getInstance();
	buyVO b = buyer.getBuy(preUser);
	buyVO o = buyer.getBuyOrder(preUser);//구매자 있는지 확인할 때
	int count = 0;
	int countp = 0;
	int countOrder = 0;
	count = buyer.buyCount2(preUser);
	countOrder = buyer.buyCount3(preUser);
	countp = product.getProductCount2(preUser);
	
%>
<body id="main">
<div class="row">
  <div class="nav_column1">
  	<div class="nav_colBox">
  		<div class="nav_inner_colBox">
  			<%if (e == null) {%>
				<%--등록한 이미지사진 불러오기 --%>
				<img src="/hmjm/Images/TutorImg/user.png" width="50%" /><%=preUser%><br>
				튜터: 미등록<br>
			<%} else {%>
				<%--등록한 이미지사진 불러오기 --%>
				<img id="userImg" src="/hmjm/Images/TutorImg/<%=e.getT_selfimg()%>"/>
				
  		</div>
  		<div class="nav_inner_colBox">
  			<%--해당 이메일의 닉네임 --%>
				<h2><%=c.getM_name()%>님</h2>
  			<div class="divBtn">
					<button class="btn click" 
						onClick="location.href='/hmjm/Tutor/tutorModifyForm.jsp'">튜터 정보 수정
					</button>
			<%}%>
				<button class="btn click"
					onClick="location.href='/hmjm/My/profile.jsp'">정보 수정</button>
				<br>
				<button class="btn click"
					onClick="location.href='/hmjm/Log/logout.jsp'">로그 아웃</button>
			</div>
  		</div>
  	</div>
	</div>
	<div class="nav_column2"><hr></div>
  <div class="nav_column1">
  	<div class="nav_colBox">
					<div class="nav_inner_colBox">
						<img class="nav_icon" alt="" src="/hmjm/Images/Icon/journal.png">
						<p>받은수업신청서</p>
						<%if(e == null){ %>
						<p>튜터:미등록</p>
						<%} else {
							if(p == null){ %>
							<p>아직<br> 나의 수업이 없어요</p>
							<%}else{
							if(b == null){ %>
								<p>(<%=countOrder %>)건</p>
								<%}else{ %>
									<p>(<%=countOrder %>)건</p>
						<button class="btn click" onClick="location.href='/hmjm/My/myClass.jsp?p_num=<%=b.getB_productnumber()%>'">리스트 보기</button>
								<%}%>
							<%}%>
							<%}%>
					</div>
					<div class="nav_inner_colBox">
						<img class="nav_icon" alt="" src="/hmjm/Images/Icon/checklist.png">
						<p>신청한 수업</p>
						<%if(b == null){ %>
							<p>수업을 신청하세요.</p>
							<%}else{ %>
							<p>(<%=count %>)건</p>
							<button class="btn click" onClick="location.href='/hmjm/My/myClass.jsp?p_num=<%=b.getB_productnumber() %>'">리스트보기</button>
							<%}%>
					</div>
					<div class="nav_inner_colBox">
						<img class="nav_icon" alt="" src="/hmjm/Images/Icon/blackboard.png">
						<p>내 수업</p>
						<%if(p == null){ %>
							<p>아직<br> 나의 수업이  없어요</p>
							<%}else{%>
							<p>(<%=countp %>)건</p>
							<button class="btn click" onClick="location.href='/hmjm/My/myClass.jsp?p_num=<%=p.getP_num() %>'">리스트보기</button>
							<%}%>
					</div>
				</div>
				
  </div>
  <div class="nav_column2"><hr></div>
  
  <div class="nav_column1">
  	<div class="nav_colBox">
    			<div>
					<span>등록된 전화번호  <%=c.getM_phone() %></span>
					<button class="btn click" onClick="location.href='/hmjm/My/profile.jsp'">수정하기</button>
				</div>
				<div>
					<span>등록 된 이메일 <%=preUser%></span>
				</div>
				<div>
					<%if (e == null) {%>
					<span>학교 정보:</span> 등록안됨
					<%} else {%>
					<span>학교 정보 <%=e.getT_school() %></span> 
					<%}%>
				</div>
				<div>
					<span>계정 정보</span><button class="btn click" onClick="location.href='/hmjm/Account/resetPassword.jsp'">비밀번호변경</button>
				</div>
  </div>
  </div>
</div>
</body>
</html>