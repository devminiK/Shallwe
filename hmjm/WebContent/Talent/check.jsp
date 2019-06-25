<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import ="hmjm.bean.product.*"%>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>

<!DOCTYPE html>
<html>
<head>
<title>재능 수강 신청하기</title>
</head>
<style>
#container_detail {
    width: 1000px;
    background: #e3e3e3;
    padding: 50px 0 50px 0;
    letter-spacing: 0;
    margin: 0 auto;
}

 .btn_red {
    width: 100px;
    display: inline-block;
    margin-top: 0px;
    background: red;
    color: #fff;
    font-size: 20px;
    padding: 20px 0 20px 0;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    border: 0px;
    text-align: center;}
 .btn_b {
    width: 100px;
    display: inline-block;
    margin-top: 0px;
    background: #aaa;
    color: black;
    font-size: 20px;
    padding: 20px 0 20px 0;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    border: 0px;
    text-align: center;  } 
    
</style>
<script type="text/javascript">
	
	$(function(){
		$('.date_ch').change(function(){
			if($(this).val()=="첫 수업 일자를 선택해주세요")
			{
				$('#StartDateTime').val('');
				var index = $(this).attr('id').substr(4,1);
				index = "#StartDateTime"+index;
				$(index).val('');
			}
			else
			{
				$('#StartDateTime').val($(this).val());
				var index = $(this).attr('id').substr(4,1);
				index = "#StartDateTime"+index;
				$(index).val($(this).val());
			}
			//alert($(this).prop('selectedIndex'));
			//alert($(this).attr('id').substr(4,1));
			/*var index = $(this).attr('id').substr(4,1);
			index = "#StartDateTime"+index;
			$(index).val($(this).val());*/
			
		});
	});

	function setMode()
	{
		if (($('#StartDateTime').val()=='')&&($('#optionCount').val()!="0")&&($('#StartRegion').val()!="온라인"))
		{
			alert('첫 수업 일자를 선택해주세요');
		}
		else{
			$('#StartInfo').submit();
		}
		
	}

</script>


<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	productDAO dbPro = productDAO.getInstance();
	productVO vo = dbPro.getProduct(num);
	//시간이랑 위치 불러오기
	classtimeDAO time = classtimeDAO.getInstance();
	classtimeVO t = time.getClasstime(num);
	int cp = Integer.parseInt(t.getCt_place());
	
	String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
	
	tutorDAO m =tutorDAO.getInstance();
	tutorVO v = m.getMember(t_email);
	
	

%>
	
<body>
<jsp:include page="/Home/header.jsp" />	
	<%if(session.getAttribute("loginId") != null){%>
	
	<!--  넘어온 수업정보를 넘기는 폼인것 같은데 아직 확실히 잘 모르겠음
	<form id="StartInfo" name="form" action="/Talent/Apply/6466" method="POST">
			<input type="hidden" id="StartRegion" name="StartRegion" value="강남">
			<input type="hidden" id="StartDateTime" name="StartDateTime" value="오후7:30~오후10:30 (2019-06-12)">
	</form>-->
	<div id="container_detail">
	  <form method="post" name="checkForm"
	  action="checkPro.jsp" align="center">
	  <!-- buy테이블에 입력 될 값
	  	b_num(시퀀스)
	  	b_email
	  	b_productnumber
	  	b_classname
	  	b_place
	  	b_day
	   -->
		<h3>내아이디:
		<input type="text" readonly name="b_email" 
		 value="<%=(String)session.getAttribute("loginId") %>"></h3><br>
		<h3>수업번호: <%=vo.getP_num() %>
		<!-- product number값을 넘긴다 -->
		<input type="hidden" readonly name="b_productnumber" 
		 value="<%=vo.getP_num() %>"></h3>
		 
		<h3>수업이름:
		<input type="text" readonly name="b_classname" 
		 value="<%=vo.getP_classname() %>"></h3><br>
		
		<h3>선생님 별명: <%=v.getT_nick() %><h3>
		<h3>선생님 이메일: 
			<a href="#"
					onClick="window.open('/hmjm/Message/messageWriteForm.jsp?p_email=<%=vo.getP_email()%>&p_num=<%=num%>',
					'_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,directories=no,width=650,height=660')">
						<%=vo.getP_email() %></a></h3>
		<input type="hidden" name="tutor_id" value="<%=vo.getP_email() %>">
		<br>
	
		<%if(t == null){%>
		<h1>시간 미등록 튜터입니다.쪽니나 이메일로 문의하세요</h1>
		<%}else{%>
		<div>
			<h3>위치:<input type="hidden" name="b_place" value="<%=t.getCt_place()%>" >
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
			</h3>
		</div>
		<div><h3>가능시간</h3>
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
			월: <%=t.getCt_mon() %><br>
			<%} %>
			<%if(t.getCt_tue()==null){%>
			<%}else{%>
			화: <%=t.getCt_tue() %><br>
			<%} %>
			<%if(t.getCt_wed()==null){%>
			<%}else{%>
			수: <%=t.getCt_wed() %><br>
			<%} %>
			<%if(t.getCt_thu()==null){%>
			<%}else{%>
			목: <%=t.getCt_thu() %><br>
			<%} %>
			<%if(t.getCt_fri()==null){%>
			<%}else{%>
			금: <%=t.getCt_fri() %><br>
			<%} %>
			<%if(t.getCt_sta()==null){%>
			<%}else{%>
			토: <%=t.getCt_sta() %><br>
			<%} %>
			
			<%if(t.getCt_sun()==null){%>
			<%}else{%>
			일: <%=t.getCt_sun() %><br>
			<%} %>
			
			<%if(t.getCt_day()==null){%>
			<%}else{%>
			데이수업<%=t.getCt_day() %>
			<%}%>
		<%}%>
					
			<p>요일<input type="text"  name="b_day" ></p>
		</div>
		
	
	

	
	<div class="btn_red" >
	<input type ="submit" value="수업신청하기"></div>
	
	<input type="hidden" id="optionCount" name="optionCount" value="1">
	<div class="btn_b" onclick="javascript:window.location='../Home/main.jsp'">일단 취소</div>
	<%}else{ //로그아웃시 main.jsp로 이동
				//session.invalidate();
			%>
					<script>
					alert("로그인부터");
					window.location='../Log/loginForm.jsp';
						
					</script>
					
			<%}%>
	</form>
	</div>
<jsp:include page="/Home/footer.jsp" />
</body>
</html>