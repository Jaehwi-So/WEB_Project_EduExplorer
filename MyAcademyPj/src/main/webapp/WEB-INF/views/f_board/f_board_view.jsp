<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${vo.del_info eq -1}">
	<script>
		alert("이미 삭제되거나 없는 게시물입니다.");
		location.href = "main.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세상의 모든 학원 : SpringSchool</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/main.css">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			//답글 작성 폼
			function reply() {
				location.href = "f_reply_form.do?idx=${vo.f_idx}&page=${param.page}&keyword=${param.keyword}";
			}
			//수정버튼 클릭
			function modify() {
				var cur_midx = document.getElementById("m_idx").value;
				var m_idx = "${sessionScope.user.m_idx}";
				
				if (cur_midx != m_idx) {
					alert("권한이 없는 접근입니다.");
					return;
				}
				location.href = "f_modify_form.do?f_idx=${vo.f_idx}&page=${param.page}&keyword=${param.keyword}";
			}
		
			function del() {
				var cur_midx = document.getElementById("m_idx").value;
				var m_idx = "${sessionScope.user.m_idx}";
				if (cur_midx != m_idx) {
					alert("권한이 없는 접근입니다.");
					return;
				}
				if (confirm("정말로 삭제하시겠습니까?")) {
					var f_pwd = document.getElementById("c_pwd").value;
					var url = "f_del.do?f_idx=${vo.f_idx}&f_pwd=" + f_pwd;
					sendRequest(url, null, resultFn, "POST");
				}
			}
			function resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					if (json[0].result == 'yes') {
						alert("글을 삭제했습니다.");
						location.href = "f_list.do?&page=${param.page}&keyword=${param.keyword}";
					} else {
						alert("삭제실패!");
						return;
					}//if 2번
				}//if 1번
			}
		
			function write_reply() {
		
				var r_name = document.getElementsByName("r_name")[0].value;
				var r_pwd = document.getElementsByName("r_pwd")[0].value;
				var r_content = document.getElementsByName("r_content")[0].value;
				var m_idx = document.getElementsByName("m_idx")[0].value;
				var r_board = "${vo.f_idx}";
				var url = "reply_insert.do?r_name=" + r_name + "&r_pwd=" + r_pwd
						+ "&r_content=" + r_content + "&r_board=" + r_board + "&m_idx="
						+ m_idx;
				sendRequest(url, null, resultFn_write, "POST");
			}
		
			function resultFn_write() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					if (json[0].result == 'yes') {
						alert("댓글이 등록되었습니다.");
						location.href = "f_view.do?f_idx=${vo.f_idx}&page=${param.page}&keyword=${param.keyword}";
					} else {
						alert("등록실패!");
						return;
					}//if 2번
				}//if 1번
			}
		
			function del_reply(r_idx, r_pwd, r_midx) {
				var m_idx = "${sessionScope.user.m_idx}";
		
				if (m_idx != r_midx) {
					alert("권한이 없는 접근입니다.");
					return;
				}
				if (confirm("삭제하시겠습니까?")) {
					var url = "reply_del.do";
					var param = "r_idx=" + r_idx + "&r_pwd=" + r_pwd;
					sendRequest(url, param, resultFn_del, "POST");
				}
			}
		
			function resultFn_del() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					if (json[0].result == 'yes') {
						alert("댓글이 삭제되었습니다.");
						location.href = "f_view.do?f_idx=${vo.f_idx}&page=${param.page}&keyword=${param.keyword}";
					} else {
						alert("삭제실패!");
						return;
					}
				}
			}
		</script>
		
		<style>
			table {
				margin-left: auto;
				margin-right: auto;
			}
			
			#info_hr {
				margin: 0px auto;
			}
			
			#f_title {
				margin-left: 120px;
			}
			
			.f_title {
				font : 40px bold;
			}
			
			#f_info {
				margin-left: 120px;
				color: #0b1ab8;
			}
			
			.f_writer {
				font-size: 20px;
			}
			
			.f_date {
				font-size: 20px;
			}
			
			#f_content {
				padding : 20px;
				margin-right : 110px;
				border : black 1.5px solid;
				background: rgb(244, 245, 250);
				margin-left: 120px;
				height : 600px;
				overflow : auto;
				font-size : 20px;
				font-family : "돋움체";

			}
			
			#f_replyWrite {
				border-color: white;
			}
			
			#f_replyWrite td {
				padding: 10px;
			}
			
			#f_reply {
				margin-left: 140px;
			}
			
			.reply_notice {
				margin-left: 205px;
				font-size: 20px;
				font-weight : bold;
			}
			
			#r_date {
				color: gray;
				font-size: 13px;
			}
			
			#f_menu {
				margin-left: 120px;
			}
			#r_content{
				font-size : 16px;
			}
			.util_btn{
			width : 70px; height : 35px;
			cursor : pointer;
			}
		</style>	
	</head>
	<body>
		<main>
			<div id="f_view">
				<form name="f" action="post">
					<hr id="info_hr" width="1100px">
					<div id="f_title">
						<p class="f_title">${ vo.f_subject }</p>
					</div>
	
					<div id="f_info">
						<p class="f_writer">${ vo.f_name }</p>
						<p class="f_date">${ vo.f_regdate }</p>
					</div>
					<input type="hidden" id="m_idx" value="${vo.m_idx}"> 
					<input type="hidden" id="c_pwd" value="${vo.f_pwd}">
					<br>
					<textarea id="f_content" rows= 20; cols="100" readonly>${ vo.f_content }</textarea>
				</form>
	
				<br> <br> <br>
				<hr id="info_hr" width="1100px">
				<br> <br>
	
				<p class="reply_notice">댓글 작성</p>
				<!-- 댓글작성 -->
				<form name="f2" method="post" action="reply_insert.do"> 
					<input type="hidden" name="m_idx" value="${sessionScope.user.m_idx}">
					<input type="hidden" name="r_name"
						value="${sessionScope.user.m_nick}"> <input type="hidden"
						name="r_pwd" value="${sessionScope.user.m_pwd}">
					<table id=f_replyWrite frame="void" width="500" border="1"
						style="border-collapse: collapse;">
						<tr>
							<td><textarea name="r_content" rows="5" cols="100" id="r_content"></textarea></td>
							<td width="80"><img
								src="${pageContext.request.contextPath}/resources/img/writing.png"
								width="40px" height="40px" onclick="write_reply();"
								style="cursor: pointer;">
						</tr>
					</table>
				</form>
				<!-- 여기까지 댓글작성 -->
	
				<br> <br>
	
	
				<!-- 댓글 리스트 -->
	
				<form name="f3" method="post">
					<div id="f_reply">
						<ol class="replyList">
							<c:forEach var="rvo" items="${r_list}">
								<hr align="left" width="82%">
								<br>
								<li>
									<p>
										${rvo.r_name } 
										<img src="${pageContext.request.contextPath}/resources/img/delete.png"
											width="15px" height="15px"
											onclick="del_reply('${rvo.r_idx}', '${rvo.r_pwd }', '${rvo.m_idx }');"
											style="cursor: pointer;"> &emsp; 
											<br> 
											<input id="c_pwdck" name="c_pwd" type="hidden" value="${rvo.r_pwd}">
									<p id="r_date">${rvo.r_date}</p>
									<p id="r_content">${rvo.r_content}</p> <br>
								</li>
	
							</c:forEach>
						</ol>
					</div>
				</form>
				<!-- 여기까지 댓글 리스트 -->
	
				<br>
				<hr id="info_hr" width="1100px">
				<br>
	
				<table width="690" id="f_menu">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="10">
							<!-- 목록보기 버튼 --> 
							<img src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
							onclick="location.href='f_list.do?page=${param.page}&keyword=${param.keyword}'"
							class="util_btn"> 
							<!-- 댓글달기 -->
							<img src="${pageContext.request.contextPath}/resources/img/btn_reply.gif" class="util_btn" onclick="reply();"> 
							<!-- 수정하기 --> 
							<img src="${pageContext.request.contextPath}/resources/img/btn_modify.gif" class="util_btn" onclick="modify();"> 
							<!-- 삭제하기 --> 
							<img src="${pageContext.request.contextPath}/resources/img/btn_delete.gif" class="util_btn" onclick="del();">
						</td>
					</tr>
				</table>
	
			</div>
		</main>
	</body>
</html>