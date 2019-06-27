<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>message box</title>
<style>
#menu {
	background: #e3e3e3;
	padding: 10px 10px 10px 10px;
}

.menu_new {
	width: 500;
}

.eachButton {
	display: table-cell;
}

* {
	box-sizing: border-box
}

/* Set height of body and the document to 100% */
body, html {
	height: 100%;
	margin: 0;
	font-family: Arial;
}

/* Style tab links */
.tablink {
	background-color: #555;
	color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 50%;
}

.tablink:hover {
	background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
	color: black;
	display: none;
	padding: 10px 10px;
	height: 100%;
}

#Receive{
	background-color: #beebed;
}

#Send {
	background-color: #bedced;
}
</style>
<script>
	function openPage(pageName, elmnt, color) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].style.backgroundColor = "";
		}
		document.getElementById(pageName).style.display = "block";
		elmnt.style.backgroundColor = color;
	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
</head>
<body id="menu">
	<button class="tablink" onclick="openPage('Receive', this, '#60a7e0')" id="defaultOpen">받은</button>
	<button class="tablink" onclick="openPage('Send', this, '#80ed8f')">보낸</button>
	<div>
		<div id="Receive" class="tabcontent">
			<jsp:include page="message.jsp"/>
		</div>
		<div id="Send" class="tabcontent">
			<jsp:include page="sendMessage.jsp"/>
		</div>
	</div>
</body>
</html>