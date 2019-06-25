<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.product.*"%>
<%@ page import="hmjm.bean.buy.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<%@ page import="hmjm.bean.classtime.*"%>
<%@ page import="hmjm.bean.classimg.*"%>
<%@ page import="java.util.List"%>
<%@ page import="oracle.net.aso.b"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 상세페이지</title>
<!-- 타임라인 스타일 -->
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #474e5d;
  font-family: Helvetica, sans-serif;
}

/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 500px;
  min-width: 300px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: white;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: white;
  border: 4px solid #FF9F55;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid white;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent white;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  left: 31px;
  }
  
  /* Full-width containers */
  .container {
  width: 100%;
  padding-left: 70px;
  padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  left: 60px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  left: 0%;
  }
}
</style>

<style type="text/css">


#tuImg {
	float: center;
	overflow: hidden;
	display: block;
	margin: 0 auto;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-size: cover;
	background-position: center;
}

#container_detail {
    width: 1000px;
    background: #e3e3e3;
    padding: 50px 0 50px 0;
    letter-spacing: 0;
    margin: 0 auto;
}
.pic {
	width: 500px;
	height: 200px;
    float: left;
    
    padding: 0 80px 0 80px;
}
.title {
	width: 500px;
	height: 100px;
    float: right;
    margin: 0 auto;
    padding: 0 0 0 0;
     
}
.title2 {
	width: 500px;
	height: 100px;
    float: right;
    margin: 0 auto;
    padding: 0 0 0 0;
     
}
.s {
	padding: 50px 0 50px 0;
	width: 1000px;
	margin: 0 auto; 
}
.empty{
	heighyt:50px;
	background:green;
}
/*버튼 스타일*/
.btn {
  border: none;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}

.success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;}

</style>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
</head>

<%
		String id = (String) session.getAttribute("loginId");
	
		int num = Integer.parseInt(request.getParameter("p_num"));
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("로그인아이디"+id);
		
		classtimeDAO time = classtimeDAO.getInstance();
		classtimeVO t = time.getClasstime(num);
		int cp = Integer.parseInt(t.getCt_place());
		classimgDAO aa  = classimgDAO.getInstance();
		classimgVO bb = aa.getImg(num);
	//내수업인지 신청한 수업인지 구별하기 위해 불러오는 값..테스트중
		tutorDAO tu = tutorDAO.getInstance();
		tutorVO ee = tu.getMember(id);
	
		System.out.println("튜터정보**e**"+ee);
		
		buyDAO buyer = buyDAO.getInstance();
		buyVO b = buyer.getBuy(id);
		buyVO c =buyer.getBuy3(id,num);//구매한 상품 신청 못하게
		System.out.println("구매정보**b**"+b);
		
		//System.out.println("구매한경우강의넘버**bbb**"+bbb);
		
		
	
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
		productVO vc = dbPro.getProduct2(id,num);//등록한 상품 신청 못하게
		productVO vd = dbPro.getProduct4(id);
		String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
		tutorVO et = tu.getMember(t_email);
		
		
		
		//내가 등록한 강의 번호
		
		//System.out.println("등록한경우강의넘버가 아닌가보다**vv**"+vv);
		
		
		

		//사진 불러오기 할려고 했는데 이건 아닌 듯....미완성
		if (pageNum == null) { pageNum = "1"; }
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number=0;
		
		List classimgList = null;
		classimgDAO pic = classimgDAO.getInstance();
		count = pic.getClassimgCount(num);
		
		if (count > 0) {
			classimgList = pic.getClassimg(num,startRow, endRow);}	
%>

