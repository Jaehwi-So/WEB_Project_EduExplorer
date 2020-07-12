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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

	<link href="${pageContext.request.contextPath }/resources/css/main.css">
	<style type="text/css">
	#main_box{border: 2px solid black; width: 1320px; height: auto;
			  margin: 0 auto; margin-top:30px;}
	#box_head{ border:2px solid black; height: 100px;}		  
	#tb_menu{ margin: 0 auto; border-collapse: collapse; width: 1000px; height: 150px; text-align: center;
			  margin-top: 30px; margin-bottom: 30px;}
	.a_btn{width: 250px; height: 150px; display: inline-block;  vertical-align: middle; line-height: 150px;
			color: white;  background : black;
			border-radius: 10px 10px;
			font-size: 60px;
			font-family: 'Nanum Brush Script', cursive;}	
			
	#reg_btn{ border-right:5px solid #FFEF00;}	
	#out_btn{ border-right:5px solid #FFEF00;}	
	#faq_btn{ border-right:5px solid #FFEF00;}	
	#reg_btn:hover{background: #E5D700; color: #2d3a4b;
	border-left: 5px solid white;
	border-top: 5px solid white;
	border-right: 5px solid white;
	border-bottom: 5px solid black;
	border-radius: 10px 10px;}	
	#out_btn:hover{background: #E5D700; color: #2d3a4b;
	border-left: 5px solid white;
	border-top: 5px solid white;
	border-right: 5px solid white;
	border-bottom: 5px solid black;
	border-radius: 10px 10px;}
	#faq_btn:hover{background: #E5D700; color: #2d3a4b;
	border-left: 5px solid white;
	border-top: 5px solid white;
	border-right: 5px solid white;
	border-bottom: 5px solid black;
	border-radius: 10px 10px;}
	#request_btn:hover{background: #E5D700; color: #2d3a4b;
	border-left: 5px solid white;
	border-top: 5px solid white;
	border-right: 5px solid white;
	border-bottom: 5px solid black;
	border-radius: 10px 10px;}
	
	#box_head {width:780px; height: 60x; background: black; margin: 0 auto; text-align: center;
				vertical-align: middle; line-height: 100px; margin-top : 30px;
				border-radius: 20px 20px 20px 20px;}
	#box_head h1{display: inline-block;
				margin: 0 auto;
				font-size : 60px; font-family: 'Nanum Brush Script', cursive;
				color: #E5D700;
				text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
				letter-spacing : 2px;}			 
	#box_head img{display: inline-block; vertical-align: middle; margin-bottom: 20px;}
	
	
	.ul_box li{margin-top:30px; margin-bottom:20px; margin-left: 50px;
				font-size:18px; position: relative;}
	.ul_box img{ vertical-align: middle; line-height: 30px; margin-bottom:5px; margin-right:10px;}
	.down_arr{ position:absolute;
				right : 30px; top :0px; 
				display: inline-block;}
	</style>
	
	<script type="text/javascript">
		function member_del() {
			if( !confirm("회원탈퇴 하시겠습니까?")){
				return;
			}
			if( !confirm("정말탈퇴 하시겠습니까?")){
				return;
			}
			if( !confirm("마지막으로 탈퇴 하시겠습니까?")){
				return;
			}
				var url = "member_del.com?m_idx=${user.m_idx}";
				sendRequest(url,null,del_resultFn,"POST");
						
		}
		
		function del_resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				var json = eval(data);
				
				if(json[0].param == "yes"){
					alert("회원탈퇴하셧습니다 메인페이지로 이동");
					location.href="main.com";
					
				}else{
					alert("회원탈퇴 실패")
					location.href="main.com";
				}
				
				}
		}
		
		
		function btn_1() {
			
			var btn_1 = document.getElementById("btn_1_box");
			btn_1.innerHTML = "비밀번호 찾기는 뭐랍니까?";		
			
		}
		function btn_2() {
			
			var btn_2 = document.getElementById("btn_2_box");
			btn_2.innerHTML = "눈이 없으세요??";		
			
		}
		function btn_3() {
			
			var btn_3 = document.getElementById("btn_3_box");
			btn_3.innerHTML = "안녕하세요?";		
			
		}
		function btn_4() {
			
			var btn_4 = document.getElementById("btn_4_box");
			btn_4.innerHTML = "식사들하셧어요?";		
			
		}
		function btn_5() {
			
			var btn_5 = document.getElementById("btn_5_box");
			btn_5.innerHTML = "무슨 말을해야할지?";		
			
		}
		function btn_6() {
			
			var btn_6 = document.getElementById("btn_6_box");
			btn_6.innerHTML = "모르겟네요?";		
			
		}
		function btn_7() {
			
			var btn_7 = document.getElementById("btn_7_box");
			btn_7.innerHTML = "지리고 지지고 볶고?";		
			
		}
		function btn_8() {
			
			var btn_8 = document.getElementById("btn_8_box");
			btn_8.innerHTML = "ㅋㅋㅋ프로젝트 수고!?";		
			
		}
		function btn_9() {
			
			var btn_9 = document.getElementById("btn_9_box");
			btn_9.innerHTML = "수고하셧브니다?";		
			
		}
	</script>	
