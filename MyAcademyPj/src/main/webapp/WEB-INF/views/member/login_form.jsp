<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width: 400px; height: 150px; text-align: left;}
	.input_text{width: 300px; height: 40px; }
	.login_box{border: 1px solid red; margin:0 auto; display:inline-block; text-align: center;}
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function login( f ) {
		var m_id = f.m_id.value.trim();
		var m_pwd = f.m_pwd.value.trim();
		
		
		if( m_id == ''){
			alert("아이디는 필수입력입니다!");
			return;
		}
		
		if(m_pwd == ''){
			alert("비밀번호는 필수입력입니다!");
			return;
		}
		
		var url = "login_check.com";
		var param = "m_id=" + encodeURIComponent(m_id)+
					"&m_pwd="+ encodeURIComponent(m_pwd);
		
		sendRequest(url,param,resultFn,"POST");
	
	}
	
	function resultFn() {
		
		if(xhr.readyState == 4 && xhr.status == 200){
			alert(xhr.readyState);
			var data = xhr.responseText;
			
			var json = eval(data);
			
			if(json[0].param == "no_id"){
				alert("아이디가 존재하지 않습니다.");
				
			}else if(json[0].param == "no_pwd"){
				alert("비밀번호가 일치하지 않습니다.");
				
			}else if(json[0].param == "clear"){
				location.href = "main.com";
			}
			
	
		}
		
	}
</script>

</head>
<body>

	<form>
		<div class="head_login_box">	
			<div class="login_box">
			<table style="border-collapse: collapse;">
				<tr>
					<td width="20%">
					 아이디
					</td>
					<td>
					 <input name="m_id" class="input_text">
					</td>
				</tr>
			
				<tr>
					<td>
					비밀번호
					</td>
					<td>
					 <input name="m_pwd" type="password" class="input_text">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="login(this.form)">
					<input type="button" value="회원가입" onclick="location.href='reg_form.com'"> 
					</td>
				</tr>
			</table>
			</div>
		</div>
			
	</form>

	
		
		
		
	
	
</body>
</html>