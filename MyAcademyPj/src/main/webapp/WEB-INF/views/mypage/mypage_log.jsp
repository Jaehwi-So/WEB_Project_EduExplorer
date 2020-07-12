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
		<title>Insert title here</title>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
			//URL의 존재 여부 확인
		 	function urlExists(url){
	        	var http_status  ="";
	         	var http = new XMLHttpRequest();
	         	http.open('HEAD', url, false);
	         	http.send();
	         	http_status = http.status;
	        	return http_status;	//존재하지 않을 시 404반환
	       	}
		  
		  	function go_url(url, idx){
			  	var exist = urlExists(url);
			  	if(exist == 404){
					  alert("삭제되거나 존재하지 않는 게시물입니다.");
					  return;
			 	 }
			 	else{
					var url = "log_update.com?url=" + url + "&log_idx=" + idx;
					sendRequest(url, null, go_resultFn, "POST");	//방문표시 하러 컨트롤러로 이동
			  	}
		  	}
		  	
			function go_resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					var url = json[0].url;
					location.href = url;
				}
			}
		</script>
	</head>
	
	<body>
		<label>최근 15건의 댓글 알람</label>
		<table border="1">
			<tr>
				<td>알림</td>
				<td>알림일</td>
				<td>타입</td>
			</tr>
			<c:forEach var="i" begin="0" end="14" step="1">
				<c:if test="${not empty reply_list[i]}">
				<tr>
					<td onclick="go_url('${reply_list[i].log_url}', '${reply_list[i].log_idx}');">
						<c:if test="${reply_list[i].log_ck eq 1}">
							확인한 댓글입니다
						</c:if>
						<c:if test="${reply_list[i].log_ck eq 0}">
							새로운 댓글을 확인하세요
						</c:if>
					</td>
					<td>
						${reply_list[i].log_regdate }
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</body>
</html>