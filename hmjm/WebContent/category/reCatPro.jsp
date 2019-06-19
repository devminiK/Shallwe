<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.product.productDAO" %>
<%@ page import = "hmjm.bean.product.productVO" %>
<%@ page import = "java.util.List" %>

<%@ page import = "java.util.ArrayList" %>
<%--06.17 성민 작성 --%>

<%
	String[] values = request.getParameterValues("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	productDAO pdao = productDAO.getInstance();
	
	
	for(String val:values){
		out.print("선택한 지역 번호: ["+val+"]");
		
		//해당 지역번호로  수업 갯수 구하기_ok
		int pdCount = ctdao.getRegionCount(val);
		out.print("해당지역의 수업갯수: "+pdCount);
		
		System.out.println("pdCount(해당지역의 수업갯수): "+pdCount);
		
		//갯수만큼 List배열생성
		List<String> pdNum = new ArrayList<String>();
		pdNum=ctdao.getClassNumFromRegin(val);
		out.println("상품번호 리스트: "+ pdNum);
		
		System.out.println("상품번호 리스트:"+pdNum);
		
		for(int p =0; p <pdCount;p++){//갯수만큼 반복
			int num = Integer.parseInt(pdNum.get(p));
		
			//시각적으로 보기위한 출력임._상품번호
			out.print("각각 상품번호 :"+pdNum.get(p));
			System.out.println("각각 상품번호 :"+pdNum.get(p));			
			//상품번호로 상품 리스트를 가져오는 함수 필요
			productVO pvo = pdao.getProduct(num);
			%>
			<div>수업 번호:<%=pvo.getP_num()%></div>
			<div>수업 명:<%=pvo.getP_classname() %></div>
			
			<%
		}
		System.out.println("-----------------");
	}
	/*
				1.n개의 수업
				2.select 추천/낮은가격/최신 순
				3.컨텐츠 박스
				3-1. 상품이미지, 제목, 튜터사진, 튜터이름,별명, 가격, 합산별점,지역 정보
			
			*/
%>
<%--이 방법이라도 해야, 체크값 해지하고 되돌아 갈 수 있음
<META  http-equiv="Refresh" content="0; URL=reCatForm.jsp"/>	
			 --%>

