<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head/header.jsp"%>
    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
	<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
	
	<style>
		table {
			margin-left: auto;
			margin-right: auto;
		}
		
		#info_hr {
			margin: 0px auto;
		}
		
		#a_title {
			margin-left: 120px;
		}
		
		.a_title {
			font-size: 30px;
		}
		
		#a_info {
			margin-left: 120px;
			color: #0b1ab8;
		}
		
		.a_writer {
			font-size: 15px;
		}
		
		.a_date {
			font-size: 15px;
		}
		
		#a_content {
			padding : 20px;
			margin-right : 110px;
			border : black 1.5px solid;
			background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
			margin-left: 120px;
		}
		.a_photo{
			position: relative;
			left: 150px;
			top: 20px;
		}
		
		
		#a_menu {
			margin-left: 120px;
		}
		.button2{
		border: 0;
		}
	</style>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	
		<script type="text/javascript">
		
			function a_notice_modify(f) {
				f.action = "a_notice_modify_form.com";
				f.submit();
			}
			
			function del(f) {
				var a_notice_idx = f.a_notice_idx.value;
				if( confirm("게시글을 삭제 하시겠습니까?") ){
					
					var url = "a_notice_del.com";
					var param = "a_notice_idx="+a_notice_idx;
					sendRequest(url, param, del_resultFn, "post");	
					
				}	
				
			}//del()
			
			function del_resultFn() {
					if( xhr.readyState == 4 && xhr.status == 200 ){
						var data = xhr.responseText;
						var json = eval(data);
						if( json[0].result == 'yes' ){
							alert("글을 삭제했습니다");
							location.href = "a_list_detail.com?a_idx=${vo.a_idx}";
						}else{
							alert("삭제에 실패했습니다. 관리자에게 문의하세요");
							return;
						}	
					}
				}
			
		</script>
	
	</head>
	<body>
	<main>
		<div id="a_view">
		
		<form name="f" method="post">
								
				<div id="a_title">
					<p class="a_title">${ vo.a_notice_subject }</p>
				</div>
				
				<div id="a_info">
					<p class="a_writer">${ vo.a_owner }</p>
					<p class="a_date">${ vo.a_notice_regdate }</p>
				</div>
				
				<input type="hidden" value="${vo.a_notice_idx }" name="a_notice_idx">
				<input type="hidden" value="${vo.a_idx }" name="a_idx">
				
				<table width="690" border="1" style="border-collapse: collapse;">
					
					<br>
					<hr id="info_hr" width="1100px">
					<br>

					<div id="a_photo">
						<img style="display: inline-block; margin-bottom: 30px;"class="a_photo" src="${pageContext.request.contextPath}/resources/upload/${vo.a_notice_photo}">
					</div>
					<div id="a_content">
						<pre>${ vo.a_notice_content }</pre>
					</div>
					
				</table>
				
			<br>
			<hr id="info_hr" width="1100px">
			<br>	
			
			
			<table width="690" id="a_menu">
				<tr>
					<td height="10"></td>
				</tr>
				
				<tr>
					<td height="10">
						<!-- 목록보기 버튼 --> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
						onclick="location.href='a_list_detail.com?a_idx=${vo.a_idx}'">
						<!-- 삭제하기 --> 
				 		<button type="button" class="button2" onclick="del(this.form);">
						<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif"></button>
				 	
						<!-- 수정하기 --> 
				 		<button type="button" class="button2" onclick="a_notice_modify(this.form);">
						<img src="${pageContext.request.contextPath}/resources/img/btn_modify.gif"></button>
							  
					</td>
				</tr>
			</table>
						
		
		</form>
	</div>	
	</main>
		<%@ include file="../head/footer.jsp" %>	
	</body>
</html>

<c:if test="${sessionScope.user.m_idx ne vo.m_idx}">
	<script type="text/javascript">
		var test = document.getElementById("test");
		if(test.style.display=="inline"){
			test.style.display="none";	
		}
	</script>	 
</c:if>	