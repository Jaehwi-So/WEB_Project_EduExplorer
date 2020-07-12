<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">	
<style type="text/css">
ul li{list-style: none; margin-bottom: 5px; text-align: center;}
	.input_text{width:350px; height:50px; 
		box-shadow: 1px 1px 3px 1px gray inset;
		border-radius: 10px 10px;
		font-size: 25px; font-family: 'Nanum Brush Script', cursive; }


	#fix_id{ margin-left: 90px;}
	#check_id{ height: 50px; background:black; 
				border-radius: 5px 5px; 
				font-size : 30px; font-family: 'Nanum Brush Script', cursive;
				color: #E5D700;			
				letter-spacing : 2px;}
	#m_type{width: 355px; height: 54px;}
	#over_btn{ background: black; 
				 font-size : 60px; font-family: 'Nanum Brush Script', cursive;
				color: #E5D700;
				letter-spacing : 2px;
				height: 80px;}

	#login_banner{width: auto; height: 100px; background: black; color: #E5D700; border-top: 2px solid #403C00;
				  border-bottom:2px solid #403C00; border-radius: 10px 10px;
				 margin:0 auto; overflow: hidden; text-align: center; padding-bottom: 45px; margin-top: 30px;} 
	#login_banner h1{display: inline-block; vertical-align: middle; line-height: 80px;
					    font-size : 60px; font-family: 'Nanum Brush Script', cursive;
						color: #E5D700;
						text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
						letter-spacing : 2px;}	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//평상시 비활성화
	window.onload = function(){
		document.getElementById("over_btn").disabled = true;
	}
	
	function insert( f ) {
		var m_id = f.m_id.value.trim();
		var m_pwd = f.m_pwd.value.trim();
		var m_name = f.m_name.value.trim();
		var m_age = f.m_age.value.trim();
		var m_type = f.m_type.value;
		var m_tel = f.m_tel.value.trim();
		var m_nick = f.m_nick.value.trim();		
		
		
		if( m_id == ''){
			alert("아이디는 필수입력 항목입니다");
			return;
		}
		if( m_age == ''){
			alert("생년월일 필수입력 항목입니다");
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
		if( m_type == ''){
			alert("유형는 필수입력 항목입니다");
			return;
		}
		if( m_tel == ''){
			alert("전화번호는 필수입력 항목입니다");
			return;
		}
		if( m_nick == ''){
			alert("닉네임는 필수입력 항목입니다");
			return;
		}
		
		var url = "insert.com";
		var param = "m_id="+encodeURIComponent(m_id)+
					"&m_pwd="+encodeURIComponent(m_pwd)+
					"&m_name="+encodeURIComponent(m_name)+
					"&m_age="+encodeURIComponent(m_age)+
					"&m_type="+encodeURIComponent(m_type)+
					"&m_tel="+encodeURIComponent(m_tel)+
					"&m_nick="+encodeURIComponent(m_nick);
		
		
		sendRequest(url,param,resultFn,"POST");
	}
	
	function resultFn() {
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = eval(data);
			
			if(json[0].param == "yes"){
				alert("회원가입이 정상적으로 완료되었습니다");	
				    function closeWindow() {  
				            setTimeout(function() {  
				        window.close();  
				            }, 1000);  
				        }  
				    window.onload = closeWindow();  							
			}else{
				alert("가입실패 중복확인은 필수")
					  function closeWindow() {  
		            setTimeout(function() {  
		     	   window.close();  
		          	  }, 1000);  
		      	 	 }  
		   			 window.onload = closeWindow();  
			}
			
			}

		}
				
	
			
	
		
	
	function send(f) {
		var m_id = f.m_id.value.trim();
		
		if(m_id == ''){
			alert("아이디는 필수입력");
			return;
		}
		
		var url = "over_check.com?m_id="+m_id;
		
		sendRequest(url,null,resultId,"POST");
		
	}
	
	function resultId() {
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = eval(data);
			
			if(json[0].param == "yes"){
				alert("사용가능(Available ID)한 아이디입니다!");
				var null_check_box = document.getElementById("null_check_box");
				null_check_box.innerHTML = "사용가능(Available ID)";
				document.getElementById("over_btn").disabled = false;
				document.getElementById("fix_id").readOnly = true;
			}else{
				alert("중복된아이디(Duplicate ID)입니다!");
				var null_check_box = document.getElementById("null_check_box");
				null_check_box.innerHTML = "중복된아이디(Duplicate ID)";
				document.getElementById("over_btn").disabled = true;
				document.getElementById("fix_id").readOnly = false;
				
			}
		
		}
		
	}
	
</script>
</head>
<body>

	<div id="login_banner">
	
	<img src="${pageContext.request.contextPath }/resources/img/login_login.png" width="50px" height="50px">
	<%-- <img src="${pageContext.request.contextPath }/resources/img/login_user.png" width="100px"> --%>
	<h1 style="color:'#A21CFF'">회원가입</h1>
	<!-- <h1>회원가입</h1>		 -->
	</div>
	
	<form>
		<div id="text_box">
			<ul>
				<li>
					<input placeholder="아이디(ID)" name="m_id" id="fix_id" class="input_text">
					<img><input type="button"  value="중복체크" onclick="send(this.form)" id="check_id">
				</li>
				<li id="null_check_box">
				
				</li>
				<li>	
					<input name="m_pwd" placeholder="비밀번호(PWD)" type="password" class="input_text">
				</li>	
				<li>
					<input placeholder="이름(NAME)" name="m_name" class="input_text">
				</li>
				<li>
					
					<input type="date" name="m_age" value="yyyy-mm-dd" class="input_text">
				</li>	
			
				<li>
					
					<select name="m_type" class="input_text" id="m_type">	
						<option>학생</option>
						<option>점주</option>
						<option>관리자</option>
					</select>
				</li>
				<li>	
					<input name="m_tel" placeholder="전화번호(TEL)" class="input_text">
				</li>
				
				<li>
					<input name="m_nick" placeholder="닉네임(NICK_NAME)" class="input_text">
				</li>
				<li>
					<input type="button" id="over_btn" value="가입완료" onclick="insert(this.form)" class="input_text"> 
				</li>
				
			</ul>
		</div>
					
		
	</form>

</body>
</html>