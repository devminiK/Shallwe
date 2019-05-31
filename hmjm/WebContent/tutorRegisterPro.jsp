<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="hmjm.bean.dao.*" %>
<%@ page import ="hmjm.bean.vo.tutorVO" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="vo" class="hmjm.bean.vo.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
	String realFolder ="";
	String t_selfimg ="";
	MultipartRequest imageUp =null;
	
	String saveFolder ="/selfimg";
	String encType ="utf-8";
	int maxSize =2*1024*1024;
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	try{
		imageUp = new MultipartRequest(
				request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		Enumeration<?>files = imageUp.getFileNames();
		
		while(files.hasMoreElements()){
			String name =(String)files.nextElement();
			t_selfimg = imageUp.getFilesystemName(name);
		}
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<%
		tutorDAO manager = tutorDAO.getInstance();
		manager.insertTutor(vo);

%>

			<script>
	    		alert("튜터 등록이 완료되었습니다");
	    	</script>
	    	<META http-equiv=refresh content="0;url=loginForm.jsp">