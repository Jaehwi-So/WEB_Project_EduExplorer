<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../head/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{border-collapse: collapse;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function bm_delete(a_idx) {
			if(confirm("정말로 삭제하시겠습니까?")){
			var url = "bm_delete.com";
			var param = "m_idx=${user.m_idx}&a_idx="+a_idx;
			
			sendRequest(url,param,delete_resultFn,"POST");
			}
			return;
			
		}
		function delete_resultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){
				var data = xhr.responseText;
				var json = eval(data);
				if( json[0].param == 'yes' ){
					alert("즐겨찾기 삭제하였습니다!");
					location.href="bookmark.com?m_idx=${user.m_idx}";
				}else{
					alert("즐겨찾기 삭제오류 관리자에게문의하세요");
					location.href="member_service.com";					
				}	
			}
			
		}
	</script>
</head>
<body>

	<table border="1">
	
	<tr>
		<th>학원명</th>
		<th>점주</th>
		<th>전화번호</th>
		<th>내용</th>
		<th>사이트</th>
		<th>주소</th>
		<th>이미지</th>
		<th colspan="2">비고</th>
	</tr>
	
	<c:if test="${ !empty list }">
	<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.a_name}</td>
			<td>${vo.a_owner}</td>
			<td>${vo.a_tel }</td>
			<td>${vo.a_content }</td>
			<td>${vo.a_site }</td>
			<td>${vo.a_addr }</td>
			<td><img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}"/></td>
			<td><input type="button" value="즐겨찾기 삭제" onclick="bm_delete('${vo.a_idx}')"></td>	
			<td><input type="button" value="상세보기" onclick="location.href='a_list_detail.com?a_idx=${vo.a_idx}'"></td>	
		</tr>
	</c:forEach>
	</c:if>
	
	<c:if test="${ empty list }">
		<tr><td colspan="8">즐겨찾기 목록없음</td></tr>
	</c:if>
	</table>
	
	
	
	
</body>
</html>