<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	*{margin: 0px; padding: 0px;}
	ul{list-style: none;} /* 리스트 앞에 . 같은거 제거*/
	a{text-decoration: none;} /* 링크에 밑줄 같은거 제거*/
 
#top_footer{
	width: 1320px; /*메인 이미지의 너비 사이즈와 같음*/
	height: 170px;
	background-color: black;
	border: 5px solid black;
	 
	/* header 안에 요소들을 모두 absolute 포지션으로 배치할 것이라서 */
	/* absolute 요소가 header의 좌상단을 기준으로 하려면 */
	/* header의 position이 relative 여야만 함 */
	position: relative;
}

#foot_logo{
	position: absolute;
	top: 5px;
	left: 5px;
	cursor: pointer;
}

#foot_menu{
	position: absolute;
	top: 1px;
	right: 1px;
	cursor: pointer;
}

#left_menu {
	border-left: 5px solid gray;
}


#foot_menu a{
	color: black;
	float: left;
	border-right: 5px solid gray;
	padding-left: 30px;
	padding-right: 30px;
	
	display: inline;
	height: 100%;
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
	 background: white;
	font-family: 'TmoneyRoundWindExtraBold', serif;
}
	
#foot_content li{
    display: inline;
    margin-left: 50px;
}

#foot_address {
	position: absolute;
	width: 1320px;
    bottom: 10px;
    /*  left: 50px; */
    font-size: 15px;   
}

#foot_address li{
	display: inline;
	margin-left: 30px;
}

#foot_address li a{ color: white; }
	
/* footer 영역 */
footer{
	width: 1320px; /*헤더와 같은 사이즈*/
	height: 90px;
	margin-top: 20px;
	text-align: center;
	background-color: #f1f1f1;
}
	 
/* 전체 페이지가 가운데로 오도록 */
#foot_page{ width: 1320px; margin: 0px auto; }
	
</style>
	
<script type="text/javascript">
	function send_main() {
		location.href="main.com";
	}

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="foot_page">
		<div id="top_footer">
		
			<div id="foot_menu">
	       		<a id="left_menu" href="#">개인정보처리방침</a>
				<a href="#">사이트 이용규정</a>
				<a href="#">공지사항</a>
				<a href="#">질문답변</a>
				<a>대표전화문의 02-3482-8050</a>
	       	</div> <!-- foot_menu -->
	       
			<div id="foot_logo">
	            <img src="${pageContext.request.contextPath}/resources/img/main_logologo.png" width="100px" height="100px" alt="address">
			</div> <!-- foot_logo -->
	       
	        <div id="foot_address">
				<li><a>Copyright ⓒ2020 소재휘, 김준호, 이지환, 박소윤, 서지수, 길태윤. All Right Reserved</a></li> <br> 
				<li><a>Copyright ⓒ2020 소재휘, 김준호, 이지환, 박소윤, 서지수, 길태윤. All Page content is property</a></li> <br>
	        </div> <!-- foot_address -->
		</div>	<!-- top_footer -->
	</div>
</body>

</html>