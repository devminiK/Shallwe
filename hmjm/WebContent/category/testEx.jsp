<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function categoryChange(e) {
	  var good_a = ["포토샵", "일러스트레이터", "UI/UX"];
	  var good_b = ["프리미어", "에프터이펙트"];
	  var good_c = ["영어", "중국어", "일본어", "베트남어"];
	  var cc = ["101","102","103"];
	  var dd = ["201","202","203"];
	  var ee = ["301","302","303"];
	  
	  
	  var target = document.getElementById("good");
	 
	  if(e.value == "a") {var d = good_a; var ss = cc;}
	  
	  else if(e.value == "b"){ var d = good_b; var ss = dd;}
	  else if(e.value == "c"){ var d = good_c; var ss = ee;}
	  target.options.length = 0;
	 
	  for (x in d&&ss ) {
	    var opt = document.createElement("option");
	    opt.value = ss[x];
	    opt.innerHTML = d[x];
	    target.appendChild(opt);
	  } 	  
	}
</script>
</head>
<body>
<select onchange="categoryChange(this)">
  <option>카테고리를 선택해주세요</option>
  <option value="a">디자인</option>
  <option value="b">영상</option>
  <option value="c">외국어</option>
</select>
 
<select id="good">
<option name="c_code">세부 카테고리를 선택해주세요</option>
</select>



</body>
</html>