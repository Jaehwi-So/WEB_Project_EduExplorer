<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style type="text/css">
		*{margin:0; padding:0;}/*마진 패딩0  */
		li{ list-style:none;} /*리스트 점빼기  */
		a{ text-decoration:none;}/*a태그 밑줄지우기  */
		table{ border-collapse:collapse; }

			body{ width : 960px; margin: 0 auto; font-size:18px;}
			
			#header{position:relative; height: 150px;}
			
			#header div.a0{ color:blue; position: absolute; left:5px; top:10px;}	
			
			#header li{float:left;}
			
			#a1{position:absolute; right:0; top:3px;}				
			#a1 ul{ overflow:hidden; }
			#a1 ul li{ border-right: 1px solid gray;
					   border-top: 1px solid gray;
					   border-bottom: 1px solid gray;}
			#a1 ul li:nth-child(1){ border-left: 1px solid gray;}
			
			#a1 ul li a{background:skyblue; display:block; padding:2px 10px; color:#666;}
			#a1 ul li a:hover{ background:#999; color:#fff; }
			
			#a2{position: absolute; right:0; bottom:0;}
			#a2 ul{ overflow:hidden; }r
			#a2 ul li{ border-right: 1px solid blue;
					   border-top: 1px solid blue;
					   border-bottom: 1px solid blue;}
			#a2 ul li:first-child{ border-left:1px solid blue; }
			#a2 ul li a{background:Yellow; display:block; padding:10px 20px; color:#666; }
			#a2 ul li a:hover{ background:#aaf; color:#fff;}
	
	
	</style>
	</head>
	<script>
		function send_find() {
			location.href="a_list.com";
		}
		function send_service(){
			location.href="member_service.com";
			
		}
		function log_in() {
			location.href="login_form.com";
		}
		function log_out() {
			if(!confirm("로그아웃 하시겠습니까?")){
				return;	
			}
			alert("로그아웃되었습니다 메인페이지로 이동합니다.")
			location.href="logout.com";
		}
	</script>
	<body>
		<div id="header">
			<div id="a1">
				<c:if test="${!empty sessionScope.user}">
									${user.m_name}님 환영합니다
						<ul>
							<li>	
								<a onclick="log_out()">로그아웃</a>						
							</li>
							<li>
								<a onclick="location.href='mylecture.com'">내강의실</a>						
							</li>
							<li>
								<a onclick="location.href='main.com'";>메인</a>	
							</li>
						</ul>
					
					</c:if>
					
					<c:if test="${empty sessionScope.user }">
					
						<ul>
							<li>				
								<a onclick="log_in()">로그인</a>
							</li>
							<li>	
								<a onclick="location.href='main.com'";>메인</a>		
							</li>	
						</ul>
				</c:if>
			</div>

			<div id="a2">			
				<ul>
					<li>
					</li>
					<li>
					<a onclick="send_notice();">공지사항</a>
					</li>
					<li>
					<a onclick="send_find();">학원찾기</a>
					</li>
					<li>
					<a onclick="send_board();">자유게시판</a>
					</li>
					<li>
					<a onclick="send_service();">고객지원</a>
					</li>
				</ul>
			</div>
	</div>	
			
		
			
				
	</body>
</html>