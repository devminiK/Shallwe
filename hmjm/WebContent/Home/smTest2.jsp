<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int j=0;
	int jfix=0;
	
	for(int i=0 ;i<3 ;i++){
		j+=100;
		jfix+=100;
		for(;j<jfix+3; j++){
			System.out.println(i+"/"+j);
		}
	}
%>

</body>
</html>