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
		
		.button2{border: 0;}

	</style>
	
		<script type="text/javascript">
			function send_modify(f) {
				f.action = "a_notice_modify.com";
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
			<h1 style="display: inline;">게시글 수정</h1>
		</div>
		<br>
		<hr>
		<br>
		
		<form name="f" method="post" action="a_notice_insert.com" enctype="multipart/form-data">
			<input type="hidden" value="${vo.a_notice_idx}" name="a_notice_idx">
			<input type="hidden" value="${vo.a_idx }" name="a_idx">
			<table frame="void" width="1000" border="1" style="border-collapse: collapse;">				
				<tr>
					<td width="120" height="25">제목</td>
					<td colspan="3">
						<input name="a_notice_subject" value ="${vo.a_notice_subject }" style="width:715px;">
					</td>
				</tr>
				<tr>
					<td width="120" height="25">작성자</td>
					<td colspan="3">
						<input name="a_owner" value ="${vo.a_owner }" style="width:715px;">
					</td>
				</tr>
				
				<tr>
					<td width="120" height="25">내용</td>
					<td colspan="3">
						<textarea name="a_notice_content" rows="20" cols="100">${vo.a_notice_content }</textarea>
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
						<!-- a태그가 아니면 send_check(this.form);사용 못함-->
						
						<button type="button" class="button2" onclick="send_modify(this.form);">
						<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"></button>
										 
						<img src="${pageContext.request.contextPath}/resources/img/btn_back.gif"
							 onclick="location.href='a_list_detail.com?a_idx=${vo.a_idx}'">	 
					</td>
				</tr>
			</table>
		</form>
		
	</main>	
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>