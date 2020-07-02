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
				if("${sessionScope.user.m_idx}" != f.m_idx.value && "${sessionScope.user.m_type}" != '운영자'){
					alert("권한이 없는 접근입니다");
					return;
				}
				f.action = "a_modify_form.com";
				f.submit();
			}
			//삭제버튼 클릭
			function delete_academy(f){
				if("${sessionScope.user.m_idx}" != f.m_idx.value && "${sessionScope.user.m_type}" != '운영자'){
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
			//좋아요 버튼 ajax처리 할것임
			function good_send( a_idx ) {
				var url = "good_insert.com";
				var param = "m_id=${user.m_id}&a_idx="+a_idx;   /*회원의 세션 id와 학원상품의 인덱스를 넘긴다 */
				
				sendRequest(url,param,gs_resultFn,"POST");
				
			}

			function gs_resultFn() {
				if( xhr.readyState == 4 && xhr.status == 200 ){
					var data = xhr.responseText;
					var json = eval(data);
					
					if( json[0].param == 'yes' ){
						alert("좋아요 하였습니다!");						
						var indiv = document.getElementById("good_cnt");		
						
						indiv.innerHTML = json[0].good_num;
					
						
					}else if(json[0].param == 'no'){
						alert("좋아요를 취소하였습니다");
						var indiv = document.getElementById("good_cnt");
						indiv.innerHTML = json[0].good_num;
					
					}
					
					
				
				}
				
				
			}
			//즐겨찾기 추가
			function insert(a_idx) {
				
				var url = "bookmark_insert.com";
				
				var param = "m_idx=${user.m_idx}&a_idx="+a_idx;
				
				
				sendRequest(url,param,insert_resultFn,"POST");
				
			}
			
			function insert_resultFn() {
				
				if( xhr.readyState == 4 && xhr.status == 200 ){
					var data = xhr.responseText;
					var json = eval(data);
					if( json[0].param == 'yes' ){
						alert("즐겨찾기 등록하였습니다!");
						return;
					}else{
						alert("이미 즐겨찾기에 등록된 학원입니다");
						return;
					}	
				}
				
			}
			
			function send_m_idx() {
				location.href="bookmark.com?m_idx=${user.m_idx}";
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
			분야별 : ${vo.a_area}<br>
			사이트주소 : ${vo.a_site}<br>
			우편번호 : ${vo.a_post}<br>
			도로명 주소 : ${vo.a_addr}<br>
			상세 주소 : ${vo.a_addr_detail}<br>
			이미지 : <img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_l}" width="100" /><br>
			등록일 : ${vo.a_regdate}<br>
			키워드 : ${vo.a_keyword}
			<input id="good_btn" type="button" value="좋아요" onclick="good_send('${vo.a_idx}')">
			좋아요 : <div style='display:inline' id="good_cnt">${good_num}</div>
			<hr>
			<input type="button" value="수정하기" onclick="modify_academy(this.form);">
			<input type="button" value="삭제하기" onclick="delete_academy(this.form);">
		</form>
			<input type="button" value="즐겨찾기등록" onclick="insert('${vo.a_idx}');">
		
													<!--즐겨찾기 추가매핑으로학원게시물의 인덱스를 넘겨야함  -->
			<input type="button" value="즐겨찾기" onclick="send_m_idx()">
	</body>
</html>

