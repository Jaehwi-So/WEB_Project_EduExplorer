<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function delete_board() {
		var type = "${sessionScope.user.m_type}";
		if (type != '관리자') {
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

<style>
table {
	margin-left: auto;
	margin-right: auto;
}

#info_hr {
	margin: 0px auto;
}

#n_title {
	margin-left: 120px;
}

.n_title {
	font-size: 35px;
}

#n_info {
	margin-left: 120px;
	color: #0b1ab8
}

.n_writer {
	font-size: 20px;
}

.n_date {
	font-size: 20px;
}

#n_content {
	padding : 20px;
	margin-right : 110px;
	border : black 1.5px solid;
	background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
	margin-left: 120px;
	font-family : "돋움체";
	font-size : 20px;
	height : 500px;
	overflow : auto;
}

#n_menu {
	margin-left: 120px;
}
</style>

</head>
<body>
	<main>
		<form name="f" action="post">
			<div id="n_title">
				<p class="n_title">${ vo.n_subject }</p>
			</div>

			<div id="n_info">
				<p class="n_writer">${ vo.n_name }</p>
				<p class="n_date">${ vo.n_regdate }</p>
			</div>
			<input type="hidden" id="c_pwd" value="${vo.n_pwd}">
			<table width="690" border="1" style="border-collapse: collapse;">
				<br>
				<hr id="info_hr" width="1100px">
				<br>

				<div id="n_content">
					<pre>${ vo.n_content }</pre>
				</div>

			</table>

			<br>
			<hr id="info_hr" width="1100px">
			<br>

			<table width="690" id="n_menu">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td height="10">
						<!-- 목록보기 버튼 --> <img
						src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
						onclick="location.href='n_list.com?page=${param.page}'"> <img
						src="${pageContext.request.contextPath}/resources/img/btn_delete.gif"
						onclick="delete_board();">
					</td>
				</tr>

			</table>

		</form>

	</main>
	<%@ include file="../head/footer.jsp" %>
</body>
</html>