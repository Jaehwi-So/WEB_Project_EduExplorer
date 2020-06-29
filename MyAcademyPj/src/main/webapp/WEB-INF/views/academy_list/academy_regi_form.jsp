<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.user.m_type == '학생'}">
	<script>
	alert("학생회원은 등록할 수 없습니다.");
	location.href="a_list.com";
	</script>
</c:if>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학원 등록</title>
		<script>
			function regi_send(f){
				var a_name = f.a_name.value;
				var a_owner = f.a_owner.value;
				var a_tel = f.a_tel.value;
				var a_content = f.a_content.value;
				var a_site = f.a_site.value;
				var a_addr = f.a_addr.value;
				var a_addr_detail = f.a_addr_detail.value;
				var s_photo = f.s_photo.value;
				var l_photo = f.l_photo.value;
				var a_area = [];
				var j = 0;
				for(var i = 0; i < f.a_area.length; i++){
					if( f.a_area[i].checked == true){
						a_area[j] = null;
						a_area[j] = f.a_area[i].value;
						j++;
					}
				}	
				if(a_name.trim() == ''){
					alert("학원명을 입력해주세요");
					return;
				}
				if(a_owner.trim() == ''){
					alert("점주명을 입력해주세요");
					return;
				}
				if(a_tel.trim() == ''){
					alert("전화번호를 입력해주세요");
					return;
				}
				if(a_content.trim() == ''){
					alert("소개내용을 입력해주세요");
					return;
				}
				if(a_area == ''){
					alert("분야를 선택해주세요");
					return;
				}
				if(a_addr.trim() == ''){
					alert("주소를 입력해주세요");
					return;
				}
				if(a_addr_detail.trim() == ''){
					alert("세부주소를 입력해주세요");
					return;
				}
				if(s_photo.trim() == ''){
					alert("썸네일사진을 입력해주세요");
					return;
				}
				if(l_photo.trim() == ''){
					alert("메인사진을 입력해주세요");
					return;
				}
				if(l_photo.trim() == ''){
					alert("메인사진을 입력해주세요");
					return;
				}
				f.action = "a_academy_regi.com";
				f.submit();	
			}
			
			function addr_found(){
			    window.open("a_addr_form.com", "팝업창", "width=800, height=800, left=300, top=50, scrollbars=yes");
			}
		</script>
	</head>
	<body>
		<form method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>학원명</td>
					<td><input name="a_name"></td>
				</tr>
				<tr>
					<td>점주명</td>
					<td><input name="a_owner"></td>
				</tr>
				<tr>
					<td>학원 전화번호</td>
					<td><input name="a_tel"></td>
				</tr>
				<tr>
					<td>소개글</td>
					<td><textarea name="a_content" rows="10" cols="84"></textarea></td>
				</tr>
				<tr>
					<td>사이트주소</td>
					<td><input name="a_site"></td>
				</tr>
				<tr>
					<td>분야별</td>
					<td>
					<ul >						
						<li >	
							<input type="checkbox"  name="a_area" value="초등부" onclick="">&nbsp;
							<label for="초등부">초등부</label>
						</li>
						<li >
							<input type="checkbox"  name="a_area" value="중등부" onclick="" >&nbsp;
							<label for="중등부">중등부</label>
						</li>						
						<li >							
							<input type="checkbox"  name="a_area" value="고등부" onclick="" >&nbsp;
							<label for="고등부">고등부</label>							
						</li>						
						<li >							
							<input type="checkbox"  name="a_area" value="예체능" onclick="" >&nbsp;
							<label for="예체능">예체능</label>							
						</li>																	
					</ul>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="주소 찾기" onclick="addr_found();"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input name="a_post" id="a_post" readonly></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input name="a_addr" id="a_addr" name="a_addr" readonly></td>
				</tr>
				<tr>
					<td>세부 주소</td>
					<td><input name="a_addr_detail" id="a_addr_detail" readonly></td>
				</tr>
				<tr>
					<td>썸네일사진</td>
					<td><input  type="file" name="s_photo"></td>
				</tr>
				<tr>
					<td>메인사진</td>
					<td><input  type="file" name="l_photo"></td>
				</tr>
				<tr>
					<td>검색 키워드</td>
					<td><input name="a_keyword1"></td>
				</tr>

			</table>
			<input type="button" value="등록하기" onclick="regi_send(this.form);">
		</form>
	</body>
</html>

