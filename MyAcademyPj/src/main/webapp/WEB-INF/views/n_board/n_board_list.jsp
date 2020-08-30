<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세상의 모든 학원 : SpringSchool</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/main.css">
		
	<link href='https://fonts.googleapis.com/css?family=Yellowtail'
		rel='stylesheet' type='text/css'>
	<style>
		table {
			margin-left: auto;
			margin-right: auto;
		}
		
		
		#n_banner {
			width: 1000px;
			height: 100px;
			margin: 20px auto;
			padding: 10px;
			border: #403C00 2px solid;
			color: white;
			background: black;
			position: relative;
		}
		
		#n_banner h3 {
			font-size: 40px;
			font-family: 'Yellowtail', serif;
			color: #E5D700;
			text-shadow: 2px 2px black, 0px 0px 6px white, 0px 0px 7px #7F7700;
			letter-spacing: 2px;
		}
		
		#n_banner p {
			font-size: 16px;
		}
		
		#n_banner .n_vector {
			width: 150px;
			height: 80px;
			margin: 10px;
			margin-left: 100px;
			float: left;
			position: absolute;
			top: 10px;
			left: 10px;
		}
		
		#n_banner .n_banner_content {
			width: 650px;
			height: 40px;
			margin: 5px;
			float: right;
		}
		
		#n_table_c, #n_table_c td, #n_table_c th {
			border: 1px solid gray;
			border-width: 1px 0;
			border-collapse: collapse;
			text-align: center;
			height: 40px;
		}
		
		.n_td_tr {
			border-left: 1px solid black;
			border-right: 1px solid black;
		}
		
		.td_a, .td_b, .td_c {
			background-color: #e5d700;
			font-size: 1.1em;
			color: black;
			border-width: 2px 0;
			padding: 6px;
		}
		
		.n_tr_list:hover {
			background-color: #f5f2c4;
		}
		
		.n_tr_list {
			cursor: pointer;
		}
		.util_btn{
			margin-left : 30px; width : 70px; height : 35px;
			cursor:pointer;
		}
	</style>
<script>
	function go_detail(del_info, n_idx){
		if(del_info != -1){
			location.href="n_view.do?n_idx="+n_idx+"&page=${ empty param.page ? 1 : param.page}";
		}
	}
</script>
</head>
<body>
	<main>
		<br>
		<div id="n_banner">
			<h3 align="center" style="color: '#A21CFF'">NOTICEBOARD</h3>
			<div class="n_vector">
				<img
					src="${pageContext.request.contextPath}/resources/img/freeboard.png"
					width="80px" height="80px">
			</div>
			<div class="n_banner_content">
				<p>&bull; 공지게시판입니다.</p>
			</div>
		</div>
		<br>
		<hr>
		<br>
		<table width="1000" align="center" id="n_table_b">
			<!-- tr1 -->
			<tr>
				<td>
					<table width="1000" align="center" id="n_table_c">
						<tr class="n_td_tr">
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

						<c:forEach var="vo" items="${n_list}">
							<tr class="n_tr_list" onclick="go_detail(${vo.del_info}, ${vo.n_idx })">
								<td align="center" class="td_a_1">${vo.n_idx}</td>
								<td align="center" class="td_b_1"></td>
								<td align="center" class="td_b_1 left">
									<c:if test="${vo.del_info ne -1}">
										 ${vo.n_subject} 
									</c:if> <!-- del_info가 -1인 경우 --> 
									<c:if test="${vo.del_info eq -1}">
										<span style="color: #a014a0;">${vo.n_subject }</span>
									</c:if>
								</td>

								<td class="td_b_1"></td>
								<td align="center" class="td_b_1">${vo.n_name}</td>
								<td class="td_b_1"></td>
								<td align="center" class="td_b_1">${vo.n_regdate}</td>
								<td class="td_b_1"></td>
								<td align="center" class="td_c_1">${vo.n_readhit}</td>
							</tr>
						</c:forEach>

						<!-- 데이터가 없는 경우 -->
						<c:if test="${empty n_list }">
							<tr>
								<td align="center" colspan="11" height="50">
									<b>현재 등록된 게시글이 없습니다</b>
								</td>
							</tr>
						</c:if>
					</table>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td class="pager" align="center">${n_pagemenu}</td>
			</tr>
			<tr><td><br></td></tr>
			<!-- tr3 -->
			<tr>
				<td>
				<img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
					onclick="location.href='n_insert_form.do'"
					class="util_btn">
				</td>
			</tr>
		</table>

	</main>
		<%@ include file="../recommend/recommend.jsp" %>
		<%@ include file="../head/footer.jsp" %>
		

</body>
</html>