<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function reply() {
		location.href = "f_reply_form.com?idx=${vo.f_idx}&page=${param.page}";

	}
	//수정버튼 클릭
	function modify() {
		var cur_midx = document.getElementById("m_idx").value;
		var m_idx = "${sessionScope.user.m_idx}";
		
		if (cur_midx != m_idx) {
			alert("권한이 없는 접근입니다.");
			return;
		}
		location.href = "f_modify_form.com?f_idx=${vo.f_idx}";
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
			//location.href는 get 방식만 지원하므로 비밀번호를 가리기 위해(POST 방식)
			//AJAX를 사용하여 파라미터를 전달하자.
			var url = "f_del.com?f_idx=${vo.f_idx}&f_pwd=" + f_pwd;
			sendRequest(url, null, resultFn, "POST");
		}
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);
			if (json[0].result == 'yes') {
				alert("글을 삭제했습니다.");
				location.href = "f_list.com?page=${param.page}";
			} else {
				alert("삭제실패!");
				return;
			}//if 2번
		}//if 1번
	}

	function write_reply() {

		//alert(document.f2.r_name);
		var r_name = document.getElementsByName("r_name")[0].value;
		var r_pwd = document.getElementsByName("r_pwd")[0].value;
		var r_content = document.getElementsByName("r_content")[0].value;
		var m_idx = document.getElementsByName("m_idx")[0].value;
		var r_board = "${vo.f_idx}";
		//alert(r_name + ", " + r_pwd + ", " + r_content + ", " + r_board);
		var url = "reply_insert.com?r_name=" + r_name + "&r_pwd=" + r_pwd
				+ "&r_content=" + r_content + "&r_board=" + r_board + "&m_idx="
				+ m_idx;
		sendRequest(url, null, resultFn2, "POST");
	}

	function resultFn2() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);
			if (json[0].result == 'yes') {
				alert("댓글이 등록되었습니다.");
				location.href = "f_view.com?f_idx=${vo.f_idx}";
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
			var url = "reply_del.com";
			var param = "r_idx=" + r_idx + "&r_pwd=" + r_pwd;
			sendRequest(url, param, resultFn3, "POST");
		}
	}

	function resultFn3() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);
			if (json[0].result == 'yes') {
				alert("댓글이 삭제되었습니다.");
				location.href = "f_view.com?f_idx=${vo.f_idx}";
			} else {
				alert("삭제실패!");
				return;
			}//if 2번
		}//if 1번
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
		font : 35px bold;
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
		background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
		margin-left: 120px;
		height : 600px;
		overflow : auto;
		font-family : "돋움체";
		font-size : 20px;
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
		font-size: 13px;
	}
	
	#r_date {
		color: gray;
		font-size: 13px;
	}
	
	#f_menu {
		margin-left: 120px;
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
				<input type="hidden" id="m_idx" value="${vo.m_idx}"> <input
					type="hidden" id="c_pwd" value="${vo.f_pwd}">
				<table width="690" border="1" style="border-collapse: collapse;">
					<!-- 
					<tr>
						<td width="120" height="25">제목</td>
						<td>${vo.f_subject}</td>
					</tr>
					<tr>
						<td width="120" height="25">작성자</td>
						<td>${vo.f_name}</td>
					</tr>
					<tr>
						<td width="120" height="25">작성일</td>
						<td>${vo.f_regdate}</td>
					</tr>
					 -->

					<br>
					<hr id="info_hr" width="1100px">
					<br>

					<div id="f_content">
						<pre>${ vo.f_content }</pre>
					</div>
				</table>

				<br> <br> <br> 
				<hr id="info_hr" width="1100px">
				<br> <br>
				
				<p class="reply_notice">
					댓글작성
				</p>
				<!-- 댓글작성 -->
				<form name="f2" method="post" action="reply_insert.com">
					<input type="hidden" name="m_idx"
						value="${sessionScope.user.m_idx}"> <input type="hidden"
						name="r_name" value="${sessionScope.user.m_nick}"> <input
						type="hidden" name="r_pwd" value="${sessionScope.user.m_pwd}">
					<table id=f_replyWrite frame="void" width="500" border="1"
						style="border-collapse: collapse;">
						<tr>
							<td><textarea name="r_content" rows="5" cols="110"></textarea></td>
							<td width="80"><img
								src="${pageContext.request.contextPath}/resources/img/writing.png"
								width="40px" height="40px"
								onclick="write_reply();" style="cursor: pointer;"> <!-- 
								<input align="center" type="button"
									value="작성" onclick="write_reply();"></td>  -->
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
										<img
											src="${pageContext.request.contextPath}/resources/img/delete.png"
											width="20px" height="20px"
											onclick="del_reply('${rvo.r_idx}', '${rvo.r_pwd }', '${rvo.m_idx }');"
											style="cursor: pointer;"> &emsp; <br> <input
											id="c_pwdck" name="c_pwd" type="hidden" value="${rvo.r_pwd}">
									<p id="r_date">${rvo.r_date}</p>
									</p>

									<p id="r_content">${rvo.r_content}</p> <br>
									<p>
										<!-- 
										<input type="button" value="삭제"
											onclick="del_reply('${rvo.r_idx}', '${rvo.r_pwd }');">
										 -->
									</p>
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
							<!-- 목록보기 버튼 --> <img
							src="${pageContext.request.contextPath}/resources/img/btn_list.gif"
							onclick="location.href='f_list.com?page=${param.page}'"> <!-- 댓글달기 -->
							<img
							src="${pageContext.request.contextPath}/resources/img/btn_reply.gif"
							onclick="reply();"> <!-- 수정하기 --> <img
							src="${pageContext.request.contextPath}/resources/img/btn_modify.gif"
							onclick="modify();"> <!-- 삭제하기 --> <img
							src="${pageContext.request.contextPath}/resources/img/btn_delete.gif"
							onclick="del();">
						</td>
					</tr>

				</table>

			</form>
		</div>
	</main>
</body>
</html>