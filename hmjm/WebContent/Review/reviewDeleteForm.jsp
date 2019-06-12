<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
%>
<form method="POST" name="deleteform" action="/hmjm/Review/reviewDeletePro.jsp?num=<%=num%>&p_num=<%=pnum %>">
	<table>
		<tr><td>리뷰를 삭제하시겠습니까?
				<input type="hidden" name="r_num" value="<%=num%>">
			</td></tr>
			
		<tr><td><input type="submit" value="리뷰삭제" >
      			<input type="button" value="돌아가기" 
      			onclick="document.location.href='/hmjm/Talent/Detail.jsp?p_num=<%=pnum%>'">
      		</td></tr>    
	</table>
</form>