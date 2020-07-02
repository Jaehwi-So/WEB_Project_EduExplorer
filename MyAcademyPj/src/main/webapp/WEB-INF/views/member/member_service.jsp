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
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>


	<style type="text/css">
	
		.gogek_c{ font-size: 35px; padding-top: 15px;}
		.m_hr{ width: auto; width:750px; }
		.gogek_main{margin:auto; width: 750px; height: 85px; background:#27248A; color:white;}

	</style>
	
	<script type="text/javascript">
		function member_del() {
			if( !confirm("회원탈퇴 하시겠습니까?")){
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
	</script>	
</head>
<body>	
		<div>
			<hr class="m_hr">
					<div class="gogek_main" align="center">
						<div class="gogek_c"><span>고객센터</span></div>
					</div>
		    <hr class="m_hr">
		    
		
		
		<input type="button" value="회원정보변경" onclick="location.href='member_update.com'"> 
		<input type="button" value="회원탈퇴" onclick="member_del()"> 
		
		
		</div>


</body>
</html>