<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../head/header.jsp" %>
 <c:if test="${ empty sessionScope.user }">
<script>
alert("로그인 후 이용하세요");
location.href="main.com";
</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
			//URL의 존재 여부 확인
		 	function urlExists(url){
	        	var http_status  ="";
	         	var http = new XMLHttpRequest();
	         	http.open('HEAD', url, false);
	         	http.send();
	         	http_status = http.status;
	        	return http_status;	//존재하지 않을 시 404반환
	       	}
		  
		  	function go_url(url, idx){
			  	var exist = urlExists(url);
			  	if(exist == 404){
					  alert("삭제되거나 존재하지 않는 게시물입니다.");
					  return;
			 	 }
			 	else{
					var url = "log_update.com?url=" + url + "&log_idx=" + idx;
					sendRequest(url, null, go_resultFn, "POST");	//방문표시 하러 컨트롤러로 이동
			  	}
		  	}
		  	
			function go_resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					var url = json[0].url;
					location.href = url;
				}
			}
		</script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
		<style>

		
		/* ==================================================== */
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

		</style>
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
			<hr><br>

		<!-- ============================중단부 내용 네비게이션================================ -->
			<div id="my_navi">			
				<ul>
					<li>
					<a onclick="location.href='log_view.com?m_idx=${sessionScope.user.m_idx}'">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_notice.png" style="display:inline;" width="25px" height="25px">
					새 알림
					</a>
					</li>
					<li>
					<a onclick="location.href='f_list_my.com?m_idx=${sessionScope.user.m_idx}'">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_log.png" style="display:inline;" width="25px" height="25px">
					나의 게시물
					</a>
					</li>
					<li>
					<a onclick="location.href='f_list_myreply.com?m_idx=${sessionScope.user.m_idx}'">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_comment.png" style="display:inline;" width="25px" height="25px">
					내가 댓글단 게시물
					</a>
					</li>
					<li>
					<a onclick="location.href='bookmark.com?m_idx=${user.m_idx}'">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_bookmark.png" style="display:inline;" width="25px" height="25px">
					학원 즐겨찾기
					</a> 
					</li>
					<li>
					<a onclick="location.href='get_myacademy.com?m_idx=${user.m_idx}'">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_academy.png" style="display:inline;" width="25px" height="25px">
					내가 등록한 학원
					</a>
					</li>
				</ul>
			</div>
			<!-- ============================중단부 내용 네비게이션================================ -->
			
			<!-- ============================중단부 내용 컨텐츠================================ -->
			<div id="my_content">
				<div class="content_img">
					<img src="${pageContext.request.contextPath}/resources/img/mypage_notice.png" style="display:inline;" width="80px" height="80px">
				</div>
				<div class="content_title">
					<h1>새 알림</h1>
					<p>당신의 계정의 새로운 소식을 최신 순으로 15건 표시합니다.</p>
					<p>당신의 게시글에 새로운 댓글이 달리거나 학원과의 1:1 문의의 질의와 답변이 달릴시 화면에 표시됩니다</p>
				</div>
				<br>
				<div class="content">
	
				<table border="1">
					<tr class="label">
						<th>알림</th>
						<th>등록일</th>
					</tr>
					<c:forEach var="i" begin="0" end="14" step="1">
						<c:if test="${not empty reply_list[i]}">
							<c:if test="${reply_list[i].log_ck eq 1}">
							<tr class="check" onclick="go_url('${reply_list[i].log_url}', '${reply_list[i].log_idx}');">
									<td>
									
									이미 확인한 소식입니다
									
									</td>
									<td>
										${reply_list[i].log_regdate }
									</td>
							</tr>
							</c:if>
							<c:if test="${reply_list[i].log_ck eq 0}">
							<tr class="new" onclick="go_url('${reply_list[i].log_url}', '${reply_list[i].log_idx}');">
									<c:if test="${reply_list[i].log_type eq 1}">
										<td>
										<span class="new_blink">NEW! </span>
										새로운 댓글을 확인하세요!
										</td>
									</c:if>
									
									<c:if test="${reply_list[i].log_type eq 2}">
										<td>
										<span class="new_blink">NEW! </span>
										새로운 문의가 들어왔습니다!
										</td>
									</c:if>
									
									<c:if test="${reply_list[i].log_type eq 3}">
										<td>
										<span class="new_blink">NEW! </span>
										답변이 완료되었습니다!
										</td>
									</c:if>
									
									<td>
										${reply_list[i].log_regdate }
									</td>
									
							</tr>
							</c:if>
							
							
							
						</c:if>
					</c:forEach>
				</table>
				</div>
			</div>
			<!-- ============================중단부 내용 컨텐츠================================ -->
		</main>
			<%@ include file="../recommend/recommend.jsp" %>
		<%@ include file="../head/footer.jsp" %>
	</body>
	<style>

	</style>
</html>