<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<title>게시판</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
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

			.table_head{
				font-weight : bold;
				background-color: #e5d700;
			}
			.board_content:hover{
				background-color: #ffee0080;  
				cursor:pointer;
			}

		</style>
		<script type="text/javascript">
		function go_detail(del_info, f_idx){
			if(del_info != -1){
				location.href="f_view.com?f_idx="+f_idx;
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
			
			<div id="my_content">
				<c:if test='${info eq "post"}'>
					<div class="content_img">
						<img src="${pageContext.request.contextPath}/resources/img/mypage_log.png" style="display:inline;" width="80px" height="80px">
					</div>
					<div class="content_title">
						<h1>나의 게시물</h1>
						<p>자유게시판에 내가 올린 게시물을 최근 날짜 순으로 조회합니다.</p>
						<p>원글의 경우 답글을 포함하여, 답글의 경우 이전의 원글을 포함하여 조회합니다.</p>
					</div>
				</c:if>
				<c:if test='${info eq "comment"}'>
					<div class="content_img">
						<img src="${pageContext.request.contextPath}/resources/img/mypage_comment.png" style="display:inline;" width="80px" height="80px">
					</div>
					<div class="content_title">
						<h1>댓글 단 게시물</h1>
						<p>자유게시판에 댓글을 달았던 게시물을 최근 날짜 순으로 조회합니다.</p>
						<p>원글의 경우 답글을 포함하여, 답글의 경우 이전의 원글을 포함하여 조회합니다.</p>
					</div>
				</c:if>
				<br>
				<div class="content">
					<table width="700" align="center">	
						<tr>
							<td>
								<table width="690">
									<!-- tr1 -->
									<tr>
										<td>
											<table width="690">
												<tr class="table_head">
													<td width="50" class="td_a">번호</td>											
													<td width="300" class="td_b">제목</td>													
													<td width="90" class="td_b">작성자</td>												
													<td width="90" class="td_b">작성일</td>												
													<td width="60" class="td_c">조회수</td>
												</tr>
												<c:forEach var="vo" items="${f_list}">
													<tr class="board_content" onclick="go_detail(${vo.del_info}, ${vo.f_idx });">
														<td align="center" class="td_a_1">${vo.f_idx}</td>
														<td align="center" class="td_b_1 left">
															<!-- 댓글 들여쓰기 --> <c:forEach begin="1" end="${vo.f_depth}">
														&nbsp;
														</c:forEach> <c:if test="${vo.f_depth ne 0}">
														└
														</c:if> <!-- del_info가 -1이 아닌 경우 --> <c:if
																test="${vo.del_info ne -1}">       
															${vo.f_subject}
														
															</c:if> <!-- del_info가 -1인 경우 --> <c:if test="${vo.del_info eq -1}">
																<span style="color: #a014a0;">${vo.f_subject }</span>
															</c:if>
														</td>					
														<td align="center" class="td_b_1">${vo.f_name}</td>
														<td align="center" class="td_b_1">${vo.f_regdate}</td>													
														<td align="center" class="td_c_1">${vo.f_readhit}</td>
													</tr>
												</c:forEach>
				
												<!-- 데이터가 없는 경우 -->
												<c:if test="${empty f_list }">
													<tr>
														<td align="center" colspan="11" height="50"><b>현재 등록된
																게시글이 없습니다</b></td>
				
													</tr>
				
												</c:if>
				
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table width="690" bgcolor="#f1f5f4">
												<tr>
													<td class="f11" align="center">${pagemenu_f}</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				
				</div>
			</div>
			<!-- ============================중단부 내용 컨텐츠================================ -->
		
		</main>
	</body>
</html>