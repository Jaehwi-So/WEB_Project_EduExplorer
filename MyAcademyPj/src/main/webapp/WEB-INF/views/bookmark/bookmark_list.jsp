<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../head/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 학원 : SpringSchool</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon'rel='stylesheet' type='text/css'>
	
	<style>
		#my_banner{
            width : 1200px; height : 100px; margin : 20px auto; padding : 10px;
            border : #403C00 2px solid;
            color : white; 
			background: black;
			position:relative;
        }
        #my_banner h3{
	        margin-left:200px;
	        font-size : 34px; font-family: 'Yellowtail', serif;
			color: #E5D700;
			text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
			letter-spacing : 2px;
        }
       	#my_banner p{
        	font-size : 15px;
        
        }
        #my_banner .vector{
        	width: 64px; height: 64px; margin:10px;
        	margin-left : 30px;
        	float : left; position : absolute;
			top: 10px; left: 10px;
        }
       	 #my_banner .content{
        	width: 600px; height: 40px; margin: 5px; float : center; margin-left: 200px;
        }
        
        /* 중단 네비게이션 css */
        #my_navi{
			position:relative; width : 1300px; height : 50px; margin : 0px auto; padding : 0px;
			z-index : 2; margin-left: 28px;
        }
		#my_navi ul{ overflow:hidden;}
		#my_navi ul li{ border-right: 2px solid #E5D700;
				   	float : left; text-align : center; font : 20px bold;
				   	}
		#my_navi ul li:first-child{ border-left:2px solid black; }
		#my_navi ul li:last-child{ border-right:2px solid black; }
		#my_navi ul li a{
			width:222px;
			height:35px; background-color : black;
			display:block; padding:10px 10px; color:#E5D700; margin:0px; 
			font : 22px bold; font-family : 'Do Hyeon', serif;
		}
		#my_navi ul li a:nth-child(2){ /* width : 160px; */ }
		#my_navi ul li a:hover{ background:#E5D700; color:black; cursor:pointer;}
		
		/* 중단 내용 css */
		#my_content{
			background: radial-gradient(farthest-corner at 10%, #BFB300, #ffee0080);
			position:relative; 
			width : 1160px; margin : 0px auto; padding : 30px;
			border : solid black 2px; z-index : 1;
			margin-top: 30px;
		}	
		#my_content .content_img{
			margin-left : 40px; width : 80px; height : 80px;
			float : left;
		}
		/* ==================================================== */
		#my_content .content_title{
			margin-left: 200px;
			width : 800px;
			padding-right : 30px;
			float : center;
		}
		#my_content .content_title p{
			font-size : 15px;
		}
		
		#my_content .content{
			background-color : white; position:relative; 
			width : 1000px; margin : 40px auto;
			padding : 30px; border : solid black 2px;
		}
		
		#my_content .content table{
			border-collapse: collapse; border : 3px outset black;
			text-align : center; width: 100%;
		}
		#my_content .content th, td{
			padding: 10px;
			border-bottom: 1.5px solid #403C00;
		}
		#my_content .label{
			background-color : #E5D700; 
		}
		#my_content .check{ 
			background-color: silver; 
			cursor:pointer;
		}
		#my_content .new{ 
			font-weight : bold;
			background-color: white; 
			cursor:pointer;
		}
		#my_content .check:hover{ 
			background-color: #ffee0080; 
		}
		#my_content .new:hover{ 
			background-color: #ffee0080;  
		}
		#my_content .new_blink{
			color : red;
		    animation: blink-animation 1s steps(5, start) infinite alternate;
 			    -webkit-animation: blink-animation 1s steps(5, start) infinite alternate;
		}
		@keyframes blink-animation {
		   from { visibility: visibility; }
		   to { visibility: hidden;}
		}
		@-webkit-keyframes blink-animation {
		   from {visibility: visibility;}
		   to {visibility: hidden;}
		}

		a.a_tag {text-decoration: none; color: blue; }
		a.a_tag_1 {text-decoration: none; color: red; }
		a.a_tag:hover {color: gray;}
		a.a_tag:active {color: white; background-color: black;}

		table {
			border-collapse: collapse;
			margin: auto;
			margin-top: 20px;
			font-size: 15px;
			border-top: 1px solid #444444;
			border: 3px outset black;
			border-collapse: collapse;
		}

		td, th {
			border-bottom: 1px solid #444444;
			text-align: center;
			padding: 15px;
		}

		th {background-color: #E5D700; color: #000000; }






</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function bm_delete(a_idx) {
			if(confirm("정말로 삭제하시겠습니까?")){
			var url = "bm_delete.do";
			var param = "m_idx=${user.m_idx}&a_idx="+a_idx;
			
			sendRequest(url,param,delete_resultFn,"POST");
			}
			return;
			
		}
		function delete_resultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){
				var data = xhr.responseText;
				var json = eval(data);
				if( json[0].param == 'yes' ){
					alert("즐겨찾기 삭제하였습니다!");
					location.href="bookmark.do?m_idx=${user.m_idx}";
				}else{
					alert("즐겨찾기 삭제오류 관리자에게문의하세요");
					location.href="member_service.do";					
				}	
			}
			
		}
	</script>
