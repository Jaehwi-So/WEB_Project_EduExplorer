<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세상의 모든 학원 : SpringSchool</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<style type="text/css">
			.button{
				background-color : #f5f2c4; 
				width:90px;
				font-size:15px;
				height:30px;
				font-weight:bold;
			}
			
			#table{
				margin-top:20px;
				margin-left: 350px;
			}
			
			table tr{
				height:40px; 
				width:70px;
				font-weight:bold;
			}
			#index {
				background-color: #f5f2c4;
			}
			.button2{
				background-color : #fff; 
				width:70px;
				border: 0;
				font-weight:bold;
				margin-top: 20px;
				margin-left: 600px;
			}
			#category_form{
				width : 435px;
				padding : 20px;
			}
			#category_form ul li{
				list-style-type: none;
				display: inline;
			}
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
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
				f.action = "a_academy_modify.com";
				f.submit();
				
			}
			function addr_found(){
			    window.open("a_addr_form.com", "팝업창", "width=800, height=800, left=300, top=50, scrollbars=yes");
			}

		</script>
	</head>
	<body>
	`	<main>
		<!-- ============================상단부 배너================================ -->
		<div id="my_banner">
			<h3 align="center" style="color:'#A21CFF'">ACADEMY</h3>
			<div class="vector">
			<img src="${pageContext.request.contextPath}/resources/img/mypage_academy.png" width="70px" height="70px">
			</div>
			<div class="content">
			<p>&bull; 지역,카테고리,키워드에 따라 본인에게 알맞는 학원을 찾는 공간입니다.<br>
			&bull; 학원을 즐겨찾기에 등록할 수 있고 점주의 경우는 학원을 등록,수정,삭제할 수 있습니다.
			</p>
			</div>
		</div>
		<!-- ============================상단부 배너================================ -->
		<hr>
			
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="a_idx" value="${vo.a_idx}">
			<div id="table">
				<table>
					<tr>
						<th id="index">학원명</th>
						<td><input name="a_name" value="${vo.a_name}" style="width: 435px;"></td>
					</tr>
					<tr>
						<th id="index">점주명</th>
						<td><input name="a_owner" value="${vo.a_owner}" style="width: 435px;"></td>
					</tr>
					<tr>
						<th id="index">학원 전화번호</th>
						<td><input name="a_tel" value="${vo.a_tel}" style="width: 435px;"></td>
					</tr>
					<tr>
						<th id="index">소개글</th>
						<td><textarea name="a_content" rows="10" cols="60">${vo.a_content}</textarea></td>
					</tr>
					<tr>
						<th id="index">사이트주소</th>
						<td><input name="a_site" value="${vo.a_site}" style="width: 435px;"></td>
					</tr>
					<tr>
						<th id="index">카테고리</th>
						<td>
						<div id="category_form">
							<ul>
								<li>
									<p>입시</p>
								</li>
								<li><input type="checkbox" name="a_area" value="단과"
									onclick="">&nbsp; <label for="단과">단과</label></li>
								<li><input type="checkbox" name="a_area" value="종합"
									onclick="">&nbsp; <label for="종합">종합</label></li>
								<li><input type="checkbox" name="a_area" value="입시"
									onclick="">&nbsp; <label for="입시">입시</label></li>
								<li><input type="checkbox" name="a_area" value="편입"
									onclick="">&nbsp; <label for="편입">편입</label></li>
								<li>
									<p>취업</p>
								</li>
								<li><input type="checkbox" name="a_area" value="공무원"
									onclick="">&nbsp; <label for="공무원">공무원</label></li>
								<li><input type="checkbox" name="a_area" value="전문직"
									onclick="">&nbsp; <label for="전문직">전문직</label></li>
								<li>
									<p>예체능</p>
								</li>
								<li><input type="checkbox" name="a_area" value="미술"
									onclick="">&nbsp; <label for="미술">미술</label></li>
								<li><input type="checkbox" name="a_area" value="음악"
									onclick="">&nbsp; <label for="음악">음악</label></li>
								<li><input type="checkbox" name="a_area" value="체육"
									onclick="">&nbsp; <label for="체육">체육</label></li>
								<li>
									<p>어학원</p>
								</li>
								<li><input type="checkbox" name="a_area" value="영어"
									onclick="">&nbsp; <label for="영어">영어</label></li>
								<li><input type="checkbox" name="a_area" value="제2외국어"
									onclick="">&nbsp; <label for="제2외국어">제2외국어</label></li>
								<li>
									<p>자격증</p>
								</li>
								<li><input type="checkbox" name="a_area" value="운전"
									onclick="">&nbsp; <label for="운전">운전</label></li>
								<li><input type="checkbox" name="a_area" value="기타 자격증"
									onclick="">&nbsp; <label for="기타 자격증">기타 자격증</label></li>
								<li><input type="checkbox" name="a_area" value="기타 입시"
									onclick="">&nbsp; <label for="기타 입시">기타 입시</label></li>
								<li><input type="checkbox" name="a_area" value="기타 취업"
									onclick="">&nbsp; <label for="기타 취업">기타 취업</label></li>
								<li><input type="checkbox" name="a_area" value="기타 예체능"
									onclick="">&nbsp; <label for="기타 예체능">기타 예체능</label></li>
								<li><input type="checkbox" name="a_area" value="기타 어학원"
									onclick="">&nbsp; <label for="기타 어학원">기타 어학원</label></li>
								<li><input type="checkbox" name="a_area" value="기타"
									onclick="">&nbsp; <label for="기타">기타</label></li>
							</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th id="index">주소</th>
						<td>
							<input name="a_addr" id="a_addr" name="a_addr" value="${vo.a_site}" style="width: 340px;" readonly>
							<input type="button" class="button" value="주소 찾기" onclick="addr_found();">
						</td>
					</tr>
					<tr>
						<th id="index">우편번호</th>
						<td>
							<input name="a_post" id="a_post" value="${vo.a_post}" style="width: 435px;" readonly>							
						</td>
					</tr>
					<tr>
						<th id="index">세부 주소</th>
						<td><input name="a_addr_detail" id="a_addr_detail" value="${vo.a_addr_detail}" style="width: 435px;" readonly></td>
					</tr>
					<tr>
						<th id="index">썸네일사진</th>
						<td><input type="file" name="s_photo"></td>
					</tr>
					<tr>
						<th id="index">메인사진</th>
						<td><input type="file" name="l_photo"></td>
					</tr>
					<tr>
						<th id="index">검색 키워드</th>
						<td><input name="a_keyword" value="${vo.a_keyword }" style="width: 435px;" value="#(해시태그)를 사용해주세요"></td>
					</tr>
	
				</table>
			</div>
			
			<div id="regi_button">
				<button type="button" class="button2" onclick="modify_send(this.form);">
				<img src="${pageContext.request.contextPath}/resources/img/register.png" width="40px" height="40px"></button>
			</div>
		</form>
	</main>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>

