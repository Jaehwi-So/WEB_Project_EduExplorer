<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">		
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	
	
	h3{text-align: center; background: black; color:White; height: 50px; vertical-align: middle; line-height: 50px;}

					
		
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
			if( m_tel == ''){
				alert("전화번호는 필수입력 항목입니다");
				return;
			}
			if( m_nick == '' || m_id.length < 2 || m_id.length > 10){
				alert("닉네임은 2~10자리로 입력해주세요.");
				return;
			}
			
			var pwd_exp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
			var tel_exp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			var str_exp = /^[a-zA-Zㄱ-힣0-9]*$/;

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

			
			var url = "update.do";
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
		<h1 style="color:'#A21CFF'">회원 정보 변경</h1>
		</div>
		<br>
	<form>
		<input name="m_idx" value="${user.m_idx}" type="hidden" class="input_text">
		<input name="m_type" value="${user.m_type}" type="hidden" id="m_type">	
		<table>
			<tr>
				<td width="200" class="input_label">
					ID 입력
				</td>
				<td width="350">
					<input value="${user.m_id}" name="m_id" id="fix_id" class="input_text" readonly>
				</td>
				<td width="100">
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="null_check_box"></div></td>
			</tr>
			<tr>
				<td class="input_label" >비밀번호 입력</td>
				<td><input name="m_pwd" value="${user.m_pwd}" type="password" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td> &bull;영문과 숫자,특수문자 중 1개 이상 포함</td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">이름 입력</td>
				<td><input value="${user.m_name}" name="m_name" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">생년월일 입력</td>
				<td><input name="m_age" type="date" class="input_text" id="m_age"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">전화번호 입력</td>
				<td><input value="${user.m_tel}" name="m_tel" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td class="input_label">닉네임 입력</td>
				<td><input name="m_nick" value="${user.m_nick}" class="input_text"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td height="150"><input type="button" id="over_btn" value="변경" onclick="send(this.form)" class="input_text"></td>
				<td></td>
			</tr>

		</table>
	</form>

			
	</body>
</html>