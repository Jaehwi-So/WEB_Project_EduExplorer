<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 상세보기</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function delete_board() {
		var type = "${sessionScope.user.m_type}";
		if(type != '관리자'){
			alert("권한이 없는 접근입니다.");
			return;
		}
		if (confirm("정말로 삭제하시겠습니까?")) {
			var url = "n_del.com?n_idx=${vo.n_idx}";
			sendRequest(url, null, resultFn, "POST");
		}
	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);
			if (json[0].result == 'yes') {
				alert("글을 삭제했습니다.");
				location.href = "n_list.com?page=${param.page}";
			} else {
				alert("삭제실패!");
				return;
			}//if 2번
		}//if 1번

	}
</script>

</head>
<body>

	<form name="f" action="post">
		<table width="690" border="1" style="border-collapse: collapse;">

			<tr>
				<td width="120" height="25">제목</td>
				<td>${vo.n_subject}</td>
			</tr>
			<tr>
				<td width="120" height="25">작성자</td>
				<td>${vo.n_name}</td>
			</tr>
			<tr>
				<td width="120" height="25">작성일</td>
				<td>${vo.n_regdate}</td>
			</tr>

			<tr>
				<td width="120">내용</td>
				<td style="padding: 5px" width="570">
					<!-- 화면의 내용을 엔터값까지 그대로 표기 --> <pre>${vo.n_content}
			</pre>
				</td>
			</tr>
			<tr>
				<td width="120" height="25">비밀번호</td>
				<td><input type="password" id="c_pwd"></td>
			</tr>
		</table>

		<table width="690">
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td height="10">
					<!-- 목록보기 버튼 --> <img
					src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
					onclick="location.href='n_list.com?page=${param.page}'">
					<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif"
					onclick="delete_board();">
					응
				</td>
			</tr>

		</table>

	</form>


</body>
</html>