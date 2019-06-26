<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>


<style>
#logMain {
	width:1200px;
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 auto;
}

.bg-img {
	/* The image used */
	margin-top:10px;
	background-image: url("/hmjm//Images/loginbg.jpg");
	min-height: 600px;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

/* Add styles to the form container */
.log_container {
	position: absolute;
	right: 20px;
	margin: 20px;
	max-width: 300px;
	padding: 16px;
	background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit button */
.btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
	margin: 3px;
}

.btn:hover {
	opacity: 1;
}
</style>
</head>

<body id="logMain">

	<jsp:include page="/Home/header.jsp" />
	<div>
	<br>
		<div class="bg-img">
			<%if(session.getAttribute("loginId") == null){%>
			<form action="loginPro.jsp" method="post" class="log_container">
				<h1>Login</h1>
				<label for="email"><b>Email</b></label> 
				<input type="text"	name="m_email" placeholder="Enter Email"  required> 
				<label	for="psw"><b>Password</b></label> 
				<input type="password" name="m_pw" placeholder="Enter Password" required>

				<button type="submit" class="btn">Login</button>
				<button type="reset" class="btn">Reset</button>
				<button type="button" 
				class="btn" onclick="javascript:window.location='/hmjm/Register/register.jsp'">Join Us</button>
			</form>
			<%}else{ //로그아웃시 main.jsp로 이동
				session.invalidate();
			%>
					<script>
						history.go(-1);
					</script>
			<%}%>
		</div>
	</div>
	<jsp:include page="/Home/footer.jsp" />
</body>
</html>