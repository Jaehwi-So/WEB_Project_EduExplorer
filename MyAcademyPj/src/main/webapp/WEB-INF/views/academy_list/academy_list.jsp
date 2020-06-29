<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<title>학원 목록</title>
		<style>
			.box{
				width:200px;
				height:200px;
				border-style:solid;
				border-color:black;
				margin:10px;
				padding:10px;
			}
		</style>
		<script type="text/javascript">
			//상세 페이지 보기
			function send_detail_page(f){
				f.action = "a_list_detail.com";
				f.submit();
			}
			
			//학원 등록하기
			function reg_academy(){
				location.href="a_move_form.com";
			}
		</script>
	</head>
	<body>
		<input type="button" value="등록하기" onclick="reg_academy();">
		<table border="1" align="center">	
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>
						<div class="box">
						<form method="get" >
							<input type="hidden" name="a_idx" value="${vo.a_idx}">
							<img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}" width="100" /><br>
							<input type="button" value="상세보기" onclick="send_detail_page(this.form);">
						</form>
						</div>
					</td>
				</tr>
			</c:forEach><br>
			<tr>
				<td>${pageMenu}</td>
			</tr>
		</table>
	</body>
</html>