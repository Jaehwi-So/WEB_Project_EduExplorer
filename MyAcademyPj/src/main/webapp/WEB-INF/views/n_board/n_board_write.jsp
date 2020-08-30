<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<c:if test="${sessionScope.user.m_type ne '관리자'}">
	<script>
		alert("권한이 없는 접근입니다.");
		location.href = "n_list.do";
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
	
	<style>
		table {
			margin-left: auto;
			margin-right: auto;
			border-color: white;
		}
		
		table th {
			padding: 15px;
		}
		
		#n_write {
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
		<div id="n_write">
			<img
				src="${pageContext.request.contextPath}/resources/img/titleWrite.png"
				width="80px" height="80px" 
				style="display: inline; vertical-align: middle">
			<h1 style="display: inline;">게시글 작성</h1>
		</div>
		<br>
		<hr>
		<br>
		<form name="f" method="post" action="n_insert.do">
			<input name="m_idx" type="hidden" value="${sessionScope.user.m_idx}">
			<input name="n_name" type="hidden"
				value="${sessionScope.user.m_name}"> <input name="n_pwd"
				type="hidden" value="${sessionScope.user.m_pwd}">
			<table frame="void" style="border-collapse: collapse; font-size:25px;">
					<tr>
						<th width="100px">제목</th>
						<td width="700px"><input name="n_subject" style="width:1080px; height: 30px; font-size:20px;" ></td>
					</tr>
	
					<tr>
						<th>내용</th>
						<td>
						<textarea name="n_content" rows="20" cols="100" style="font-size:20px;"></textarea>
						</td>
					</tr>
				</table>

			<table width="750">
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
					<td align="center">
						<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
						onclick="send_check();" class="util_btn"> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
						onclick="location.href='n_list.do'" class="util_btn">
					</td>
				</tr>
			</table>
		</form>
	</main>
		<%@ include file="../head/footer.jsp" %>
</body>
</html>