<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%--06.17 성민 작성 --%>


<%
	String[] values = request.getParameterValues("reNum");
	classtimeDAO ctdao = classtimeDAO.getInstance();
	
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
			//pdNum.get(p);
			System.out.println(pdNum.get(p));
		}

		
	}		

%>