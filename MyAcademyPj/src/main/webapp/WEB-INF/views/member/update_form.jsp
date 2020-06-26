<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function send( f ) {
			var m_id = f.m_id.value.trim();
			var m_pwd = f.m_pwd.value.trim();
			var m_name = f.m_name.value.trim();
			var m_age = f.m_age.value.trim();
			var m_type = f.m_type.value;
			var m_tel = f.m_tel.value.trim();
			var m_idx = f.m_idx.value;
			
			if( m_id == ''){
				alert("아이디는 필수입력 항목입니다");
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
				alert("나이는 필수입력 항목입니다");
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
			
			var url = "update.com";
			var param = "m_id="+encodeURIComponent(m_id)+
						"&m_pwd="+encodeURIComponent(m_pwd)+
						"&m_name="+encodeURIComponent(m_name)+
						"&m_age="+encodeURIComponent(m_age)+
						"&m_type="+encodeURIComponent(m_type)+
						"&m_tel="+encodeURIComponent(m_tel)+
						"&m_idx="+m_idx;
			
			
			sendRequest(url,param,resultFn,"POST");
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				var json = eval(data);
			
				if(json[0].param == "yes"){
					alert("회원정보가 정상적으로 변경되었습니다");
				}else{
					alert("회원정보 변경에 실패 하셧습니다 관리자에게 문의하세요");
				}
				
				location.href="member_service.com";
	
			}
		}
	</script>	
	</head>
	
	<body>
		<form>
			<ul>
				<li>
					<input name="m_idx" value="${user.m_idx}" type="hidden">
				</li>
				<li>
					회원아이디 <input name="m_id" value="${user.m_id}">
				</li>
				<li>	
					회원비밀번호<input name="m_pwd" type="password" value="${user.m_pwd}">
				</li>	
				<li>
					회원이름<input name="m_name" value="${user.m_name}">
				</li>
				<li>
					회원나이<input name="m_age" value="${user.m_age}">
				</li>	
				<li>
					회원타입
					<select name="m_type" value="${user.m_type}">	
						<option>학생</option>
						<option>점주</option>
						<option>관리자</option>
					</select>
				</li>
				<li>	
					회원전화번호<input name="m_tel" value="${user.m_tel}">
				</li>
				
				<li>
					<input type="button" value="변경" onclick="send(this.form)">
				</li>
			</ul>
		</form>
			
	</body>
</html>