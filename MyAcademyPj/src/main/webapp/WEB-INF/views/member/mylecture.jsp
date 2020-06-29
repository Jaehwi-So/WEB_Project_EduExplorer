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
</head>
<body>  						<!--bookmark == 즐겨찾기  -->
	<input type="button" value="즐겨찾기목록" onclick="location.href='bookmark.com?m_idx=${user.m_idx}'">
</body>
</html>