<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>HEADER</title>
	<style>
	* {box-sizing: border-box;}

	body {
		margin: 0;
 		font-family: Arial, Helvetica, sans-serif;
	}

	.topnav {
  		overflow: hidden;
  		background-color: white;
	}
	
	/* 좌측 아이콘 */
	.topnav .icon {
  		float: left;
  		margin-left:100px;
	}
	.topnav .icon img {
		width:120px;
 	    cursor: pointer; 
	}

	/* 우측 카테고리 */
	.topnav .category {
	  float: right;
	  margin-right:100px;
	}
	.topnav .category a {
		float: left;
  		display: block;
  		color: black;
  		text-align: center;
  		padding-top:20px;
  		padding-right:20px;
  		margin-left:10px;	/*글자 사이간격*/
		text-decoration: none;
		font-size: 15px;
 		font-weight: bold;
	}
	.topnav  .category a:hover {
 		color: gray;
	}

	/* 검색 기능 */
	.topnav .search-container {
  		float: left;
	}
	.topnav input[type=text] {
  		padding: 6px;
  		margin-top: 20px;
  		size: 25;
  		maxlength:30px;	
  		border: 2px;
	}

	.topnav .search-container button {
  		float: left;
  		padding: 6px 10px; /*버튼의 사이즈*/
  		margin-top: 18px;	/*버튼 배치*/
  		margin-left:10px;
  		margin-right: 8px;
  		font-size: 17px;
  		border: none; 
	}


	.topnav .search-container button:hover {/*나중에 삭제할것: 불필요*/
  		background: #ccc;
	}

	@media screen and (max-width: 600px) {
  		.topnav .search-container {
    		float: none;
  		}
  		.topnav a, .topnav input[type=text], .topnav .search-container button {
    		float: none;
    		display: block;
    		text-align: left;
    		width: 100%;
    		margin: 0;
    		padding: 14px;
  		}
  		.topnav input[type=text] {
    		border: 1px solid #ccc; 
  		}
	}
</style>
	<script language="javascript">
		function openRealtimetalk(){
			url="My/Qnatutee.jsp";
			//새로운 윈도우로 열기
			open(url, "Qnatutee",  "toolbar=no, location=no,status=no,menubar=no,resizable=no,width=400, height=660");
		}
	</script>
</head>
<body>

	<div class="topnav">
		<div class="icon">
			<a href="main.jsp"><img src="images/logo.png"/></a>
		</div>
	
		<div class="search-container">
    		<form action="/action_page.php"><!--/*input 창 양옆넓이 늘릴것*/  -->
      			<input type="text" style="width:400px;" placeholder="배우고 싶은 수업 또는 튜너를 검색해보세요!" name="search">
     			<button type="submit"><i class="fa fa-search"></i></button>
    		</form>
 		 </div>
  
		<div class="category">
  			<a href="#serviceinfo">서비스소개</a>
  			<a href="#becometutor">튜터등록</a>
  			<a href="register.jsp">회원가입</a>
  			<a href="loginForm.jsp">로그인</a>
  		</div>
  
	</div>

</body>
</html>