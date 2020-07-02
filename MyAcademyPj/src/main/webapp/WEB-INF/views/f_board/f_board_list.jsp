<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<table width="700" align="center">
		<tr>
			<td>
				<table width="690" height="50">
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/img/title_04.gif"></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td>
				<table width="690">
					<!-- tr1 -->
					<tr>
						<td>
							<table width="690">
								<tr>
									<td width="50" class="td_a">번호</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="300" class="td_b">제목</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성자</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="90" class="td_b">작성일</td>
									<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
									<td width="60" class="td_c">조회수</td>
								</tr>
								<c:forEach var="vo" items="${f_list}">
									<tr>
										<td align="center" class="td_a_1">${vo.f_idx}</td>
										<td align="center" class="td_b_1"><img
											src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1 left">
											<!-- 댓글 들여쓰기 --> <c:forEach begin="1" end="${vo.f_depth}">
										&nbsp;
										</c:forEach> <c:if test="${vo.f_depth ne 0}">
										└
										</c:if> <!-- del_info가 -1이 아닌 경우 --> <c:if
												test="${vo.del_info ne -1}">
												<a href="f_view.com?f_idx=${vo.f_idx}
										&page=${ empty param.page ? 1 : param.page}" class="num">       
											${vo.f_subject}
										</a>	
											</c:if> <!-- del_info가 -1인 경우 --> <c:if test="${vo.del_info eq -1}">
												<span style="color: #a014a0;">${vo.f_subject }</span>
											</c:if>
										</td>

										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${vo.f_name}</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
										<td align="center" class="td_b_1">${vo.f_regdate}</td>
										<td class="td_b_1"><img src="${pageContext.request.contextPath}/resources/img/td_bg_02.gif"></td>
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
					<!-- tr1 -->
					<!-- tr2 -->
					<tr>
						<td height="10"></td>
					</tr>
					<!-- tr2 -->
					<!-- tr3 -->
					<tr>
						<td>
							<table width="690" bgcolor="#f1f5f4">
								<tr>
									<td class="f11" align="center">${pagemenu_f}</td>
								</tr>
							</table>
						</td>
					</tr>
					<!-- tr3 -->
					<!-- tr4 -->
					<tr>
						<td height="5"></td>
					</tr>
					<!-- tr4 -->
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/img/btn_reg.gif"
							onclick="location.href='f_insert_form.com'" style="cursor: pointer;"></td>
					</tr>
				</table>
			</td>
		</tr>

	</table>
</body>
</html>