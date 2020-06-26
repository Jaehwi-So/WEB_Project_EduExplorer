<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학원 상세보기</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
		
			//수정버튼 클릭
			function modify_academy(f){
				if(${sessionScope.user.m_idx} != f.m_idx.value && ${sessionScope.user.m_type} != '운영자'){
					alert("권한이 없는 접근입니다");
					return;
				}
				f.action = "a_modify_form.com";
				f.submit();
			}
			//삭제버튼 클릭
			function delete_academy(f){
				if(${sessionScope.user.m_idx} != f.m_idx.value && ${sessionScope.user.m_type} != '운영자'){
					alert("권한이 없는 접근입니다");
					return;
				}
				// ??? Session의 m_idx와 현재게시글의 m_idx를 비교하여 유효성 체크 추가 ???
				var a_idx = f.a_idx.value;
				if(confirm("정말로 삭제하시겠습니까?")){
					var url = "a_del.com";	//+다른 사람이 url통해서 쉽게 접근 못하도록 member의 파라미터도 추가해야할듯.
					var param = "a_idx="+a_idx;
					sendRequest(url, param, del_resultFn, "post");
				}
			}							
			//삭제 콜백메서드
			function del_resultFn() {
				if( xhr.readyState == 4 && xhr.status == 200 ){
					var data = xhr.responseText;
					var json = eval(data);
					if( json[0].result == 'yes' ){
						alert("글을 삭제했습니다");
						location.href = "a_list.com";
					}else{
						alert("삭제에 실패했습니다. 관리자에게 문의하세요");
						return;
					}	
				}
			}
			</script>
	</head>
	<body>
		<form method="post">
			<input type="hidden" name="a_idx" value="${vo.a_idx}">
			<input type="hidden" name="m_idx" value="${vo.m_idx}">
			학원명 : ${vo.a_name}<br>
			점주 : ${vo.a_owner}<br>
			전화번호 : ${vo.a_tel}<br>
			내용 : ${vo.a_content}<br>
			사이트주소 : ${vo.a_site}<br>
			우편번호 : ${vo.a_post}<br>
			도로명 주소 : ${vo.a_addr}<br>
			상세 주소 : ${vo.a_addr_detail}<br>
			이미지 : <img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_l}" width="100" /><br>
			등록일 : ${vo.a_regdate}
			<hr>
			<input type="button" value="수정하기" onclick="modify_academy(this.form);">
			<input type="button" value="삭제하기" onclick="delete_academy(this.form);">
		</form>
	</body>
</html>

