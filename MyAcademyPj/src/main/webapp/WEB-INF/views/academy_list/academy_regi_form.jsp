<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>등록</title>
		<script>
			function regi_send(f){
				var a_name = f.a_name.value;
				var a_owner = f.a_owner.value;
				var a_tel = f.a_tel.value;
				var a_content = f.a_content.value;
				var a_site = f.a_site.value;
				var a_addr = f.a_addr.value;
				var s_photo = f.s_photo.value;
				var l_photo = f.l_photo.value;

				if(a_name == ''){
					alert("학원명을 입력해주세요");
					return;
				}
				if(a_owner == ''){
					alert("점주명을 입력해주세요");
					return;
				}
				if(a_tel == ''){
					alert("전화번호를 입력해주세요");
					return;
				}
				if(a_content == ''){
					alert("소개내용을 입력해주세요");
					return;
				}
				if(a_site == ''){
					alert("사이트주소를 입력해주세요");
					return;
				}
				if(a_addr == ''){
					alert("주소를 입력해주세요");
					return;
				}
				if(s_photo == ''){
					alert("썸네일사진을 입력해주세요");
					return;
				}
				if(l_photo == ''){
					alert("메인사진을 입력해주세요");
					return;
				}
				
				f.action = "a_academy_regi.com";
				f.submit();
				
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
					<td>학원위치(주소)</td>
					<td><input name="a_addr"></td>
				</tr>
				<tr>
					<td>썸네일사진</td>
					<td><input  type="file" name="s_photo"></td>
				</tr>
				<tr>
					<td>메인사진</td>
					<td><input  type="file" name="l_photo"></td>
				</tr>
			</table>
			<input type="button" value="등록하기" onclick="regi_send(this.form);">
		</form>
	</body>
</html>

