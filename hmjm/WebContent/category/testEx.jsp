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
	  var target = document.getElementById("good");
	 
	  if(e.value == "a") var d = good_a;
	  else if(e.value == "b") var d = good_b;
	  else if(e.value == "c") var d = good_c;
	 
	  target.options.length = 0;
	 
	  for (x in d) {
	    var opt = document.createElement("option");
	    opt.value = d[x];
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
<option value="">세부 카테고리를 선택해주세요</option>
</select>



</body>
</html>