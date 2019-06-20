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
#top, table {
	width: 100%;
	height: 220px;
	margin: 0 auto;
	background-color: #666666;
	boarder: 1px solid;
	text-align: center;
}

.section {
	width: 33%;
	height: 220px;
	margin: 50px 0 0 30px;
}

.sec_box {
	display: table-row;
}

.sec_box_ele {
	display: table-cell;
}

a {
	/*밀줄 제거, 폰트 사이즈 변경, 윤곽 잡기(버튼처럼)*/
	
}

#icon, img { /*아이콘 이미지 사이즈 */
	width: 50px;
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
<body>

	<table id="top" border="1">
		<tr>
			<td class="section">
			<%if(e == null){ %>
				<%--등록한 이미지사진 불러오기 --%> <img src="/hmjm/Images/TutorImg/user.png"
				width="50%"/><%=preUser %><br>
				튜터: 미등록<br>
				<%} else {%>
				<%--등록한 이미지사진 불러오기 --%> <img src="/hmjm/Images/TutorImg/<%=e.getT_selfimg()%>"
				width="50%"/> <%--해당 이메일의 닉네임 --%> <%=c.getM_name()%> 님<br>
				 <a href="/hmjm/Tutor/Register/menu.jsp">튜터 정보 수정</a><br>
				<%}%>
			    <a href="/hmjm/My/profile.jsp">정보 수정</a>&nbsp;<br>
			    
			   
				<a href="/hmjm/Log/logout.jsp">로그아웃</a>
			</td>
			
			<td class="section">
				<div class="sec_box">
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/hmjm/Images/Icon/kakao.jpg">
						<p>받은수업신청서</p>
						<%if(b == null){ %>
						<p>(<%=countOrder %>)건</p>
						<%}else{ %>
						<p>(<%=countOrder %>)건</p>
						<p><a href ="/hmjm/My/myClass.jsp?p_num=<%=b.getB_productnumber() %>">리스트 보기</a></p>
							<%}%>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/hmjm/Images/Icon/kakao.jpg">
						<p>신청한 수업</p>
						<%if(b == null){ %>
							<p>수업을 신청하세요^^</p>
							<%}else{ %>
							<p>(<%=count %>)건</p>
							<p><a href ="/hmjm/My/myClass.jsp?p_num=<%=b.getB_productnumber() %>">리스트 보기</a></p>
							<%}%>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/hmjm/Images/Icon/kakao.jpg">
						<p>내 수업</p>
						<%if(p == null){ %>
							<p>아직 나의 수업이 없어요</p>
							<%}else{%>
							<p>(<%=countp %>)건</p>
							<p><a href ="/hmjm/My/myClass.jsp?p_num=<%=p.getP_num() %>">리스트 보기</a></p>
							<%}%>
					</div>

				</div>
			</td>
			<td class="section">
				<div>
					<span>등록된 전화번호:</span> <a href="/hmjm/My/profile.jsp"><%=c.getM_phone() %></a>
				</div>
				<div>
					<span>등록 된 이메일:</span>
					<%=preUser%>
				</div>
				<div>
					<%if (e == null) {%>
					<span>학교 정보:</span> 등록안됨
					<%} else {%>
					<span>학교 정보:</span> <%=e.getT_school() %>
					<%}%>
				</div>
				<div>
					<span>계정 정보:</span> <a href="/hmjm/Account/resetPassword.jsp">비밀번호변경</a>
				</div>

			</td>
		</tr>
	</table>

</body>
</html>