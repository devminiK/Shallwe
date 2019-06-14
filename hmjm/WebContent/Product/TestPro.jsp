<%--/*test용 파일, 추후 삭제할것_성민*/ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="file.FileDAO" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%-- cos.jar파일에 있는 라이브러리 임포트, 중복된 파일이름에 대한 정책 --%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<title>jsp파일 업로드Pro</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/uploadTest/");
		int maxSize = 1024 *1024 * 100;
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory,
				maxSize, encoding, new DefaultFileRenamePolicy());
		
		/*이미지 여러개 업로드하기*/
		Enumeration<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasMoreElements()){
			
			String parameter = (String)fileNames.nextElement();
			
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			//파일 이 없을경우, 계속 실행시키기위함
			if(fileName == null)continue;
			
			/*시큐어 코딩*/
			if(!fileName.endsWith(".jpg") 
					&& !fileName.endsWith(".png")
					&& !fileName.endsWith(".bmp")
					&& !fileName.endsWith(".gif")){
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드할 수 없는 확장자입니다.");
				
			}else{
				FileDAO fdao = FileDAO.getInstance();
				fdao.insert1(fileName, fileRealName);
				out.write("파일명:"+fileName+"/");
				out.write("실제 파일명:"+fileRealName+"<br>");			
			}
		}
		
		
		
		
		
		
		
	%>
</body>
</html>