<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--/*test용 파일, 추후 삭제할것_성민*/ --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jsp파일 업로드</title>
<script type="text/JavaScript">

	function addImageFile(){
		fileCnt = document.getElementById('fileCnt').value;							
		fileCnt++;
		html = '';
		html += '<input id="file'+fileCnt+'" name="file'+fileCnt+'" type="file" value=""/>';
		
		var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById('FileAdd').appendChild(div);							
		document.getElementById('fileCnt').value = fileCnt;
	}
	</script>
</head>
<body> 
	<form action="TestPro.jsp" name="testForm" method="post" align="center"
		enctype="multipart/form-data">
		<label><b>자격증</b></label>
			<input id= "file0" type ="file" name ="file" value/>
	<br>
	<div id="FileAdd"></div>
 		<a onclick="addImageFile();" class="addbtn"><b>추가 +</b></a>
		<input type="hidden" id="fileCnt" name="fileCnt" value="0">
		<input type="submit" value="전송" />
	</form>
</body>
</html>