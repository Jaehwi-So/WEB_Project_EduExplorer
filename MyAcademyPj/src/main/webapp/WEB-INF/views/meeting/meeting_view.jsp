<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	
	<script type="text/javascript">
		
		function meeting_modify(f) {
			f.action = "meeting_modify_form.do";
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
			 #f_title {
				margin-left: 120px;
				font-size: 35px;
				font-weight : bold;
			}		
			#f_info {
				width : 1000px;
				margin-left: 120px;
				color: #0b1ab8;
				position : relative;
			}
			
			.f_writer {
				font-size: 20px;
				float : left;
			}
			
			.f_date {
				font-size: 15px;
			}
			
			#m_content_box{
			padding : 25px;
			margin: 0px auto;
			width : 1050px;
			background-color:rgb(244, 245, 250);
			border : black 1.5px solid; 
			}
			#m_content {
				margin : 0px auto;
				margin-left : 8px;
				margin-top : 20px;
				padding : 22px;
				border : black 1.5px solid; 
				background: white;
				height : 400px;
				overflow : auto;
				font-size : 19px;
				font-family : "돋움체";
			}
			.m_button_div{

			width : 140px; float : right;
			height : 50px; margin : 10px;
			}
			.m_button {
			width : 140px; height : 50px; padding : 10px; 
			font : 20px bold;
			font-family : Do Hyeon, "돋움체";
			background-color: #f5f2c4; 
			}
			.back_button {
			width : 140px; height : 50px; padding : 10px; 
			margin-left : 560px;
			margin-top : 45px;
			font : 20px bold;
			font-family : Do Hyeon, "돋움체";
			background-color: #f5f2c4; 
			cursor : pointer;
			}
			.m_button:hover{
			cursor:pointer;
			} 
			.content_font{
				font-size : 35px;
				font-weight : bold;
				margin : 10px;
				font-family : "Do Hyeon";
			}
	</style>
	
	</head>
	<body>
	<main>
	
		<hr style="margin:0px auto; width:1100px;" >
		<form name="f" method="post"> 
			<input type="hidden" value="${vo.meeting_idx }" name="meeting_idx">
			<input type="hidden" value="${vo.m_idx }" name="m_idx">
			<input type="hidden" value="${vo.a_idx }" name="a_idx">
			<div id="f_title">
					${vo.meeting_subject }
			</div>
			<div id="f_info">
				<div class="f_writer">
				<p>${ vo.meeting_writer }</p>
				<p class="f_date">${ vo.meeting_regdate }</p>
				</div>
				<c:if test="${vo.meeting_alam eq '대기' }">
					<div class="m_button_div" style="display: inline;">
						<!-- 수정 -->
						<input class="m_button" type="button" value="답변하기"
							onclick="meeting_modify(this.form);">
					</div>
				</c:if>
			</div>
			<br>
			<hr style="margin:0px auto; width:1100px;" ><br>
			<div id="m_content_box"> 
				<c:if test='${vo.meeting_photo ne "no_file"}'>
					<img src="${pageContext.request.contextPath}/resources/upload/${vo.meeting_photo}" width = "512px" height="512px" style="display:block; margin: 0px auto;">
				</c:if>
				<div class="content_font">&bull; 문의 내용</div><br><hr>
				<textarea id="m_content" rows= 10; cols="100" readonly>${vo.meeting_content}</textarea>
				<c:if test='${meeting_answer ne "&NotHaveAnswer"}'> 
				<div class="content_font">&bull; 문의 답변</div><br><hr>
					<textarea id="m_content" rows= 10; cols="100" readonly>${meeting_answer}</textarea>
				</c:if>
			</div>

		<input class="back_button" type="button" value="뒤로가기" onclick="location.href='meeting.do?m_idx=${user.m_idx}&a_idx=${vo.a_idx }'">
	
		</form>
	</main>
	</body>
</html>

