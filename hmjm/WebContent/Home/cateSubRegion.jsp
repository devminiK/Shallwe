<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.product.productDAO" %>
<%@ page import = "hmjm.bean.product.productVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%--06.19 성민 작성 --%>
<!DOCTYPE html>
<html>
<head>
<title>지역별 카테고리 검색 시, 아래에 나올 컨텐츠</title>
<%--
	


 --%>
 <style>
 	#boxl{
 		float:left;
 	}
 	#boxr{
 		flaot:right;
 	}
 	#middle{
 		display:table-row;
 	}
 	#mbox{
 		dispaly:table-cell;
 	}
 </style>
</head>

<body>
<%--상단 카테고리bar: header --%>
<jsp:include page="header.jsp" />
	<%--중간 카테고리bar: category --%>
<jsp:include page="category.jsp" />
	

<%
	request.setCharacterEncoding("UTF-8");
/*
1.n개의 수업
2.select 추천/낮은가격/최신 순
3.컨텐츠 박스
3-1. 상품이미지, 제목, 튜터사진, 튜터이름,별명, 가격, 합산별점,지역 정보
*/

	//reNum값은 String 하나로 받은 뒤, split를 이용해 자른다.
	String reNumValues = request.getParameter("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	productDAO pdao = productDAO.getInstance();
	
	
	String [] eachReNum = reNumValues.split(","); 
	for(String x : eachReNum){
		
		String ern = x;	//지역번호
		
		//해당 지역번호로 등록된 수업 갯수
		int pdCount = ctdao.getRegionCount(x);
		out.print("해당지역 수업갯수:"+pdCount);
		%>
		
		<div id="container">
				<div id="top">
					<div id="boxl"><%=pdCount%>개의 수업</div>
					<div id="boxr">
						<select>
							<option>추천도순</option>
							<option>낮은 가격순</option>
							<option>최신순</option>
						</select>
					</div>
				</div>
		<%
		
		//해당 지역번호로 등록된 상품 번호(리스트)
		List<String> pdNum = new ArrayList<String>();
		pdNum = ctdao.getClassNumFromRegin(x);
		out.println("상품번호 리스트: "+ pdNum);
		
		for(int p=0; p<pdCount; p++){
			int num = Integer.parseInt(pdNum.get(p));
			
			//각각 상품번호
			out.print("각각 수업번호 :"+num);
			
			//수업번호로 정보가져오기
			productVO pvo = pdao.getProduct(num);
			
			//자꾸 에러남 ㅠㅠ 그래서 객체 내용 존재유무 넣음.
			if(pvo!=null){
				out.println("존재");
			}else{
				out.println("존재안함");
			}
			%>
				수업명:<%=pvo.getP_classname()%>
				<div id="middle">
					<div id="mbox"></div>
					
				</div>
			</div>
			<%
		}	
	}		
%>
			
 <%--footer --%>
 <jsp:include page="footer.jsp" />

</body>
</html>