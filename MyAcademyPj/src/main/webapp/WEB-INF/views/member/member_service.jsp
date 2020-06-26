<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../head/header.jsp" %>
<c:if test="${ empty sessionScope.user }">
	<script>
	alert("로그인 후 이용하세요");
	location.href="main.com";
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	
		.gogek_c{ font-size: 35px; padding-top: 15px;}
		.m_hr{ width: auto; width:750px; }
		.gogek_main{margin:auto; width: 750px; height: 85px; background:#27248A; color:white;}

	</style>	
</head>
<body>	
		<div>
			<hr class="m_hr">
					<div class="gogek_main" align="center">
						<div class="gogek_c"><span>고객센터</span></div>
					</div>
		    <hr class="m_hr">
		    
		
		
		<input type="button" value="회원정보변경" onclick="location.href='member_update.com'"> 
		<input type="button" value="회원탈퇴" onclick="location.href='member_del.com'"> 
		
		
		</div>


</body>
</html>