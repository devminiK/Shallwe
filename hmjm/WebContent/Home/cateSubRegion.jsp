<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.product.productDAO" %>
]<%@ page import = "hmjm.bean.product.productVO" %>
<%@ page import = "java.util.List" %>

<%@ page import = "java.util.ArrayList" %>
<%--06.17 성민 작성 --%>
<%--06.17 성민 작성 --%>
<!DOCTYPE html>
<html>

<head>
<title>지역별 카테고리 검색 시, 아래에 나올 컨텐츠</title>
<%--
	
	해당 지역의 상품  method(p_num) :상품의 종류에 따라 어떤 지역이 있는지 파악하는 메서드 필요
	지역에 관한 카테고리가 몇개인지 파악하는 메서드 필요
	

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
<%
	String[] values = request.getParameterValues("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	productDAO pdao = productDAO.getInstance();
	
	for(String val:values){
		out.print(val+",");
		
		//해당 지역번호로  수업 갯수 구하기_ok
		int pdCount = ctdao.getRegionCount(val);
		System.out.println("pdCount: "+pdCount);
		
		//갯수만큼 List배열생성
		List<String> pdNum = new ArrayList<String>();
		pdNum=ctdao.getClassNumFromRegin(val);
		System.out.println(pdNum);
		
		for(int p =0; p <pdCount;p++){//갯수만큼 반복
			int num = Integer.parseInt(pdNum.get(p));
		
			//시각적으로 보기위한 출력임._상품번호
			System.out.println(pdNum.get(p));
			
			//상품번호로 상품 리스트를 가져오는 함수 필요
			productVO pvo = pdao.getProduct(num);
			
			/*
				1.n개의 수업
				2.select 추천/낮은가격/최신 순
				3.컨텐츠 박스
				3-1. 상품이미지, 제목, 튜터사진, 튜터이름,별명, 가격, 합산별점,지역 정보
			
			*/
			%>
			<div><%=pvo.getP_classname() %></div>
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
				<div id="middle">
					<div id="mbox"></div>
					
				</div>
			</div>
			<%
		}	
	}		

%>
 	
</body>
</html>