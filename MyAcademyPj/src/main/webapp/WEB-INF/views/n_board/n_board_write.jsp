<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<c:if test="${sessionScope.user.m_type ne '관리자'}">
	<script>
	alert("권한이 없는 접근입니다.");
	location.href="n_list.com";
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
		if (f.n_subject.value.trim() == '') {
			alert("제목을 입력하세요")
			return;
		}
		if (f.n_content.value.trim() == '') {
			alert("내용을 입력하세요")
			return;
		}

		f.submit();

	}
</script>
</head>
<body>

	<form name="f" method="post" action="n_insert.com">
		<input name="m_idx" type="hidden" value="${sessionScope.user.m_idx}">
		<input name="n_name" type="hidden" value="${sessionScope.user.m_name}">
		<input name="n_pwd" type="hidden" value="${sessionScope.user.m_pwd}">
		<table width="750px" border="1" style="border-collapse: collapse;">
			<caption>:::새글 등록:::</caption>

			<tr>
				<td width="120" height="25">제목</td>
				<td colspan="3"><input name="n_subject" style="width: 620px;">
				</td>
			</tr>
			<tr>
				<td width="120" height="25">내용</td>
				<td colspan="3"><textarea name="n_content" rows="10" cols="84"></textarea>
				</td>
			</tr>
		</table>

		<table width="750">
			<tr>
				<td height="10"></td>
			</tr>

			<tr>
				<td align="center"><img
					src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
					onclick="send_check();"> <img
					src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
					onclick="location.href='n_list.com'"></td>
			</tr>
		</table>
	</form>

</body>
</html>