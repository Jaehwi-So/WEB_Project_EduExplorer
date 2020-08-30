<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 학원 : SpringSchool</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
	<script type="text/javascript">
		function send_check() {
			var f = document.f;//폼태그를 이름으로 검색
			
			//유효성 체크
			if( f.meeting_subject.value.trim() == '' ){
				alert("제목은 반드시 입력해야 합니다");
				return;
			}
			
			if( f.meeting_content.value.trim() == '' ){
				alert("내용은 한글자 이상 입력해야 합니다");
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
	<div id="m_write"> <h1>1:1 문의</h1> </div>
	<br>
	<hr>
	<br>
	<form name="f" method="post" action="meeting_insert.do" enctype="multipart/form-data">
		<input type="hidden" value="${user.m_idx }" name="m_idx">
		<input type="hidden" value="${param.a_idx}" name="a_idx">
		<input type="hidden" value="${user.m_id }" name="meeting_writer">
		<input type="hidden" name="meeting_alam" value="대기">
		<table frame="void" style="border-collapse: collapse; font-size:25px;">
			<tr>
				<th width="150px">제목</th>
				<td width="650px"><input name="meeting_subject" style="width:1080px; height: 30px; font-size:20px;" ></td>
			</tr>
	
			<tr>
				<th>내용</th>
				<td>
				<textarea name="meeting_content" rows="20" cols="100" style="font-size:20px;"></textarea>
				</td>
			</tr>
			<tr>
				<th>이미지 첨부</th>
				<td>
					<input type="file" name="m_photo" rows="10" cols="84">
				</td>
			</tr>	
		</table>
				
		<table width="750">
			<tr>
				<td height="10"></td>
			</tr>
			
			<tr>
				<td align="center">
				<div class="m_button_div" >

					<input class="m_button" type="button" value="질문 등록"
						 onclick="send_check();">
						 
					<input class="m_button" type="button" value="취소하기"
						 onclick="location.href='meeting.do?m_idx=${user.m_idx}&a_idx=${param.a_idx}'">	
				</div> 
				</td>
			</tr>
		
		</table>
	
	</form>
	</main>

</body>
</html>