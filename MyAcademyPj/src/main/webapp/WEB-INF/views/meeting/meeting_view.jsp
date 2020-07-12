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
			f.action = "meeting_modify_form.com";
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
				font-size: 30px;
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
			
			#f_content {
				padding : 20px;
				margin-right : 110px;
				border : black 1.5px solid;
				background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
				margin-left: 120px;
				margin-bottom : 20px;
				height : 600px;
				overflow : auto;
				font-size : 20px;
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
			.m_button:hover{
			cursor:pointer;
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
			<div id="f_content">
				<pre>${vo.meeting_content }</pre>
				<img src="${pageContext.request.contextPath }/resources/upload/${vo.meeting_photo}"
						width="300" height="300" />
			</div>
			


	
		</form>
	</main>
	</body>
</html>

