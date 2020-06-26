<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수정하기</title>
		<script>
			function modify_send(f){
				var a_name = f.a_name.value;
				var a_owner = f.a_owner.value;
				var a_tel = f.a_tel.value;
				var a_content = f.a_content.value;
				var a_site = f.a_site.value;
				var a_addr = f.a_addr.value;
				var a_addr_detail = f.a_addr_detail.value;
				var s_photo = f.s_photo.value;
				var l_photo = f.l_photo.value;

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
				f.action = "a_academy_modify.com";
				f.submit();
				
			}
			function addr_found(){
			    window.open("a_addr_form.com", "팝업창", "width=800, height=800, left=300, top=50, scrollbars=yes");
			}

		</script>
	</head>
	<body>
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="a_idx" value="${vo.a_idx}">
			<table border="1">
				<tr>
					<td>학원명</td>
					<td><input name="a_name" value="${vo.a_name}"></td>
				</tr>
				<tr>
					<td>점주명</td>
					<td><input name="a_owner" value="${vo.a_owner}"></td>
				</tr>
				<tr>
					<td>학원 전화번호</td>
					<td><input name="a_tel" value="${vo.a_tel}"></td>
				</tr>
				<tr>
					<td>소개글</td>
					<td><textarea name="a_content" rows="10" cols="84">${vo.a_content}</textarea></td>
				</tr>
				<tr>
					<td>사이트주소</td>
					<td><input name="a_site" value="${vo.a_site}"></td>
				</tr>
				<tr>
					<td><input type="button" value="주소 찾기" onclick="addr_found();"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input id="a_post" name="a_post" value="${vo.a_post}" readonly></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="a_addr" name="a_addr" value="${vo.a_addr}" readonly></td>
				</tr>
				<tr>
					<td>세부 주소</td>
					<td><input id="a_detail" name="a_addr_detail" value="${vo.a_addr_detail}" readonly></td>
				</tr>
				<tr>
					<td>썸네일사진</td>
					<td><input type="file" name="s_photo"></td>
				</tr>
				<tr>
					<td>메인사진</td>
					<td><input type="file" name="l_photo"></td>
				</tr>
			</table>
			<input type="button" value="수정하기" onclick="modify_send(this.form);">
		</form>
	</body>
</html>

