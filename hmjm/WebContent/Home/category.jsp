<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0 auto;
  /*
	width: 1080;
	height: 80px;
	margin: 0 180px;
	*/	
}

/*전체 nav bar*/
.navbar {
	width:1080px;
	height:100px;
	margin: 0 180px;
  overflow: hidden;
  background-color: white; /*white*/
}

.navbar a { /*havor하면 나오는 링크*/
  float: left;
  font-size: 14px;
  color: black; /*??*/
  text-align: center;
  padding: 15px 10px;
  text-decoration: none;
}

.subnav {
  float: left;
  overflow: hidden;
}

.subnav .subnavbtn {
  font-size: 15px;  
  border: none;
  outline: none;
  color: black;
  padding: 14px 20px;
  background-color: inherit;
  font-family: inherit;
  font-weight:bold;
  margin: 0;
}
.subnavbtn:hover{/*border때문에 글씨가 살짝 내려감_ok*/
  border-top:1.5px solid black;
  border-right:1.5px solid black;
  border-left:1.5px solid black;
  border-bottom:1.5px solid white;
}


.subnav-content {
  display: none;
  position: absolute;
  left: 0;
  background-color: white;
  width: 100%;
  z-index: 1;
  margin: 0 180px;
}

.subnav-content a {
  float: left;
  color: black;
  text-decoration: none;
}

.subnav-content a:hover {
  color: gray;
}
.subnav-content:hover {/*위아래가 이어져야함*/
  border-top:1.5px solid black;
  border-right:1.5px solid black;
  border-left:1.5px solid black;
  border-bottom:1.5px solid black;
}

.subnav:hover .subnav-content {
  display: block;
}
</style>
</head>
<body>

<div class="navbar">
  <div class="subnav">
    <button class="subnavbtn">디자인 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
      <span><a href="/hmjm/Home/cateSub.jsp?c_code=101">포토샵</a></span>
      <span><a href="/hmjm/Home/cateSub.jsp?c_code=102">일러스트</a></span>
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">영상<i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
      <a href="/hmjm/Home/cateSub.jsp?c_code=201">프리미어</a>
      <a href="/hmjm/Home/cateSub.jsp?c_code=202">에프터이펙트</a>
     
    </div>
  </div> 
  <div class="subnav">
    <button class="subnavbtn">외국어 <i class="fa fa-caret-down"></i></button>
    <div class="subnav-content">
      <span><a href="/hmjm/Home/cateSub.jsp?c_code=301">영어</a></span>
      <span><a href="/hmjm/Home/cateSub.jsp?c_code=302">중국어</a></span>
    
    </div>
  </div>
</div>


</body>
</html>
</html>