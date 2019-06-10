<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import ="java.sql.*" %>
<%@ page import="hmjm.bean.product.*" %>
<%--성민 작성 --%>
<%-- addProduct.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-8"); 	%>

<jsp:useBean id="pdvo" scope="page" class="hmjm.bean.product.productVO"/>
<jsp:setProperty name="pdvo" property="*" />

<%
String realFolder ="";
String filename ="";
MultipartRequest imageUp =null;

String saveFolder ="Images/ProductImg";
String encType ="UFT-8";
int maxSize =2*1024*1024;

ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);
try{
	imageUp = new MultipartRequest(
			request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	Enumeration<?>files = imageUp.getFileNames();
	
	while(files.hasMoreElements()){
		String name =(String)files.nextElement();
		filename = imageUp.getFilesystemName(name);
	}
}catch(Exception e){
	e.printStackTrace();
}
		
		String p_email = imageUp.getParameter("p_email");
	 	String p_category = imageUp.getParameter("p_category");
		String p_classname = imageUp.getParameter("p_classname");
		String p_self = imageUp.getParameter("p_self");
		String p_class1 = imageUp.getParameter("p_class1");
		String p_class2 = imageUp.getParameter("p_class2");
		String p_class3 = imageUp.getParameter("p_class3");
		String p_class4 = imageUp.getParameter("p_class4");
		int p_time = Integer.parseInt(imageUp.getParameter("p_time"));
		int p_cost = Integer.parseInt(imageUp.getParameter("p_cost"));
		int p_count_min =Integer.parseInt( imageUp.getParameter("p_count_min"));
		int p_count_max = Integer.parseInt(imageUp.getParameter("p_count_max"));
		String p_memo = imageUp.getParameter("p_memo");
		String p_imgsrc = imageUp.getParameter("p_imgsrc");
		
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
		pdvo.setP_Imgsrc(p_imgsrc);		
		
%>
<%
	
	productDAO dao = productDAO.getInstance();
	dao.insertProduct(pdvo); /*작성한 정보를 삽입*/
	
	productDAO daock = productDAO.getInstance();
	boolean result = false;//daock.productCheck(p_email);
	
	
	if(result){
		//session.setAttribute("registedTutor",p_email);
	}else{%>
	
		<script>
	    		alert("오류");
	    		history.go(-1);
	    		</script>
	
	<%}%>+
		
%>
<script>
	alert("수업이 등록되었습니다.");
</script>
<META http-equiv=refresh content="0; url=/Tutor/Register/menu.jsp">