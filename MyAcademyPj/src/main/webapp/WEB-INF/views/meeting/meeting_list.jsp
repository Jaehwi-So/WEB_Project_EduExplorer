<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
		<script type="text/javascript">
			function meeting_form(f) {
				f.action = "meeting_insert_form.do";
				f.submit();
				
			}
		</script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
		<style>
			#my_banner{ 
	            width : 1000px; height : 100px; margin : 20px auto; padding : 10px;
	            border : #403C00 2px solid;
	            color : white; 
				background: black;
				position:relative;
	        }
	        #my_banner h3{
	        font-size : 40px; font-family: 'Yellowtail', serif;
			color: #E5D700;
			text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
			letter-spacing : 2px;
	        }
	       	#my_banner p{
	        font-size : 16px;
	        }
	        #my_banner .vector{
	        	width: 150px; height: 80px; margin:10px;
	        	margin-left : 100px;
	        	float : left; position : absolute;
				top: 10px; left: 10px;
	        }
	       	 #my_banner .content{
	        	width: 700px; height: 40px; margin: 5px; float : right;
	        }
			table {
				margin-left: auto;
				margin-right: auto;
			}
			#meet_table, #meet_table td, #meet_table tr{
				border: 1px solid gray;
				border-width: 1px 0;
				border-collapse: collapse;
				text-align: center;
				height: 40px;
			}		
					
			#meet_table .titletd{
				background-color: #e5d700;
				font-size: 1.1em;
				color: #black;
				border-width: 2px 0; 
				padding: 6px;
			}			
			
			#input_query{
				margin: 15px auto;
				padding : 15px;
				background-color:black;
				color:white;
				font-family : 'Do Hyeon';
				font-size : 20px;
				width : 100px;
				height : 40px;
				text-align : center;
			}
			.m_button_div{
			width : 140px;
			height : 50px; margin : 10px auto; 
			}
			.m_button {
			width : 140px; height : 50px; padding : 10px; 
			font : 20px bold;
			font-family : Do Hyeon, "돋움체";
			background-color: #f5f2c4; 
			}
			.m_button:hover{
			cursor:pointer;
			}
		</style>
	</head>
	<body>
		<main>
			<div id="my_banner">
				<h3 align="center" style="color:'#A21CFF'">1:1 Q&A</h3>
				<div class="vector">
				<img src="${pageContext.request.contextPath}/resources/img/mypage_banner3.png" width="90px" height="90px">
				</div>
				<div class="content">
				<p>&bull; 점주에게 1:1 문의글을 쓸 수 있는 곳입니다.<br>
				</p>
				</div>
			</div>		
			<table border="1"width="1000" align="center" id="meet_table">
				<tr>
					<th class="titletd" width="400px" >제목</th>
					<th class="titletd">작성일</th>
					<th class="titletd">작성자</th>
					<th class="titletd">답변여부</th>
				</tr>
					<c:forEach var="vo" items="${list }">
						<input type="hidden" value="${vo.meeting_idx }">
						<tr>
							<td style="font-weight:bold;"><a href="meeting_view.do?meeting_idx=${vo.meeting_idx}">${vo.meeting_subject }</a></td>
							<td>${vo.meeting_regdate }</td>
							<td>${vo.meeting_writer }</td>
							<td>${vo.meeting_alam }</td>
						</tr>
					</c:forEach>
					
					<c:if test="${ empty list }">
					<tr>
						<td align="center" colspan="4"
							height="50">
							현재 등록된 게시글이 없습니다
						</td>										
					</tr>
					</c:if>
					<tr>
					 	<td colspan="4" align="center">${pagemenu}</td>	
					</tr>
			</table>
		
			<form>
				<input type="hidden" name="m_idx" value="${user.m_idx}">
				<input type="hidden" name="a_idx" value="${a_idx}">
				<br>
				<div class="m_button_div">
				<button class="m_button" onclick="meeting_form(this.form);">1:1 문의하기</button>
				</div>
			</form>	 
		</main>
	</body>
</html>

	