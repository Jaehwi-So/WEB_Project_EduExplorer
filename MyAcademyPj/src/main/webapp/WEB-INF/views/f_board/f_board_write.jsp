<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>게시물 작성</title>
<script type="text/javascript">
	function send_check() {
		var f = document.f; //폼태그를 이름을 통해 직접 검색
		if (f.f_subject.value.trim() == '') {
			alert("제목을 입력하세요")
			return;
		}
		if (f.f_name.value.trim() == '') {
			alert("이름을 입력하세요")
			return;
		}
		if (f.f_content.value.trim() == '') {
			alert("내용을 입력하세요")
			return;
		}

		f.submit();

	}
</script>
</head>
<body>
	<form name="f" method="post" action="f_insert.com">
		<input name="m_idx" type="hidden" value="${sessionScope.user.m_idx}">
		<input name="f_name" value="${sessionScope.user.m_nick}" type="hidden" style="width: 620px;">
		<input name="f_pwd" value="${sessionScope.user.m_pwd}" type="hidden" style="width: 620px;">
		<table width="750px" border="1" style="border-collapse: collapse;">
			<caption>:::새글 등록:::</caption>
			<tr>
				<td width="120" height="25">제목</td>
				<td colspan="3"><input name="f_subject" style="width: 620px;"></td>
			</tr>
			<tr>
				<td width="120" height="25">내용</td>
				<td colspan="3"><textarea name="f_content" rows="10" cols="84"></textarea></td>
			</tr>
		</table>
		<table width="750">
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td align="center" height="10"><img
					src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
					onclick="send_check();"> <img
					src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
					onclick="location.href='f_list.com'"></td>
			</tr>
		</table>
	</form>
</body>
</html>