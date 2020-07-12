<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href='https://fonts.googleapis.com/css?family=BlackHanSans'
	rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
	
		
		<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

		table {
		margin-left: auto;
		margin-right: auto;
		border-color: white;
		}

		table th {
		padding: 15px;
		}

		#a_write {
		margin-left: 500px;
		font-family: 'Do Hyeon';
		font-size: 20px;
		}	
		</style>
		
		<script type="text/javascript">
			function send_check() {
				var f = document.f;//폼태그를 이름으로 검색
				
				//유효성 체크
				if( f.a_notice_subject.value.trim() == '' ){
					alert("제목은 반드시 입력해야 합니다");
					return;
				}
				
				if( f.a_notice_content.value.trim() == '' ){
					alert("내용은 한글자 이상 입력해야 합니다");
					return;
				}
				
				
				f.submit();
				
			}
		</script>
	</head>
	<body>
	<main>
		<div id="a_write">
			<img
				src="${pageContext.request.contextPath}/resources/img/titleWrite.png"
				width="80px" height="80px" 
				style="display: inline; vertical-align: middle">
			<h1 style="display: inline;">새소식 작성</h1>
		</div>
		<br>
		<hr>
		<br>
		
		<form name="f" method="post" action="a_notice_insert.com" enctype="multipart/form-data">
		<input type="hidden" value="${a_idx}"  name="a_idx">
			<table frame="void" width="1000" border="1" style="border-collapse: collapse;">
				
				<tr>
					<td width="120" height="25">제목</td>
					<td colspan="3">
						<input name="a_notice_subject" style="width:715px;">
					</td>
				</tr>
				<tr>
					<td width="120" height="25">작성자</td>
					<td colspan="3">
						<input value="${a_owner}" name="a_owner" readonly>
					</td>
				</tr>
				
				<tr>
					<td width="120" height="25">내용</td>
					<td colspan="3">
						<textarea name="a_notice_content" rows="20" cols="100"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>사진</td>
					<td><input type="file" name="a_photo"></td>
				</tr>
				
			</table>
			
			<table width="750">
				<tr>
					<td height="10"></td>
				</tr>
				
				<tr>
					<td align="center">
						<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
						onclick="send_check();">
						<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
						onclick="location.href='a_list_detail.com?a_idx=${a_idx}'"> 
					</td>
				</tr>
			</table>
		</form>
		
	</main>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>