<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="vo" items="${list}">
		${vo.a_name}
		${vo.a_owner}
		${vo.a_tel }
		${vo.a_content }
		${vo.a_site }
		${vo.a_addr }
		${vo.a_image_s}
	</c:forEach>
</body>
</html>