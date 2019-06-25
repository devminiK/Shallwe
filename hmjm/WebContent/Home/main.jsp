<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쉘위?- 나만의 튜터를 만들어보세요.</title>
<style>
#main {
	box-sizing: border-box;
	font-family: Verdana, sans-serif;
	margin: 0
}
#ft_position {
   left: 0;
   bottom: 0;
   width: 100%;
   color: black;
}

.mySlides {
	display: none
}

.mainimg {
	vertical-align: middle;
	width:100%;
}

/* Slideshow container */
.slideshow-container {
	width: 1050px;
	height: 350px;
	overflow-x: hidden;
	overflow-y: hidden;
	position: relative;
	margin:auto;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* The dots/bullets/indicators */
.main_dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .main_dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
</style>

</head>
<body id="main">
	<%-- 좌측 도움말 --%>
	<jsp:include page="/SideMenu/sideMenu.jsp" flush="false"/>
	
	<%--상단 카테고리bar: header --%>
	<jsp:include page="header.jsp" flush="false" />
	
	<%--중간 카테고리bar: category --%>
	
	<jsp:include page="category.jsp" flush="false"/>
	
 	<%--메인화면에 보여줄 , 메인 사진들 --%>
 	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}

		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}

		function showSlides(n) {
  		var i;
 		var slides = document.getElementsByClassName("mySlides");
 		var dots = document.getElementsByClassName("dot");
 		
 		if (n > slides.length) {slideIndex = 1}    
 		if (n < 1) {slideIndex = slides.length}
 		
  		for (i = 0; i < slides.length; i++) {
      		slides[i].style.display = "none";  
 		 }
 		 for (i = 0; i < dots.length; i++) {
   		   dots[i].className = dots[i].className.replace(" active", "");
 		}
 		 
 		 slides[slideIndex-1].style.display = "block";  
  		 dots[slideIndex-1].className += " active";
		}
	</script>
	<div class="slideshow-container">
		<div class="mySlides fade">
			<a href="#"><img class="mainimg" src="/hmjm/Images/main1.PNG"></a>
		</div>

		<div class="mySlides fade">
			<a href="#"><img class="mainimg" src="/hmjm/Images/main2.PNG"></a>
		</div>

		<div class="mySlides fade">
			<a href="#"><img class="mainimg" src="/hmjm/Images/main3.PNG"></a>
		</div>

		<div class="mySlides fade">
			<a href="#"><img class="mainimg" src="/hmjm/Images/main4.PNG"></a>
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>
	<div style="text-align: center;">
		<span class="main_dot" onclick="currentSlide(1)"></span> 
		<span class="main_dot" onclick="currentSlide(2)"></span> 
		<span class="main_dot" onclick="currentSlide(3)"></span> 
		<span class="main_dot" onclick="currentSlide(4)"></span>
	</div>
	<br>
	
	 <%--지역 카테고리 bar--%>
	<jsp:include page="reCatForm.jsp"/>
	
	
	<%--메인에 추천 상품 나열해줌 --%>
	<jsp:include page="listProduct.jsp" />
	
	<br/>
	<img src="/hmjm/Images/ad.png" width="100%"/>
	<%--footer --%>
	<div id="ft_position">
		<jsp:include page="footer.jsp" flush="false"/>
	</div>
	
	

</body>
</html>

