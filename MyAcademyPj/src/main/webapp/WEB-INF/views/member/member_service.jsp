<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../head/header.jsp" %>
<c:if test="${ empty sessionScope.user }">
	<script>
	alert("로그인 후 이용하세요");
	location.href="main.do";
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
<meta charset="UTF-8">
<title>세상의 모든 학원 : SpringSchool</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
	
<style type="text/css">
	#my_banner {
		width: 1000px;
		height: 100px;
		margin: 20px auto;
		padding: 10px;
		border: #403C00 2px solid;
		color: white;
		background: black;
		position: relative;
	}
	
	#my_banner h3 {
		font-size: 50px;
		font-family: 'Nanum Brush Script', serif;
		color: #E5D700;
		text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
		letter-spacing: 2px;
	}
	
	#my_banner p {
		font-size: 16px;
	}
	
	#my_banner .vector {
		width: 150px;
		height: 80px;
		margin: 10px;
		margin-left: 100px;
		float: left;
		position: absolute;
		top: 10px;
		left: 10px;
	}
	
	#my_banner .content {
		width: 700px;
		height: 40px;
		margin: 5px;
		float: right;
	}
	
	#tb_menu {
		margin: 0 auto;
		border-collapse: collapse;
		width: 1000px;
		height: 150px;
		text-align: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}

	.a_btn {
		width: 250px;
		height: 150px;
		display: inline-block;
		vertical-align: middle;
		line-height: 150px;
		color: white;
		background: black;
		border-radius: 10px 10px;
		font-size: 40px;
		font-family: 'Do Hyeon', cursive;
		cursor: pointer;
	}
	
	#reg_btn {
		border-right: 5px solid #FFEF00;
	}
	
	#out_btn {
		border-right: 5px solid #FFEF00;
	}
	
	#faq_btn {
		border-right: 5px solid #FFEF00;
	}
	
	#reg_btn:hover {
		background: #E5D700;
		color: #2d3a4b;
		border-left: 5px solid white;
		border-top: 5px solid white;
		border-right: 5px solid white;
		border-bottom: 5px solid black;
		border-radius: 10px 10px;
	}
	
	#out_btn:hover {
		background: #E5D700;
		color: #2d3a4b;
		border-left: 5px solid white;
		border-top: 5px solid white;
		border-right: 5px solid white;
		border-bottom: 5px solid black;
		border-radius: 10px 10px;
	}
	
	#faq_btn:hover {
		background: #E5D700;
		color: #2d3a4b;
		border-left: 5px solid white;
		border-top: 5px solid white;
		border-right: 5px solid white;
		border-bottom: 5px solid black;
		border-radius: 10px 10px;
	}
	
	#request_btn:hover {
		background: #E5D700;
		color: #2d3a4b;
		border-left: 5px solid white;
		border-top: 5px solid white;
		border-right: 5px solid white;
		border-bottom: 5px solid black;
		border-radius: 10px 10px;
	}
	
	#box_head {
		width: 780px;
		height: 60x;
		background: black;
		margin: 0 auto;
		text-align: center;
		vertical-align: middle;
		line-height: 100px;
		margin-top: 30px;
		border-radius: 20px 20px 20px 20px;
	}
	
	#box_head h1 {
		display: inline-block;
		margin: 0 auto;
		font-size: 60px;
		font-family: 'Nanum Brush Script', cursive;
		color: #E5D700;
		text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
		letter-spacing: 2px;
	}
	
	#box_head img {
		display: inline-block;
		vertical-align: middle;
		margin-bottom: 20px;
	}
	
	.ul_box li {
		margin-top: 30px;
		margin-bottom: 20px;
		margin-left: 50px;
		font-size: 18px;
		position: relative;
	}
	
	.ul_box img {
		vertical-align: middle;
		line-height: 30px;
		margin-bottom: 5px;
		margin-right: 10px;
	}
	
	.down_arr {
		position: absolute;
		right: 30px;
		top: 0px;
		display: inline-block;
	}
	</style>
	
	<script type="text/javascript">
		function member_del() {
			if( !confirm("회원 탈퇴 하시겠습니까?")){
				return;
			}
			if( !confirm("정말 탈퇴 하시겠습니까?")){
				return;
			}
			if( !confirm("마지막으로 탈퇴 하시겠습니까?")){
				return;
			}
				var url = "member_del.do?m_idx=${user.m_idx}";
				sendRequest(url,null,del_resultFn,"POST");				
		}
		
		function del_resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;	
				var json = eval(data);
				
				if(json[0].param == "yes"){
					alert("회원 탈퇴 되었습니다. 메인페이지로 이동합니다.");
					location.href="main.do";
					
				}else{
					alert("회원탈퇴 실패")
					location.href="main.do";
				}
			}
		}
		function update_alert(){
			alert("추후 업데이트 예정입니다");
		}
		
	</script>	
</head>
	<body>	
		<main>
		<br>
		<!-- ============================상단부 배너================================ -->
		<div id="my_banner">
			<h3 align="center" style="color:'#A21CFF'">고객지원</h3>
			<div class="vector">
			<img src="${pageContext.request.contextPath }/resources/img/login_user.png" width="70px" height="70px">
			</div>
			<div class="content">
			<p>&bull; 계정 관리나 Q&A 등 회원 서비스를 제공합니다.</p>
			</div>
		</div>
		<!-- ============================상단부 배너================================ -->
		<table id="tb_menu" align="center">
			<tr>
				<td width="25%"><div id="reg_btn"  class="a_btn" 
				onclick="window.open('member_update.do', '_blank', 'width=700 height=500')">
				회원정보변경</div></td>
				<td width="25%"><div id="out_btn" class="a_btn" onclick="member_del();">회원탈퇴</div></td>
				<td width="25%"><div id="faq_btn" class="a_btn" onclick="update_alert();">FAQ</div></td>
				<td><div id="request_btn" class="a_btn" onclick="update_alert();">문의,상담</div></td>
			</tr>
		</table>
	</main>
<%@ include file="../recommend/recommend.jsp" %>
<%@ include file="../head/footer.jsp" %>
</body>
</html>
