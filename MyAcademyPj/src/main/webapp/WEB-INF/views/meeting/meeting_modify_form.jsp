<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<c:if test="${res ne 'yes'}">
	<script>
	alert("권한이 없는 접근입니다");
	location.href="main.com";
	</script>
</c:if>    
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function send_modify(f) {
			f.action = "meeting_modify.com";
			f.submit();
		}
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
	<style>

		table {
			margin-left: auto;
			margin-right: auto;
			border-color: white;
		}
		
		table th {
			padding: 15px;
		}
		
		#m_write {
			margin-left: 600px;
			font-family: 'Do Hyeon';
			font-size: 20px;
		}		
		
		.m_button_div{
			width : 300px;
			height : 50px; margin : 10px auto; 
			}
		.m_button {
			width : 140px; height : 50px; padding : 10px; 
			font : 20px bold;
			font-family : Do Hyeon, "돋움체";
			background-color: #f5f2c4; 
		}

	</style>

	
	</head>
	<body>
		<main>
		<div id="m_write"> <h1>답변하기</h1> </div>
		<form name="f" method="post" action="meeting_insert.com"
			enctype="multipart/form-data">
			<input type="hidden" value="${vo.meeting_idx}" name="meeting_idx">
			<input type="hidden" value="${vo.m_idx }" name="m_idx">
			<input type="hidden" value="${vo.a_idx }" name="a_idx">
			<table width="750" border="1" style="border-collapse: collapse;">
	
				<tr>
					<td width="120" height="25">제목</td>
					<td colspan=""><input name="meeting_subject"
						value="${vo.meeting_subject }" style="width: 620px;"></td>
				</tr>
	
				<tr>
					<td width="120" height="25">내용</td>
					<td colspan=""><textarea name="meeting_content" rows="10"
							cols="84">${vo.meeting_content }</textarea></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="m_photo"></td>
				</tr>
				<tr>
					<td width="120" height="25">상태</td>
					<td colspan="">
						<input type="hidden" name="meeting_alam" value="답변완료">
					</td>
				</tr>
	
			</table>
	
			<table width="750">
				<tr>
					<td height="10"></td>
				</tr>
	
				<tr>
					<td align="center">
						<div class="m_button_div">
						<input class="m_button" type="button" value="수정하기" onclick="send_modify(this.form);"> 
						<input class="m_button" type="button" value="취소하기" onclick="location.href='meeting.com?m_idx=${vo.m_idx}'">
						</div>
					</td>
				</tr>
	
			</table>
	
		</form>
		</main>
	</body>
</html>