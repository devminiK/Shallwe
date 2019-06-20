<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.Enumeration"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="hmjm.bean.tutor.*" %>
<%@ page import ="hmjm.bean.tutor.tutorVO" %>


<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="hmjm.bean.tutor.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%	
		String realFolder ="";
		String filename ="";
		MultipartRequest imageUp =null;
		
		String saveFolder ="Images/TutorImg";
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
				filename = imageUp.getFilesystemName(name);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		String t_nick = imageUp.getParameter("t_nick");
		String t_email = imageUp.getParameter("t_email");
		String t_school = imageUp.getParameter("t_school");
		String t_major = imageUp.getParameter("t_major");
		String t_idcard = imageUp.getParameter("t_idcard");
		String t_c = imageUp.getParameter("t_c");
		
		vo.setT_nick(t_nick);
		vo.setT_email(t_email);
		vo.setT_selfimg(filename);
		vo.setT_school(t_school);
		vo.setT_major(t_major);
		vo.setT_idcard(t_idcard);
		vo.setT_c(t_c);
		
%>		
<% 	
		tutorDAO manager = tutorDAO.getInstance();
		manager.updateTutor2(vo);
		
%>
	<form>
		<script>
			alert("수정이 완료되었습니다");
			window.location = './Register/menu.jsp';
		</script>
	</form>
		
	   