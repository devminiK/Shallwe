<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터등록</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<form action ="tutorRegisterPro" name="tutor" method="post" align="center">
	<table  width ="550" align ="center" >
 	<br><br>
	<tr height ="80" bgcolor ="FDD262">
		<th colspan ="3"><font color ="white">튜터 등록</font></th>
	</tr> 
	<tr height ="50">
		<th >프로필사진</th>
		<th><input type ="file" autofocus name="t_selfimg"required/></th>
	</tr>
	<tr height ="50">
		<th>별명</th>
		<th><input type ="text" name ="t_nick" required/></th>	
	</tr>
	<tr height ="50">
	
		<th>학교인증<input id="univ" type="radio" name="신분" value="1" checked="" onclick="checkLayer(1);"></th>
		<th><input type ="text" name ="t_school" 
		placeholder ="학교 예)서울대학교" required/></th>
		<th><input type ="text" name ="t_major" 
		placeholder ="전공 예)경영학과" required/></th>	
		
	</tr>
	<tr>
		<th>신분인증<input type="radio" name="신분" value="신분인증"></th>
	</tr>
	<tr height ="50">
		<th>자격증</th>
		<th><input id= "Cert0" type ="text" name ="t_c" placeholder="예)정보처리기사"
		value class ="input_txt01" required/></th>	
	</tr>
	

</table><br/>
<div id="CertAdd"></div>
 <a onclick="addFile();" class="addbtn">추가 +</a>
	<input type="hidden" id="fileCnt" name="fileCnt" value="0">


</form>

</body>
	<script type="text/JavaScript">

	function addFile(){
		fileCnt = document.getElementById('fileCnt').value;							
		fileCnt++;
		html = '';
		html += '<input id="Cert'+fileCnt+'" name="t_c'+fileCnt+'" placeholder="예)정보처리기사" type="text" value="" class="input_txt01 clearbt"/>';
		
		
		var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById('CertAdd').appendChild(div);							
		document.getElementById('fileCnt').value = fileCnt;
	}

	</script>
	


</html>