<body>
	<jsp:include page="/Home/header.jsp" />
	<jsp:include page="/SideMenu/sideMenu.jsp" />
	<div id="container_detail">
		
			<div class="pic">
				<img id="tuImg" src="/hmjm/Images/TutorImg/<%=et.getT_selfimg()%>">
				<%=et.getT_nick() %>
				<input type="hidden" name="p_email"
					value="<%=vo.getP_email()%>" /><br>
				강사이메일:::::::: <a href="#"
					onClick="window.open('/hmjm/Message/messageWriteForm.jsp?p_email=<%=vo.getP_email()%>&p_num=<%=num%>',
					'_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,directories=no,width=650,height=660')">
						<%=vo.getP_email() %></a>
			</div>
			<div class="title">
				 <h1><%=vo.getP_classname()%></h1>
			</div>
			<div class="title2">
			
			<%switch(cp){
				case 101:%>
				강남<%;
				break;
				case 102:%>
				신촌홍대<%;
				break;
				case 103:%>
				건대<%;
				break;
				
				case 201:%>
				수원<%;
				break;
				case 202:%>
				분당<%;
				break;
				case 203:%>
				죽전<%;
				break;
				
				case 301:%>
				부산서면<%;
				break;
				case 302:%>
				부산해운대<%;
				break;
				case 303:%>
				부산사상<%;
				break;
		
				}%>
				
				
				
		
				<%=vo.getP_time() %>시간/회
				
				<%if(vo.getP_count_min()==0){%>
				1:1강습<%}else{%>
					<%=vo.getP_count_min() %>~<%=vo.getP_count_max() %>명
					<%} %>
				
				<%=vo.getP_cost() %>원/시간
				 
			</div>
			
				
			<div class ="s">
				<h4>강사소개</h4>
				<%=vo.getP_self()%>
			</div>
			<div class="empty">test</div>
			<div class ="s">
				<h4>튜터정보</h4>
				<%=vo.getP_class1() %>
			</div>
			<div class ="s">
				<h4>수업소개</h4>
				<%=vo.getP_class2() %>
			</div>
		
			<div class ="s">
				<h4>수업대상</h4>
				<%=vo.getP_class3() %>
			</div>
			<div class ="s">	
				<h4>커리큘럼</h4>
				<%=vo.getP_class4() %>
			</div>

		</div>
				테스트라인<br>
	

				
			

	
		 <%--수업가능시간 --%>
		
			수업가능시간::
			<%if(t == null){ %>
			<h1>시간 미등록 튜터</h1>
			<%}else{ %>
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
			월:
			<%=t.getCt_mon()%>
			<%}%>

			<%if(t.getCt_tue()==null){%>
			<%}else{%>
			화:
			<%=t.getCt_tue()%>
			<%}%>

			<%if(t.getCt_wed()==null){%>
			<%}else{%>
			수:
			<%=t.getCt_wed()%>
			<%}%>

			<%if(t.getCt_thu()==null){%>
			<%}else{%>
			목:
			<%=t.getCt_thu()%>
			<%}%>

			<%if(t.getCt_fri()==null){%>
			<%}else{%>
			금:
			<%=t.getCt_fri() %>
			<%}%>

			<%if(t.getCt_sta()==null){%>
			<%}else{%>
			토:
			<%=t.getCt_sta()%>
			<%}%>

			<%if(t.getCt_sun()==null){%>
			<%}else{%>
			일:
			<%=t.getCt_sun() %>
			<% %>

			<%if(t.getCt_day()==null){%>
			<%}else{%>
			데이수업<%=t.getCt_day()%>
			<%}%>
			<%}%>
			<%}%>
		<br>
		<% if(bb==null){%>
		<h1>사진 미등록 튜터</h1>
		<%}else{ %>

		<%if(count == 0){%>
		test
		<%}else{%>
		
			
		<% for(int i = 0 ; i < classimgList.size(); i++){
			classimgVO g = (classimgVO)classimgList.get(i);%>
				<img src="/hmjm/Images/Classimg/<%=g.getCi_name()%>" style="width:50%">
				<%}%>
			<%}%>
		<%}%>

		<br>

<%--신청하기 if문 --%>
<%
if(id!=null){
	if(ee!=null){
		if(vd!=null){
			if(vc!=null){%>
		내가 등록한글 <a href="/hmjm/Home/main.jsp"> 처음으로</a>
		<%}else{
					if(b!=null){
						if(c!=null){%>
		튜터o 구매한 강의 <a href="/hmjm/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		 튜터 o구매이력 o 신청하기
		 <button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
							}else{%>
		 튜터o구매이력 x 신청하기
		 <button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
					
				}
			
		}else{
				if(b!=null){
					if(c!=null){%>
		튜터 o 판매x 구매한 강의 <a href="/hmjm/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		 튜터 o판매x 구매이력 o 신청하기
		 <button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
					}else{%>
		튜터o판매x 구매이력 x 신청하기 
		<button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
				}
				
		}else{
				if(b!=null){
					if(c!=null){%>
		튜터x 구매한 강의<a href="/hmjm/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		 튜터x구매이력o 신청하기
		 <button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
				}else{%>
				<button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		 튜터x구매이력 x 첫구매!
		<%}	
			
			}
	}else{%>
		
		<button class="btn success" onclick="location.href='/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}


%>


		<br> <br>

	<jsp:include page="/Review/review.jsp?p_num=<%=num%>" />
	<jsp:include page="/Home/footer.jsp" />
</body>
</html>