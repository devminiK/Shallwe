<%-- 세이브 용--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="java.sql.*"%>
<%@ page import="hmjm.bean.product.*"%>
<%--성민 작성 --%>
<%-- addProduct.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pdvo" scope="page" class="hmjm.bean.product.productVO" />
<jsp:setProperty name="pdvo" property="*" />

<%
	String uploadPath = request.getRealPath("/Images/ProductImg");
	out.println("절대 경로: "+uploadPath+"<br>");
	
	int maxSize = 2 * 1024 * 1024; //파일 용량 제한:(20M)
	
	String fileName1 = ""; 		// 중복처리된 이름
	String originalName1 = ""; 	// 중복 처리전 실제 원본 이름
	String fileType = ""; 		// 파일 타입
	long fileSize = 0; 			// 파일 사이즈
	
	MultipartRequest multi = null;

	
	//ServletContext context = getServletContext();
	//realFolder = context.getRealPath(saveFolder);
		
	try {
		//request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request,uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
		
		
		//전송한 전체 파일이름들을 가져온다.
		Enumeration<?> files = multi.getFileNames();
	/*
		while (files.hasMoreElements()) {
			//form 태그에서  <input type="file" name="여기서 지정한 이름"/>을 가져온다.
			String file1 = (String) files.nextElement(); //파일 input에 저장ㅎ나 이름을 가져옴
			//그에 해당하는 실제 파일 이름을 가져옴.
			originalName1 = multi.getFilesystemName(file1);
			
			//파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unipue하게 파일명을 생성하는데, 
			//이때 생성도니 이름을 filesystemName이라 하여 그 이름 정보르르 가져온다.(중복 처리)
			fileName1 = multi.getFilesystemName(file1);
			
			//파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
			
			//input file name에 해당하는 실제 파일을 가져온다.
			File file = multi.getFile(file1);
			
			//그 파일 객체의 크기를 알아낸다.
			fileSize = file.length();
			
		}
	*/
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//form 내의 input name=""의  value를 가져옴
	String p_email = multi.getParameter("p_email");
	String p_category = multi.getParameter("p_category");
	String p_classname = multi.getParameter("p_classname");
	String p_self = multi.getParameter("p_self");
	String p_class1 = multi.getParameter("p_class1");
	String p_class2 = multi.getParameter("p_class2");
	String p_class3 = multi.getParameter("p_class3");
	String p_class4 = multi.getParameter("p_class4");
	int p_time = Integer.parseInt(multi.getParameter("p_time"));
	int p_cost = Integer.parseInt(multi.getParameter("p_cost"));
	int p_count_min = Integer.parseInt(multi.getParameter("p_count_min"));
	int p_count_max = Integer.parseInt(multi.getParameter("p_count_max"));
	String p_memo = multi.getParameter("p_memo");
	//String p_imgsrc = multi.getParameter("p_imgsrc");
	
	pdvo.setP_email(p_email);
	pdvo.setP_category(p_category);
	pdvo.setP_classname(p_classname);
	pdvo.setP_self(p_self);
	pdvo.setP_class1(p_class1);
	pdvo.setP_class2(p_class2);
	pdvo.setP_class3(p_class3);
	pdvo.setP_class4(p_class4);
	pdvo.setP_time(p_time);
	pdvo.setP_cost(p_cost);
	pdvo.setP_count_min(p_count_min);
	pdvo.setP_count_max(p_count_max);
	pdvo.setP_memo(p_memo);
	//pdvo.setP_Imgsrc(p_imgsrc);
%>
<%
	productDAO dao = productDAO.getInstance();
	dao.insertProduct(pdvo); /*작성한 정보를 삽입*/

	productDAO daock = productDAO.getInstance();
	boolean result = daock.productCheck(p_email); //daock.productCheck(p_num);으로 변경할것

	if (result) {%>
	<script>
		alert("[알림]수업 등록이 완료되었습니다.");
	</script>
	<META http-equiv=refresh content="0; url=hmjm/Tutor/Register/menu.jsp">

<%} else {%>
	<script>
		alert("[경고]수업등록에 실패하셨습니다.");
		history.go(-1);
	</script>
<%	}%>