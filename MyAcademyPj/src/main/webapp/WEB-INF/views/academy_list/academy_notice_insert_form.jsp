<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
	
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
		
		.util_btn{
			width : 70px; height : 35px;
			cursor : pointer;
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
				if( f.a_notice_content.value > 1000 ){
					alert("내용은 1000자 이내로 입력해주세요");
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
		
		<form name="f" method="post" action="a_notice_insert.do" enctype="multipart/form-data">
		<input type="hidden" value="${a_idx}"  name="a_idx"> 
			<table frame="void" style="border-collapse: collapse; font-size:25px;">
				<tr>
					<th width="100px">제목</th>
					<td width="700px"><input name="a_notice_subject" style="width:1080px; height: 30px; font-size:20px;" ></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input value="${a_owner}" name="a_owner" style="width:1080px; height: 30px; font-size:20px;" readonly></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
					<textarea name="a_notice_content" rows="20" cols="100" style="font-size:20px;"></textarea>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="a_photo" style="font-size:20px;"></td>
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
						onclick="location.href='a_list_detail.do?a_idx=${a_idx}&page=${page}'" class="util_btn"> 
					</td>
				</tr>
			</table>
		</form>
		
	</main>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>