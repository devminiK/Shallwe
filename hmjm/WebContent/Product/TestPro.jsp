<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.test.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="vo" scope="page" class="hmjm.test.FileVO" />
<jsp:setProperty name="vo" property="*" />

<%
	FileDAO dao = FileDAO.getInstance();
	dao.insert2(vo); /*작성한 정보를 삽입*/
%>

<script>

	alert("[알림] 등록완료");
</script>

