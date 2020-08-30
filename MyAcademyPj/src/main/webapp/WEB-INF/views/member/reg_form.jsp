<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">	
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
<style type="text/css">
	table{border-collapse:collapse; margin-bottom: 5px; text-align: center; margin:auto; margin-top:5px; margin-bottom:5px;}
	.input_text{width:350px; height:40px; 
		box-shadow: 1px 1px 3px 1px gray inset;
		border-radius: 10px 10px;
		font-size: 20px; font-family: 'Do Hyeon', cursive; }
	.input_label{
		font-size: 20px; font-family: 'Do Hyeon', cursive;
	}


	/* #fix_id{ margin-left: 90px;} */
	#check_id{ height: 50px; background:black; 
				border-radius: 5px 5px; 
				font-size : 30px; font-family: 'Do Hyeon', cursive;
				color: #E5D700;			
				letter-spacing : 2px;
				cursor:pointer;}
	#over_btn{ background: black; 
				 font-size : 60px; font-family: 'Do Hyeon', cursive;
				color: #E5D700;
				letter-spacing : 2px;
				height: 80px;}

	#login_banner{width: auto; height: 70px; background: black; color: #E5D700; border-top: 2px solid #403C00;
				  border-bottom:2px solid #403C00; border-radius: 10px 10px;
				 margin:0 auto; overflow: hidden; text-align: center; padding-bottom: 45px; margin-top: 30px;} 
	#login_banner h1{display: inline-block; vertical-align: middle; line-height: 80px;
					    font-size : 50px; font-family: 'Do Hyeon', cursive;
						color: #E5D700;
						text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
						letter-spacing : 2px;}	
	#null_check_box{
		color:blue;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//평상시 비활성화
	window.onload = function(){
		document.getElementById("over_btn").disabled = true;
		var null_join_check = document.getElementById("null_join_check");
		null_join_check.innerHTML = "아이디 중복확인을 해주세요.";
		var over_btn = document.getElementById("over_btn");
		over_btn.style.cursor = "auto";
	}
	
	function insert( f ) {
		var m_id = f.m_id.value.trim();
		var m_pwd = f.m_pwd.value.trim();
		var m_name = f.m_name.value.trim();
		var m_age = f.m_age.value.trim();
		var m_type = f.m_type.value;
		var m_tel = f.m_tel.value.trim();
		var m_nick = f.m_nick.value.trim();		
		if( m_id == '' || m_id.length < 7 || m_id.length > 15){
			alert("아이디는 7-15자리로 입력해주세요.");
			return;
		}
		if( m_age == ''){
			alert("생년월일은 필수입력 항목입니다");
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
		if( m_nick == '' || m_id.length < 2 || m_id.length > 10){
			alert("닉네임은 2~10자리로 입력해주세요.");
			return;
		}
		
		var id_exp = /^[0-9a-z]+$/;
		var pwd_exp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
		var tel_exp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var str_exp = /^[a-zA-Zㄱ-힣0-9]*$/;

		if(!id_exp.test(m_id)){
			alert("아이디 형식이 올바르지 않습니다.");
			return;
		}
		if(!pwd_exp.test(m_pwd)){
			alert("영문과 숫자, 특수문자 중 하나를 포함하여 6~20자리의 비밀번호를 입력해주세요.");
			return;
		}
		if(!tel_exp.test(m_tel)){
			alert("전화번호의 형식이 올바르지 않습니다.");
			return;
		}
		if(!str_exp.test(m_name)){
			alert("이름의 형식이 올바르지 않습니다.");
			return;
		}
		if(!str_exp.test(m_nick)){
			alert("닉네임은 특수문자를 사용할 수 없습니다.");
			return;
		}
		
		var url = "insert.do";
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
				alert("가입 실패, 아이디 중복확인을 다시 해 주세요");
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
			alert("아이디는 필수입력 사항입니다.");
			return;
		}
		if( m_id == '' || m_id.length < 7 || m_id.length > 15){
			alert("아이디는 7-15자리로 입력해주세요.");
			return;
		}
		var id_exp = /^[0-9a-z]+$/;
		if(!id_exp.test(m_id)){
			alert("아이디 형식이 올바르지 않습니다.");
			return;
		}
		
		var url = "over_check.do?m_id="+m_id;
		
		sendRequest(url,null,resultId,"POST");
		
	}
	
	function resultId() {
		
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = eval(data);
			
			if(json[0].param == "yes"){
				var null_check_box = document.getElementById("null_check_box");
				null_check_box.innerHTML = "사용가능한 아이디입니다!";
				document.getElementById("over_btn").disabled = false;
				document.getElementById("fix_id").readOnly = true;
				var null_join_check = document.getElementById("null_join_check");
				null_join_check.innerHTML = "";
				var over_btn = document.getElementById("over_btn");
				over_btn.style.cursor = "pointer";
			}else{
				var null_check_box = document.getElementById("null_check_box");
				null_check_box.innerHTML = "중복된 아이디 입니다!";
				document.getElementById("over_btn").disabled = true;
				document.getElementById("fix_id").readOnly = false;
				var null_join_check = document.getElementById("null_join_check");
				null_join_check.innerHTML = "아이디 중복확인을 해주세요.";
				var over_btn = document.getElementById("over_btn");
				over_btn.style.cursor = "auto";
				
			}
		
		}
		
	}
	
</script>
</head>
<body>

	<div id="login_banner">
	
	<img src="${pageContext.request.contextPath }/resources/img/login_login.png" width="50px" height="50px">
	<h1 style="color:'#A21CFF'">회원가입</h1>
	<!-- <h1>회원가입</h1>		 -->
	</div>
	<br>
	<form>
		<table>
			<tr>
				<td width="200" class="input_label">
					ID 입력
				</td>
				<td width="350">
					<input placeholder="특수문자를 제외한 7~15자리" name="m_id" id="fix_id" class="input_text">
				</td>
				<td width="100">
					<input type="button" value="ID 중복체크" onclick="send(this.form)" id="check_id">
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="null_check_box"></div></td>
			</tr>
			<tr>
				<td class="input_label">비밀번호 입력</td>
				<td><input name="m_pwd" placeholder="비밀번호 6~20자리" type="password" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td> &bull;영문과 숫자,특수문자 중 1개 이상 포함</td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">이름 입력</td>
				<td><input placeholder="이름(NAME)" name="m_name" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">생년월일 입력</td>
				<td><input type="date" name="m_age" value="yyyy-mm-dd" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">회원유형 선택</td>
				<td>
					<select name="m_type" class="input_text" id="m_type">	
						<option>학생</option>
						<option>점주</option>
						<option>관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td> &bull;점주회원으로 가입 시 학원 등록이 가능합니다.</td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">전화번호 입력</td>
				<td><input placeholder="010-1111-1111" name="m_tel" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">닉네임 입력</td>
				<td><input name="m_nick" placeholder="특수문자를 제외한 2~10자리" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td height="150"><input type="button" id="over_btn" value="가입" onclick="insert(this.form)" class="input_text">  </td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><div id="null_join_check"></div></td>
			</tr>

		</table>
	
	</form>

</body>
</html>