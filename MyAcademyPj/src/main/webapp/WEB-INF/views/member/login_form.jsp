<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
			<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
			<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
			<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">		
			<link href="${pageContext.request.contextPath }/resources/css/main.css">
	<style type="text/css">
		#m_id{margin-bottom: 5px;}
		.input_text{width: 390px; height: 60px; box-shadow: 1px 1px 3px 1px gray inset; 
					border-radius: 10px 10px; margin: 0 auto; margin-bottom: 10px;}
		.txt_box{width: 390px; height: 60px; box-shadow: 1px 1px 3px 1px gray inset; 
					border-radius: 10px 10px;}
					
		#login_box{	position : relative;  margin-top: 40px;}
		#login_box h5{text-align: center;}
		#center_login_box{border:2px solid black; width:1320px; height:450px; position: relative; margin: 0 auto;}
		.log_btn{ width : 395px; height:60px; 
				margin-top : 8px; margin:0 auto;}
		.a_btn{display:inline-block; width:395px; height: 60px; text-align: center; color: #E5D700;
		        background : black; vertical-align: middle; line-height: 60px;
		        border-radius: 10px 10px;
		        font-size : 45px; font-family: 'Do Hyeon', cursive;
		        text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
				letter-spacing : 2px;}
		        
		 .a_btn:hover{ background:#E5D700; color: black; border-radius: 10px 10px; text-shadow: none;}
		 .log_btn:hover{ background:#E5D700; color: black; border-radius: 10px 10px;text-shadow: none;}
		#reg_btn{margin-top: 1px;}
		#m_pwd{margin-bottom: 10px;}
		
		
		
		#login_banner{width: 50%; height: 80px; background: black; color: #E5D700; border-top: 2px solid #403C00;
					  border-bottom:2px solid #403C00; border-radius: 10px 10px;
					 margin:0 auto; overflow: hidden; text-align: center; padding-bottom: 10px; margin-top: 10px;} 
		#login_banner h1{display: inline-block; vertical-align: middle; line-height: 80px;
						
							font-size : 45px; font-family: 'Do Hyeon', cursive;
							color: #E5D700;
							text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
							letter-spacing : 2px;}			 
		#login_banner img{display: inline-block; vertical-align: middle; line-height: 80px;}
		
		#head_login_box{width: 1320px; height: auto; margin: 0 auto; margin-top : 20px;	}
		#footer_login_box{width: 1320px; height: auto; margin: 0 auto;}		
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function login() {
			var m_id = document.getElementById("m_id").value.trim();
			var m_pwd = document.getElementById("m_pwd").value.trim();			
			if( m_id == ''){
				alert("아이디는 필수입력입니다!");
				return;
			}			
			if(m_pwd == ''){
				alert("비밀번호는 필수입력입니다!");
				return;
			}			
			var url = "login_check.do";
			var param = "m_id=" + encodeURIComponent(m_id)+
						"&m_pwd="+ encodeURIComponent(m_pwd);		
			sendRequest(url,param,resultFn,"POST");
		
		}
		
		function resultFn() {			
			if(xhr.readyState == 4 && xhr.status == 200){				
				var data = xhr.responseText;				
				var json = eval(data);				
				if(json[0].param == "no_id"){
					alert("아이디가 존재하지 않습니다.");					
				}else if(json[0].param == "no_pwd"){
					alert("비밀번호가 일치하지 않습니다.");
					
				}else if(json[0].param == "clear"){
					location.href = "main.do";
				}	
			}
		}
	</script>
</head>
<body>

	<main>
		<div id="head_login_box">	
		</div>	
		<div id="center_login_box">	
		<div id="login_banner">
		<img src="${pageContext.request.contextPath }/resources/img/login_login.png" width="50px" height="50px">
		<%-- <img src="${pageContext.request.contextPath }/resources/img/login_user.png" width="100px"> --%>
		<h1 style="color:'#A21CFF'">로그인</h1>
		<!-- <h1>회원가입</h1>		 -->
		</div>
		
			
			<div id="login_box">
				<ul>
						<li class="input_text">	
						 <input name="m_id" id="m_id" class="txt_box"
						 placeholder="아이디">
						</li>
	
						<li class="input_text">	
						 <input name="m_pwd" type="password" id="m_pwd" class="txt_box"
						 placeholder="비밀번호">
						</li>
						
						<li class="log_btn">
						<a class="a_btn" href="javascript:login();">로그인</a>
						</li>			
						<li class="log_btn">
						<a id="reg_btn"  class="a_btn" href="#" 
						onclick="window.open('reg_form.do', '_blank', 'width=700 height=500')">회원가입</a>
	
						</li>
				</ul>
			
			</div>	
			
			
		</div>
		
		
		<%@ include file="../recommend/recommend.jsp" %>
		<%@ include file="../head/footer.jsp" %>
</main>		
		
		
		
	
 
 
	

	
		
		
		
	
	
</body>
</html>