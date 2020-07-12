<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용하세요");
		location.href = "main.com";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
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
		if (f.f_pwd.value.trim() == '') {
			alert("비밀번호를 입력하세요")
			return;
		}
		f.submit();

	}
</script>

<style>
table {
	margin-left: auto;
	margin-right: auto;
	border-color: white;
}

table th {
	padding: 15px;
}

#f_write_reply {
	margin-left: 200px;
}
</style>

</head>
<body>
	<main>
		<div id="f_write_reply">
			<h1>답글 작성</h1>
		</div>
		<br>
		<hr>
		<br>
		<form name="f" method="post" action="f_reply.com">
			<input name="m_idx" type="hidden" value="${sessionScope.user.m_idx}">
			<input name="f_name" value="${sessionScope.user.m_nick}"
				type="hidden" style="width: 620px;"> <input name="f_pwd"
				value="${sessionScope.user.m_pwd}" type="hidden"
				style="width: 620px;"> <input type="hidden" name="f_idx"
				value="${param.idx}"> <input type="hidden" name="page"
				value="${param.page}">
			<table frame="void" width="1000px" border="1"
				style="border-collapse: collapse;">
				<tr>
					<th width="120" height="25">제목
					</td>
					<td colspan="3"><input name="f_subject" style="width: 715px;"></td>
				</tr>
				<tr>
					<th width="120" height="25">내용
					</td>
					<td colspan="3"><textarea name="f_content" rows="20" cols="100"></textarea></td>
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
	</main>
</body>
</html>