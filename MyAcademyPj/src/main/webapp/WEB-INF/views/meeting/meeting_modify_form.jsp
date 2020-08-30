<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<c:if test="${res ne 'yes'}">
	<script>
	alert("권한이 없는 접근입니다");
	location.href='meeting.do?m_idx=${user.m_idx}&a_idx=${vo.a_idx }';
	</script>
</c:if>    
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function send_modify(f) {
			f.action = "meeting_modify.do";
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
			cursor:pointer;
		}

	</style>

	
	</head>
	<body>
		<main>
		<div id="m_write"> <h1>답변하기</h1> </div>
		<form name="f" method="post" action="meeting_insert.do"
			enctype="multipart/form-data">
			<input type="hidden" value="${vo.meeting_idx}" name="meeting_idx">
			<input type="hidden" value="${vo.m_idx }" name="m_idx">
			<input type="hidden" value="${vo.a_idx }" name="a_idx">
			<input type="hidden" name="meeting_alam" value="답변완료">
			<table frame="void" style="border-collapse: collapse; font-size:25px;">
				<tr>
					<th width="150px">제목</th>
					<td width="650px"><input name="meeting_subject" value="${vo.meeting_subject }" style="width:1080px; height: 30px; font-size:20px;" readonly></td>
				</tr>
		
				<tr>
					<th>문의 내용</th>
					<td>
					<textarea name="meeting_content" rows="20" cols="100" style="font-size:20px;" readonly>${vo.meeting_content }</textarea>
					</td>
				</tr>
				<tr>
					<th>답변</th>
					<td>
					<textarea name="meeting_answer" rows="20" cols="100" style="font-size:20px;"></textarea>
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
						<input class="m_button" type="button" value="답변 완료" onclick="send_modify(this.form);"> 
						<input class="m_button" type="button" value="취소하기" onclick="location.href='meeting_view.do?meeting_idx=${vo.meeting_idx}'">
						</div>
					</td>
				</tr>
	
			</table>
	
		</form>
		</main>
	</body>
</html>