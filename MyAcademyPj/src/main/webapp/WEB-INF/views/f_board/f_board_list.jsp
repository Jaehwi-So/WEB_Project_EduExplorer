<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용하세요");
		location.href = "main.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세상의 모든 학원 : SpringSchool</title>
		<link href='https://fonts.googleapis.com/css?family=Yellowtail'
			rel='stylesheet' type='text/css'>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/main.css">
		<script>
			function keyword_search(f) {
				f.action = "f_list.do"
				f.submit();
			}
					
			function go_detail(del_info, f_idx){
				if(del_info != -1){
					location.href="f_view.do?f_idx="+f_idx+"&page=${ empty param.page ? 1 : param.page}&keyword=${ empty param.keyword ? '' : param.keyword}";
				}
			}
		</script>
		
		<style>
		table {
			margin-left: auto;
			margin-right: auto;
		}
		
		#f_banner {
			width: 1000px;
			height: 100px;
			margin: 20px auto;
			padding: 10px;
			border: #403C00 2px solid;
			color: white;
			background: black;
			position: relative;
		}
		
		#f_banner h3 {
			font-size: 40px;
			font-family: 'Yellowtail', serif;
			color: #E5D700;
			text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
			letter-spacing: 2px;
		}
		
		#f_banner p {
			font-size: 16px;
		}
		
		#f_banner .f_vector {
			width: 150px;
			height: 80px;
			margin: 10px;
			margin-left: 100px;
			float: left;
			position: absolute;
			top: 10px;
			left: 10px;
		}
		
		#f_banner .f_banner_content {
			width: 650px;
			height: 40px;
			margin: 5px;
			float: right;
		}
		
		#f_table_c, #f_table_c td, #f_table_c th {
			border: 1px solid gray;
			border-width: 1px 0;
			border-collapse: collapse;
			text-align: center;
			height: 40px;
		}
		
		.f_td_tr {
			border-left: 1px solid black;
			border-right: 1px solid black;
		}
		
		.td_a, .td_b, .td_c {
			background-color: #e5d700;
			font-size: 1.1em;
			color: #black;
			border-width: 2px 0;
			padding: 6px;
		}
		
		#f_search {
			margin-left: 230px;
			display:inline;
		}
		
		.f_button {
			background-color: #f5f2c4;
			font-size : 20px;
		}
		
		.f_tr_list:hover {
			background-color: #f5f2c4;
		}
		
		.f_tr_list {
			cursor: pointer;
		}
		.pointer {
			cursor: pointer;
		}
		.util_btn{
			margin-left : 30px; width : 70px; height : 35px;
		}
		.pager{
			font-size : 20px;
		}
		</style>
	</head>
	<body>
		<main>
			<br>
			<div id="f_banner">
				<h3 align="center" style="color: '#A21CFF'">FREEBOARD</h3>
				<div class="f_vector">
					<img
						src="${pageContext.request.contextPath}/resources/img/freeboard.png"
						width="80px" height="80px">
				</div>
				<div class="f_banner_content">
					<p>&bull; 자유롭게 글을 올릴 수 있는 게시판입니다.</p>
				</div>
			</div>
			<br><hr><br>

		<!-- <table width="690">  -->
		<table width="1000px" align="center" id="f_table_b">
			<!-- tr1 -->
			<tr>
				<td>
					<table width="1000px" align="center" id="f_table_c">
						<tr class="f_td_tr">
							<th width="50" class="td_a" align="center">번호</th>
							<td width="2" class="td_b"></td>
							<th width="300" class="td_b" align="center">제목</th>
							<td width="2" class="td_b"></td>
							<th width="90" class="td_b" align="center">작성자</th>
							<td width="2" class="td_b"></td>
							<th width="90" class="td_b" align="center">작성일</th>
							<td width="2" class="td_b"></td>
							<th width="60" class="td_c" align="center">조회수</th>
						</tr>
						<c:forEach var="vo" items="${f_list}">
							<tr class="f_tr_list"
								onclick="go_detail(${vo.del_info}, ${vo.f_idx });">
								<td align="center" class="td_a_1">${vo.f_idx}</td>
								<td align="center" class="td_b_1"></td>
								<td align="center" class="td_b_1 left">
									<!-- 답글 들여쓰기 --> 
									<c:forEach begin="1" end="${vo.f_depth}">
									<img width="15px" height="15px" src="${pageContext.request.contextPath}/resources/img/reply.png">
									</c:forEach> 
									<c:if test="${vo.del_info ne -1}">
										${vo.f_subject} 
									</c:if> 
									<c:if test="${vo.del_info eq -1}">
										<span style="color: #a014a0;">${vo.f_subject }</span>
									</c:if>
								</td>
								<td class="td_b_1"></td>
								<td align="center" class="td_b_1">${vo.f_name}</td>
								<td class="td_b_1"></td>
								<td align="center" class="td_b_1">${vo.f_regdate}</td>
								<td class="td_b_1"></td>
								<td align="center" class="td_c_1">${vo.f_readhit}</td>
							</tr>
						</c:forEach>

						<!-- 데이터가 없는 경우 -->
						<c:if test="${empty f_list }">
							<tr>
								<td align="center" colspan="11" height="50"><b>현재 등록된
										게시글이 없습니다</b></td>
							</tr>
						</c:if>
					</table>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td class="pager" align="center">${pagemenu_f}</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
					<img class="util_btn"
					src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
					onclick="location.href='f_insert_form.do'"
					style="cursor: pointer;">
					<form id="f_search">
						<input value="${param.keyword}" name="keyword" width="800" style="font-size:25px;"> 
						<input class="f_button pointer" type="button" value="검색하기" onclick="keyword_search(this.form);">
					</form>
				</td>
			</tr>
		</table>
		</main>
		<%@ include file="../recommend/recommend.jsp"%>
		<%@ include file="../head/footer.jsp"%>
	</body>
</html>