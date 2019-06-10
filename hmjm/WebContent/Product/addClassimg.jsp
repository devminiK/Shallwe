<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%--상품 번호를 가져오기위함 --%>
<%@ page import="hmjm.bean.product.productDAO" %>
<%@ page import="hmjm.bean.product.productVO" %>

<%
	request.setCharacterEncoding("UTF-8");

	//상품등록후 그곳에서 시권스값(상품번호)를 가져와야한다.
	//productDAO dao = productDAO.getInstance();
	//productVO vo = //dao.getProduct();//상품번호 가져와야함.
%>

<!DOCTYPE html>
<html>
<head>
<title>상품 등록_ 이미지 등록</title>
</head>
<%
	int num = 0;	//이미지 순서 번호
	int productNum=0;	//상품 번호
	
	if(request.getParameter("num")!= null){
		num = Integer.parseInt(request.getParameter("num"));
	}
	//productNum =Integer.parseInt(vo.get);//상품 번호 받아오기

%>
<body>
	<form method="post" name="imgform" action="addClassimgPro.jsp">
		<%--ci_num,p_classnum hidden으로 할것 --%>
		이미지순서번호<input type="number" name="ci_num" value="<%=num%>"><br>
		상품번호<input type="number" name="p_classnum" value="<%=productNum%>"><br>
		이미지 주소<input type="text" name="ci_img" placeholder="이미지주소입력"><br>
		<br>
		<input type="submit" value="사진 등록" >  
  		<input type="reset" value="다시작성">
	</form>
</body>
</html>