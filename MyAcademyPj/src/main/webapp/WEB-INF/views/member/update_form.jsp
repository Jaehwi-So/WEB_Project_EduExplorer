<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">		
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	ul li{list-style: none; margin-bottom: 5px; text-align: center;}
	.input_text{width:350px; height:50px; box-shadow: 1px 1px 3px 1px gray inset; 
	border-radius: 10px 10px; 
	font-size: 25px; font-family: 'Nanum Brush Script', cursive;}
	h3{text-align: center; background: black; color:White; height: 50px; vertical-align: middle; line-height: 50px;}

	#check_id{ height: 50px; background: black; color:White; border-radius: 5px 5px;}
	#over_btn{ background: black; color: #E5D700;
						font-size : 60px; font-family: 'Nanum Brush Script', cursive;
						letter-spacing : 2px;
						height: 80px }
						
						
	#m_type{width: 355px; height: 60px;}
	#m_age{width:350px; height:55px;}
	
	
	
	#login_banner{width: auto; height: 80px; background: black; color: #E5D700; border-top: 2px solid #403C00;
				  border-bottom:2px solid #403C00; border-radius: 10px 10px;
				 margin:0 auto; overflow: hidden; text-align: center; padding-bottom: 45px; margin-top: 30px;} 
	#login_banner h1{display: inline-block; vertical-align: middle; line-height: 80px;
						font-size : 60px; font-family: 'Nanum Brush Script', cursive;
						color: #E5D700;
						text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
						letter-spacing : 2px;}	
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
	//평상시 비활성화
	window.onload = function(){
		document.getElementById("fix_id").readOnly = true;
	}
	
	
		function send( f ) {
			var m_id = f.m_id.value.trim();
			var m_pwd = f.m_pwd.value.trim();
			var m_name = f.m_name.value.trim();
			var m_age = f.m_age.value.trim();
			var m_type = f.m_type.value;
			var m_tel = f.m_tel.value.trim();
			var m_idx = f.m_idx.value;
			var m_nick = f.m_nick.value.trim();
			var m_age_modify = f.m_age_modify.value;
			
			if( m_id == ''){
				alert("아이디는 필수입력 항목입니다");
				return;
			}
			if( m_age_modify == ''){
				alert("변경할 생년월일 필수입력");
				return;
			}
			
			if( m_nick == ''){
				alert("닉네임은 필수입력 항목입니다");
				return;
			}
			if( m_pwd == ''){
				alert("비밀번호는 필수입력 항목입니다");
				return;
			}
			if( m_name == ''){
				alert("이름은 필수입력 항목입니다");
				return;
			}
			if( m_age == ''){
				alert("생년월일은 필수입력 항목입니다");
				return;
			}
			if( m_type == ''){
				alert("유형는 필수입력 항목입니다");
				return;
			}
			if( m_tel == ''){
				alert("전화번호는 필수입력 항목입니다");
				return;
			}
			if( m_age != m_age_modify){
				m_age = m_age_modify;
			}

			
			var url = "update.com";
			var param = "m_id="+encodeURIComponent(m_id)+
						"&m_pwd="+encodeURIComponent(m_pwd)+
						"&m_name="+encodeURIComponent(m_name)+
						"&m_age="+encodeURIComponent(m_age)+
						"&m_type="+encodeURIComponent(m_type)+
						"&m_tel="+encodeURIComponent(m_tel)+
						"&m_nick="+encodeURIComponent(m_nick)+
						"&m_idx="+m_idx;
			
			
			sendRequest(url,param,resultFn,"POST");
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				var json = eval(data);
			
				if(json[0].param == "yes"){
					alert("회원정보가 정상적으로 변경되었습니다");
				    function closeWindow() {  
			            setTimeout(function() {  
			        window.close();  
			            }, 1000);  
			        }  
			    window.onload = closeWindow(); 
				}else{
					alert("회원정보 변경에 실패 하셧습니다 관리자에게 문의하세요");
				    function closeWindow() {  
			            setTimeout(function() {  
			        window.close();  
			            }, 1000);  
			        }  
			    window.onload = closeWindow(); 
				}
				    function closeWindow() {  
			            setTimeout(function() {  
			        window.close();  
			            }, 3000);  
			        }  
			    window.onload = closeWindow(); 
	
			}
		}
		
	</script>	
	</head>
	
	<body>
	
		<div id="login_banner">
		
		<img src="${pageContext.request.contextPath }/resources/img/login_login.png" width="50px" height="50px">
		<%-- <img src="${pageContext.request.contextPath }/resources/img/login_user.png" width="100px"> --%>
		<h1 style="color:'#A21CFF'">
		회원정보변경</h1>
		<!-- <h1>회원가입</h1>		 -->
		</div>
	
	
		<form>
			<div>
			<ul>
				<li>
					<input name="m_idx" value="${user.m_idx}" type="hidden" class="input_text">
				</li>
				<li>
					<input name="m_id" value="${user.m_id}" class="input_text" id="fix_id"> 
				</li>
				<li>	
					<input name="m_pwd" type="password" value="${user.m_pwd}" class="input_text">
				</li>	
				<li>
					<input name="m_name" value="${user.m_name}" class="input_text">
				</li>
				<li>
					<input name="m_age_modify" type="date" class="input_text" id="m_age">	
				</li>
				<li>
				
					<select name="m_type" value="${user.m_type}" class="input_text" id="m_type">	
						<option>학생</option>
						<option>점주</option>
						<option>관리자</option>
					</select>
				</li>
				<li>	
					<input name="m_tel" value="${user.m_tel}" class="input_text">
				</li>
				
				<li>
					<input name="m_nick" value="${user.m_nick}" class="input_text">
				</li>
				<li>
					<input type="button" id="over_btn" value="변경" onclick="send(this.form)" class="input_text">
				</li>
				
			</ul>
			</div>
			
			
		</form>
			
	</body>
</html>