</head>
<body>	
		
		<main>
		
		
		
		<div id="main_box">
			
			<div id="box_head">
			
				<img src="${pageContext.request.contextPath }/resources/img/login_user.png" width="50px" height="50px">
				<h1>고객지원</h1>
				
				
			</div>
				
				<table id="tb_menu" align="center">
					<tr>
						<td width="25%"><a id="reg_btn"  class="a_btn" href="#" 
						onclick="window.open('member_update.com', '_blank', 
						'width=1200 height=1200')">
						회원정보변경</a></td>
						<td width="25%"><a id="out_btn" class="a_btn" onclick="member_del()">회원탈퇴</a></td>
						<td width="25%"><a id="faq_btn" class="a_btn" href="#">FAQ</a></td>
						<td><a id="request_btn" class="a_btn" href="#">문의,상담</a></td>
					</tr>
				</table>
				
				
				
				<hr style="border:2px solid black;">
			
				<h1 style="margin-top:50px; margin-bottom:50px; margin-left:30px;">자주찾는 문의 , 서비스</h1>
				
					<ul class="ul_box">
						<li>
							<img src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
							비밀번호를 변경하고 싶습니다.
							<img onclick="btn_1()" class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">	
								<ul>
									<li id="btn_1_box"></li>
								</ul>
						
						</li>
						<hr>
						<li>
						<img src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						회원가입은 어디에서 하나요?
							<img onclick="btn_2()" class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_2_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						비밀번호 찾기
							<img onclick="btn_3()" class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_3_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						휴대폰 인증이 불가한 경우 회원가입을 어떻게 해야할까요?
							<img onclick="btn_4()" class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_4_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						등록했던 핸드폰 번호를 변경하고 싶을때 어떻게 해야할까요?
							<img onclick="btn_5()" class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_5_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img onclick="btn_6()" src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						SNS로 가입했는데 로그인이 안돼요.
							<img class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_6_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img onclick="btn_7()" src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						인증번호가 오지 않아요
							<img class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_7_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img onclick="btn_8()" src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						외국에서 회원가입은 어떻게 하나요
							<img class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_8_box"></li>
								</ul>
						</li>
						<hr>
						<li>
						<img onclick="btn_9()" src="${pageContext.request.contextPath }/resources/img/service_img.png" width="30px" height="30px">
						회원탈퇴는 어떻게 해야 하나요?
							<img class="down_arr" src="${pageContext.request.contextPath }/resources/img/down-arrow.png" width="30px" height="30px">
								<ul>
									<li id="btn_9_box"></li>
								</ul>
						</li>
						<hr>
					</ul>
		</div>
		


		
		</main>
<%@ include file="../recommend/recommend.jsp" %>
<%@ include file="../head/footer.jsp" %>

</body>
</html>
				<hr>