<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
				location.href="login_form.com";
			}else{
				alert("가입실패 중복확인은 필수")
				location.href="reg_form.com"
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
				alert("사용가능한 아이디입니다!");
				var null_check_box = document.getElementById("check_id");
				null_check_box.innerHTML = "사용가능한 아이디";
				document.getElementById("over_btn").disabled = false;
				document.getElementById("fix_id").readOnly = true;
			}else{
				alert("중복된 아이디입니다!");
				var null_check_box = document.getElementById("check_id");
				null_check_box.innerHTML = "중복된 아이디";
				document.getElementById("over_btn").disabled = true;
				document.getElementById("fix_id").readOnly = false;
				
			}
		
		}
		
	}
	
</script>
</head>
<body>
		<h3>회원가입</h3>
	<form>
		<div>
			<ul>
				<li>
					회원아이디 <input name="m_id" id="fix_id">
					<input type="button"  value="중복확인" onclick="send(this.form)">
					<div id="check_id"></div>
				</li>
				<li>	
					회원비밀번호<input name="m_pwd" type="password">
				</li>	
				<li>
					회원이름<input name="m_name">
				</li>
				<li>
					생년월일
					<input type="date" name="m_age">
				</li>	
			
				<li>
					회원타입
					<select name="m_type">	
						<option>학생</option>
						<option>점주</option>
						<option>관리자</option>
					</select>
				</li>
				<li>	
					회원전화번호<input name="m_tel">
				</li>
				
				<li>
					닉네임<input name="m_nick">
				</li>
				<li>
					<input type="button" id="over_btn" value="회원가입" onclick="insert(this.form)"> 
				</li>
				
			</ul>
		</div>
					
		
	</form>

</body>
</html>