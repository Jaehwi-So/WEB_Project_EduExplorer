<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 학원 : SpringSchool</title>

<style type="text/css">
	#footer_login_box{width: 1320px; height: auto; margin: 0 auto;
					  list-style: none; text-decoration: none;
					  background: white; color:black;
					  margin-top:30px;
					  margin-bottom:30px;
					  font-size:15px;}
	.a_info{color:black; font-size:15px;}
	.h_title{font-size:35px; margin-top:6px; color:white;}
	#div_title{ background : black; text-align:center;
				width:600px; margin: 0 auto;
				height:60px;
				border-radius:30px 30px 30px 30px;
				margin-top : 20px;
				margin-bottom : 20px;
				padding : 10px;}	
	ul{margin-bottom: 30px;}						  
</style>
</head>
<body>

	<div id="footer_login_box" >	
		
		<hr>
				
		<div id="div_title">
		<h2 class="h_title">이런 학원은 어떠세요?</h2>
		</div>
			<c:if test="${ empty rec_list }">
				추천 목록없음
			</c:if>
			<c:if test="${!empty rec_list }">
			<c:forEach var="vo" items="${rec_list}">
			<ul style="display: inline-block;" >
				<li>
				<a class="a_info" href="a_list_detail.do?a_idx=${vo.a_idx}"><img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}" width="258" height="150"></a>
				</li>
				<li>
				<a class="a_info" href="a_list_detail.do?a_idx=${vo.a_idx}">${vo.a_name} </a>
				</li>
				<li>
				${vo.a_tel}
				</li>
				<li>
				${vo.a_area }
				</li>
			</ul>	
			</c:forEach>
			</c:if>

		<hr>
	
		</div>

</body>
</html>