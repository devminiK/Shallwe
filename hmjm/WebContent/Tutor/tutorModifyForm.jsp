<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.tutor.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터정보 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function addFile() {
		fileCnt = document.getElementById('fileCnt').value;
		fileCnt++;
		html = '';
		html += '<input id="Cert'
				+ fileCnt
				+ '" name="t_c'
				+ fileCnt
				+ '" placeholder="예)정보처리기사" type="text" value="" class="input_txt01 clearbt"/>';

		var div = document.createElement('div');
		div.innerHTML = html;
		document.getElementById('CertAdd').appendChild(div);
		document.getElementById('fileCnt').value = fileCnt;
	}

	function checkLayer(val) {

		if (val == 1) {
			document.getElementById('schoolmajor').style.display = "block";
		} else if (val == 2) {
			document.getElementById('schoolmajor').style.display = "none";
		}
	}

	var sel_file;
	$(document).ready(function() {
		$("#inputImg").on("change", handleImgFileSelect);
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("사진만 올려라");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		})
	}
</script>
</script>

<style type="text/css">
.tt{
	width:1200px;
}
ul {
	list-style: none;
}

#container_register {
	background: #e3e3e3;
	padding: 50px 0 50px 0;
}

#tImg {
	border-radius: 50%;
}

#tuImg {
	float: center;
	overflow: hidden;
	display: block;
	margin: 0 auto;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-size: cover;
	background-position: center;
}

.img_wrap {
	float: center;
	width: 150px;
	margin_top: 50px;
}

.img_wrap img {
	max-width: 100%;
}
/* Set a style for the submit button */
.registerbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 400px;
	opacity: 0.9;
}

.registerbtn:hover {
	opacity: 1;
}

.registerbtn2 {
	background-color: #4CAF90;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 400px;
	opacity: 0.9;
}

.registerbtn2:hover {
	opacity: 1;
}
</style>

</head>
<body class="tt">
	<%
		String m_email = (String) session.getAttribute("loginId");
		//memberDAO manager = memberDAO.getInstance();
		//memberVO c = manager.getMember(m_email);
		tutorDAO vo = tutorDAO.getInstance();
		tutorVO e = vo.getMember(m_email);
	%>
	<jsp:include page="/Home/header.jsp" />
	<div id="container_register">


		<form action="tutorModifyPro.jsp" name="tutor" method="post"
			align="center" enctype="multipart/form-data">

			<div>
				<ul>
					<h1>튜터 정보 수정</h1>
				</ul>
				<ul>
					<li><label>프로필사진</label>
						<div id="tuImg"
							style="background-image: url('/hmjm/Images/TutorImg/<%=e.getT_selfimg()%>')">
							<div class="img_wrap">
								<img id="img" />
							</div>
						</div> <input id="inputImg" type="file" name="t_selfimg" /> <input
						type="hidden" name="t_email" value="<%=e.getT_email()%>">
					</li>
				</ul>

				<ul>
					<li><label>별명^_^</label> <input type="text" name="t_nick"
						value="<%=e.getT_nick()%>" /></li>
				</ul>
				<ul>

					<li><label>학교인증</label> <input id="univ" type="radio"
						name="t_idcard" value="1" checked onclick="checkLayer(1);">
						<div id="schoolmajor">
							<input type="text" name="t_school" placeholder="학교 예)서울대학교"
								value="<%=e.getT_school()%>" /> <input type="text"
								name="t_major" placeholder="전공 예)경영학과"
								value="<%=e.getT_major()%>" />
						</div></li>

				</ul>
				<ul>
					<li><label>신분인증</label> <input id="univ" type="radio"
						name="t_idcard" value="2" onclick="checkLayer(2);"></li>
				</ul>
				<ul>
					<li><label>자격증</label> <input id="Cert0" type="text"
						name="t_c" placeholder="예)정보처리기사" value="<%=e.getT_c()%>"
						class="input_txt01" /></li>
				</ul>
				<br />
				<div id="CertAdd"></div>

				<a onclick="addFile();" class="addbtn"><h5>추가 +</h5></a> <input
					type="hidden" id="fileCnt" name="fileCnt" value="0"><br>
				<input type="submit" name="modify" value="튜터 정보 수정"
					class="registerbtn"><br> <input type="button"
					value="취소" class="registerbtn2"
					onclick="javascript:window.location='Register/menu.jsp'">
			</div>
		</form>
	</div>

	<div>
		<jsp:include page="/Home/footer.jsp" />
	</div>

	</div>
</body>
</html>