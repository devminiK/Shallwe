<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
function get_area(c_code) {

	$.ajax({

	type :"post",

	url : "pCategory.jsp",

	data : { no : c_code }, 

	success : test1

	});

	}

	function test1(data){
		$("#area2").html(data); 
		}

</script>
<body>
	<form role="form" method="post" autocomplete="off">
		<label>1차분류</label>
		<select class="category1" onchange="get_area(c_code)">
			<option>전체</option>
			<option value="100">100</option>
		</select>
		<label>2차분류</label>
		<select class="area2" onchange="test1(data)">
			<option value="">전체</option>
		</select>
	
	</form>

</body>
</html>