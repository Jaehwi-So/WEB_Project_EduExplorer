<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head/header.jsp"%>
    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
	
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
			font-size: 35px;
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
		#a_content_box{
			padding : 25px;
			margin: 0px auto;
			width : 1050px;
			background-color:rgb(244, 245, 250);
			border : black 1.5px solid; 
			align-items : center;
			align : center;
		}
		#a_content {
			margin : 0px auto;
			margin-left : 8px;
			margin-top : 20px;
			padding : 22px;
			border : black 1.5px solid; 
			background: white;
			height : 600px;
			overflow : auto;
			font-family : "돋움체";
			font-size : 19px;
		}
		#a_photo{
			margin: 0px auto;
			width : 1100px;
			height : 600px;
			background-color:Black;
		}
		
		
		#a_menu {
			margin-left: 120px;
		}
		.button2{
		border: 0;
		}
		.util_btn{
			width : 70px; height : 35px;
			cursor : pointer;
		}
	</style>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
		
			function a_notice_modify(a_notice_idx) {
				location.href = "a_notice_modify_form.do?a_notice_idx=" + a_notice_idx + "&page=${param.page}";
			}
			
			function del(a_notice_idx) {
				if( confirm("게시글을 삭제 하시겠습니까?") ){
					var url = "a_notice_del.do";
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
							location.href = "a_list_detail.do?a_idx=${vo.a_idx}";
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
				
			<br><hr id="info_hr" width="1100px"><br>
				
			<div id="a_content_box">
				<c:if test='${vo.a_notice_photo ne "no_file"}'>
					<img src="${pageContext.request.contextPath}/resources/upload/${vo.a_notice_photo}" width = "512px" height="512px" style="display:block; margin: 0px auto;">
				</c:if>
			<textarea id="a_content" rows= 20; cols="100" readonly>${ vo.a_notice_content }</textarea>
			</div>
			
			<br><br>	
			<hr id="info_hr" width="1100px"><br>	
				
			<table width="690" id="a_menu">		
				<tr>
					<td height="10">
						<!-- 목록보기 버튼 --> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
						onclick="location.href='a_list_detail.do?a_idx=${vo.a_idx}&page=${param.page}&notice=true'" class="util_btn">
						<!-- 삭제하기 --> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif"
						onclick="del(${vo.a_notice_idx });" class="util_btn">			 	
						<!-- 수정하기 --> 
						<img src="${pageContext.request.contextPath}/resources/img/btn_modify.gif"
						onclick="a_notice_modify(${vo.a_notice_idx });" class="util_btn">		  
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