</head>
<body>

	<main>
		<!-- ============================상단부 배너================================ -->
		<div id="my_banner">
				<h3 style="color:'#A21CFF'">MYPAGE</h3>
				<div class="vector">
				<img src="${pageContext.request.contextPath}/resources/img/mypage_banner3.png" width="90px" height="90px">
				</div>
				<div class="content">
				<p>&bull; 내가 올린 게시물과 활동내역을 확인할 수 있는 공간입니다.<br>&bull; 즐겨찾기에 담은 학원 목록과 자신이 올린 학원 목록도 확인할 수 있습니다.
				</p>
				</div>
			</div>
		<!-- ============================상단부 배너================================ -->
		<hr>
		<br>
		<!-- ============================중단부 내용 네비게이션================================ -->
		<div id="my_navi">
			<ul>
				<li><a
					onclick="location.href='log_view.do?m_idx=${sessionScope.user.m_idx}'">
						<img
						src="${pageContext.request.contextPath}/resources/img/mypage_notice.png"
						style="display: inline;" width="25px" height="25px"> 새 알림
				</a></li>
				<li><a
					onclick="location.href='f_list_my.do?m_idx=${sessionScope.user.m_idx}'">
						<img
						src="${pageContext.request.contextPath}/resources/img/mypage_log.png"
						style="display: inline;" width="25px" height="25px"> 나의 게시물
				</a></li>
				<li><a
					onclick="location.href='f_list_myreply.do?m_idx=${sessionScope.user.m_idx}'">
						<img
						src="${pageContext.request.contextPath}/resources/img/mypage_comment.png"
						style="display: inline;" width="25px" height="25px"> 내가 댓글단
						게시물
				</a></li>
				<li><a
					onclick="location.href='bookmark.do?m_idx=${user.m_idx}'"> <img
						src="${pageContext.request.contextPath}/resources/img/mypage_bookmark.png"
						style="display: inline;" width="25px" height="25px"> 학원 즐겨찾기
				</a></li>
				<li><a
					onclick="location.href='get_myacademy.do?m_idx=${user.m_idx}'">
						<img
						src="${pageContext.request.contextPath}/resources/img/mypage_academy.png"
						style="display: inline;" width="25px" height="25px"> 내가 등록한
						학원
				</a></li>
			</ul>
		</div>
		<!-- ============================중단부 내용 네비게이션================================ -->

		<div id="my_content">
			<div class="content_img">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_bookmark.png" style="display:inline;" width="80px" height="80px">
				</div>
				<div class="content_title">
					<h1>학원 즐겨찾기</h1>
					<p>당신이 즐겨찾기한 학원의 목록을 표시합니다</p>
					<p>즐겨찾기를 통해서 관심있는 학원 정보를 빠르게 찾을 수 있습니다.</p>
				</div>
			<br>
			<div class="content">
				<table border="1" >

					<tr >

						<th name="th1">학원 이름</th>
						<th name="th1">학원 점주</th>
						<th name="th1">전화 번호</th>
						<th name="th1">학원 주소</th>
						<th colspan="2">비고</th>
					</tr>

					<c:if test="${ !empty list }">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td >${vo.a_name}</td>
								<td >${vo.a_owner}</td>
								<td >${vo.a_tel }</td>
								<td >${vo.a_addr }</td>
								
								<td><a class="a_tag_1" href="#"
									onclick="bm_delete('${vo.a_idx}')">즐겨찾기 삭제</a></td>
								<td><a class="a_tag" 
									href="a_list_detail.do?a_idx=${vo.a_idx}">상세보기</a></td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${ empty list }">
						<tr>
							<td colspan="8">즐겨찾기 목록없음</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
		<!-- ============================중단부 내용 컨텐츠================================ -->
	</main>
</body>
</html>