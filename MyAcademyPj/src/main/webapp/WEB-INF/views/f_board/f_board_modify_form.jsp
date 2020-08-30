<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용하세요");
		location.href = "main.do";
	</script>
</c:if>
<c:if test="${vo.del_info eq -1}">
	<script>
		alert("이미 삭제되거나 없는 게시물입니다.");
		location.href = "main.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세상의 모든 학원 : SpringSchool</title>
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
		
		#f_modify {
			margin-left: 500px;
			font-family: 'Do Hyeon';
			font-size: 20px;
		}
		.util_btn{
			width : 70px; height : 35px;
			cursor : pointer;
		}
		</style>
	</head>
	<body>
		<main>
			<div id="f_modify">
				<img
					src="${pageContext.request.contextPath}/resources/img/titleWrite.png"
					width="80px" height="80px" 
					style="display: inline; vertical-align: middle">
				<h1 style="display: inline;">게시글 수정</h1>
			</div>
			<br><hr><br>
			<form method="post" action="f_modify.do" name="f">
				<input name="page" type="hidden" value="${ empty param.page ? 1 : param.page}">
				<input name="keyword" type="hidden" value='${ empty param.keyword ? "" : param.keyword}'>
				<input name="m_idx" type="hidden" value="${sessionScope.user.m_idx}">
				<input name="f_name" value="${sessionScope.user.m_nick}"
					type="hidden"> <input name="f_pwd"
					value="${sessionScope.user.m_pwd}" type="hidden"> <input
					name="f_idx" value="${vo.f_idx}" type="hidden">
					
				<table frame="void" style="border-collapse: collapse; font-size:25px;">
					<tr>
						<th width="100px">제목</th>
						<td width="700px"><input value="${vo.f_subject}" name="f_subject" style="width:1080px; height: 30px; font-size:20px;" ></td>
					</tr>
	
					<tr>
						<th>내용</th>
						<td>
						<textarea name="f_content" rows="20" cols="100" style="font-size:20px;">${vo.f_content}</textarea>
						</td>
					</tr>
				</table>

				<table width="750">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td align="center" height="10">
						<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
						class="util_btn" onclick="send_check();"> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
						class="util_btn" onclick="location.href='f_view.do?f_idx=${param.f_idx}&page=${ empty param.page ? 1 : param.page}&keyword=${ empty param.keyword ? '' : param.keyword}'"></td>
					</tr>
				</table>
			</form>
		</main>
		<%@ include file="../head/footer.jsp"%>
	</body>
</html>