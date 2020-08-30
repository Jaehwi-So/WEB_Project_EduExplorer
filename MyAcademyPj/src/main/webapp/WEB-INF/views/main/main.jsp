<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../head/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<style type="text/css">
		
		.main_mySlides {display: none}
		
		/* Slideshow container */
		.main_slideshow-container {
		  max-width: 1320px;
		  position: relative;
		  margin: auto;
		  max-height: 1300px;
		}
		
		/* Next & previous buttons */
		.main_prev, .main_next {
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
		}
		
		/* Position the "next button" to the right */
		.main_next {
		  right: 0;
		  border-radius: 3px 0 0 3px;
		}
		
		/* On hover, add a black background color with a little bit see-through */
		.main_prev:hover, .main_next:hover {
		  background-color: rgba(0,0,0,0.8);
		}
		
		/* Caption text */
		.main_text {
		  color: #f2f2f2;
		  font-size: 15px;
		  padding: 8px 12px;
		  position: absolute;
		  bottom: 8px;
		  width: 100%;
		  text-align: center;
		}
		
		/* Number text (1/3 etc) */
		.main_numbertext {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
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
		
		.main_active, .main_dot:hover {
		  background-color: #717171;
		}
		
		/* Fading animation */
		.main_fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}
		
		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .main_prev, .main_next, .main_text {font-size: 11px}
		}
		
		#main_banner1 {
			/* position: absolute; */
			width: 630px;
			height: 800px;
			/* border: 5px solid yellow; */
			text-align: center;
			margin-top: 20px;
		}
		
		#main_banner1 li {
			width: 590px;
			height: 200px;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 5px;
			margin: 10px;
			text-align: center;
		}
		
		#main_banner1 li a {
			width: 550px;
			/* height: 100%; */
		}
		
		#main_banner2 {
			position: relative;
			left: 640px;
			top: -810px;
			width: 640px;
			height: auto;
			text-align: center;
		}
		
		#main_banner2 li {
			width: 590px;
			height: 200px;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 5px;
			margin: 10px;
			text-align: center;
		}
		
		#main_banner2 li a {
			width: 550px;
			/* height: 100%; */
		}
		 
		#programmers ul {
			float: left;
			text-align: center;
			margin-right: 10px;
		} 
	</style>
	
	<script>
		
		/* 처음 실행시 출력 */
		window.onload = function(){
			showSlides(slideIndex);
		}
		
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
		  var slides = document.getElementsByClassName("main_mySlides");
		  var dots = document.getElementsByClassName("main_dot");
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
		
		function StartClock() {
	
			var i;
			var slides = document.getElementsByClassName("main_mySlides");
			var dots = document.getElementsByClassName("main_dot");
			
		    timerId = setInterval(PrintTime, 3000);
		    
		    /* 만약 3초의 시간이 되었을때 sliders의 n값을 1씩 증가 */
		    /* sliders의 n값이 맥스가 되었을때 n값을 1로 초기화 */
		    for(var i = 0; i < timerId; i++) {
		    	slides[i].style.display = "block";
		    	dot[i].style.display += "active";
		    	
		    	if(i == 5) {
		    		i = 1;
		    	}
		    }
		}
	
	</script>

	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
	</head>
	<body>
		<main>
			<div class="main_slideshow-container">
					
				<div class="main_mySlides fade">
					<div class="main_numbertext">1 / 5</div>
					<img src="${pageContext.request.contextPath}/resources/img/mainimg1.png" style="width:100%">
				</div>
				
				<div class="main_mySlides fade">
				 	<div class="main_numbertext">2 / 5</div>
					<img src="${pageContext.request.contextPath}/resources/img/mainimg2.png" style="width:100%">
				</div>
				
				<div class="main_mySlides fade">
					<div class="main_numbertext">3 / 5</div>
					<img src="${pageContext.request.contextPath}/resources/img/mainimg3.png" style="width:100%">
				</div>
				
				<div class="main_mySlides fade">
					<div class="main_numbertext">4 / 5</div>
					<img src="${pageContext.request.contextPath}/resources/img/mainimg4.png" style="width:100%">
				</div>
				
				<div class="main_mySlides fade">
					<div class="main_numbertext">5 / 5</div>
					<img src="${pageContext.request.contextPath}/resources/img/mainimg5.png" style="width:100%">
				</div>
				
				<a class="main_prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="main_next" onclick="plusSlides(1)">&#10095;</a>
				
	<br>
	
			<div style="text-align:center">
				<span class="main_dot" id="first_img" onclick="currentSlide(1)"></span> 
				<span class="main_dot" onclick="currentSlide(2)"></span> 
				<span class="main_dot" onclick="currentSlide(3)"></span> 
				<span class="main_dot" onclick="currentSlide(4)"></span> 
				<span class="main_dot" onclick="currentSlide(5)"></span> 
			</div>
			
				<div id="main_banner1">
					<ul>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner1.png" style="width: 590px" alt="banner1"> </a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner2.png" style="width: 590px" alt="banner2"> </a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner3.png" style="width: 590px" alt="banner3"> </a></li> 	
					</ul>
				</div>
				
				<div id="main_banner2">
					<ul>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner4.png" style="width: 590px" alt="banner4"> </a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner5.png" style="width: 590px" alt="banner5"> </a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/mainbanner5.png" style="width: 590px" alt="banner6"> </a></li>
					</ul>
				</div>
				
				<%-- <div id="main_programmers">
					<div>
						<ul>
							<h2>PROGRAMMERS</h2>
							<li><img src="${pageContext.request.contextPath}/resources/img/main_img4.png" style="width:10%" alt="giltaeyoon"></li>
							<li><img src="${pageContext.request.contextPath}/resources/img/main_img4.png" style="width:10%" alt="giltaeyoon"></li>
						</ul>
					</div>
				</div> --%>
			</div>
		</main>
		<%@ include file="../recommend/recommend.jsp" %>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>