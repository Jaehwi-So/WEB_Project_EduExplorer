<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head/header.jsp" %>
<c:if test="${sessionScope.user.m_type == '학생'}">
	<script>
	alert("학생회원은 등록할 수 없습니다.");
	location.href="a_list.do";
	</script>
</c:if>  
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
				cursor : pointer;
			}
			#reg_table{
				margin-top:20px;
				margin-left: 250px;
			}
			
			table tr{
				height:40px; 
				width:70px;
				font-weight:bold;
			}
			.index {
				background-color: #f5f2c4;
				position: relative;
			}
			.button2{
				background-color : #f5f2c4; 
				width:90px;
				font-size:15px;
				height:30px;
				font-weight:bold;
				cursor : pointer;
				margin-top: 20px;
				margin-left: 600px;
				cursor: pointer;
			}
			#category_form{
				width : 435px;
				padding : 20px;
			}
			#category_form ul li {
				list-style-type: none;
				display: inline;
			}
			.input_font{
				font-size : 15px;
			}
			.index .tooltip-content {
				visibility: hidden;
				width: 300px;
				background-color: #fcdb23;
				padding: 15px;
				color: black;
				text-align: center;
				position: absolute;
				z-index: 1;
				border : solid black;
				bottom: 100%;
				left: 20%;
				margin-left: -110px;
			}
			.index .tooltip-content::after {
			content: " ";
			position: absolute;
			top: 100%;
			left: 50%;
			margin-left: -10px;
			border-width: 10px;
			border-style: solid;
			border-color: #fcdb23 transparent transparent transparent;
			}
			.index:hover .tooltip-content { visibility: visible; }
						
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
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
				f.a_keyword.value = f.a_keyword.value.trim();
				if(f.a_keyword.value == ''){
					f.a_keyword.value = "#전체";
				}
				var a_keyword = f.a_keyword.value;
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
				var tel_exp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
				if(!tel_exp.test(a_tel)){
					alert("전화번호 형식이 올바르지 않습니다.");
					return;
				}
				if(a_name.length > 15){
					alert("학원명은 15자 이내로 입력해주세요.");
					return;
				}
				if(a_content.length > 1000){
					alert("학원 소개글은 1000자 이내로 입력해주세요.");
					return;
				}
				if(a_keyword > 100){
					alert("키워드는 100자 이내로 입력해주세요");
					return;
				}
				f.action = "a_academy_regi.do";
				f.submit();	
			}
			
			function addr_found(){
			    window.open("a_addr_form.do", "팝업창", "width=700, height=500, left=300, top=50, scrollbars=yes");
			}
		</script>
	</head>
	<body>
		<main>
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
			<div id="reg_table">
				<table>
					<tr>
						<th class="index" width="150px">학원명
							<div class="tooltip-content">15자 이내의 학원의 이름을 입력해주세요.</div> 
						</th>
						<td width="700px"><input class="input_font" name="a_name" style="width: 600px;"></td>
					</tr>
					<tr>
						<th class="index">점주명
							<div class="tooltip-content">학원 책임 점주 이름을 입력해주세요.</div> 
						</th>
						<td><input class="input_font" name="a_owner" style="width: 600px;"></td>
					</tr>
					<tr>
						<th class="index">학원 전화번호
							<div class="tooltip-content">전화번호 형식에 맞추어 입력해주세요.</div> 
						</th>
						<td><input class="input_font" name="a_tel" style="width: 600px;"></td>
					</tr>
					<tr>
						<th class="index">소개글
							<div class="tooltip-content">교습 과목, 분아, 시설 등 학원에 대한 간단한 소개글을 입력해주세요. 1000자 이내</div> 
						</th>
						<td><textarea class="input_font" name="a_content" rows="15" cols="76"></textarea></td>
					</tr>
					<tr>
						<th class="index">사이트 주소
						<div class="tooltip-content">학원 홈페이지가 있는 경우 사이트 주소를 입력해주세요.</div> 
						</th>
						<td><input class="input_font" name="a_site" style="width: 600px;"></td>
					</tr>
					<tr>
						<th class="index">카테고리
						<div class="tooltip-content">학원의 카테고리를 선택해주세요. 검색 시 해당 카테고리 기반으로 검색됩니다. 중복체크도 가능합니다.</div> 
						</th>
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
									onclick="">&nbsp; <label for="IT,컴퓨터">IT,컴퓨터</label></li>
								<li><input type="checkbox" name="a_area" value="운전"
									onclick="">&nbsp; <label for="운전">운전</label></li>
								<li><input type="checkbox" name="a_area" value="기타 자격증"
									onclick="">&nbsp; <label for="기타 자격증">기타 자격증</label></li>
								<li><input type="checkbox" name="a_area" value="기타 입시"
									onclick="">&nbsp; <label for="기타 입시">기타 입시</label><br></li>
								<li><input type="checkbox" name="a_area" value="기타 취업"
									onclick="">&nbsp; <label for="기타 취업">기타 취업</label></li>
								<li><input type="checkbox" name="a_area" value="기타 예체능"
									onclick="">&nbsp; <label for="기타 예체능">기타 예체능</label></li>
								<li><input type="checkbox" name="a_area" value="기타 어학원"
									onclick="">&nbsp; <label for="기타 어학원">기타 어학원</label><br></li>
								<li><input type="checkbox" name="a_area" value="기타"
									onclick="">&nbsp; <label for="기타">기타</label></li>
							</ul>
						</div>
						</td>
					</tr>
					<tr>
						<th class="index">주소
						<div class="tooltip-content">학원 주소를 입력해주세요.</div> 
						</th>
						<td>
							<input class="input_font" name="a_addr" id="a_addr" name="a_addr" style="width: 500px;" readonly>
							<input type="button" class="button" value="주소 찾기" onclick="addr_found();">
						</td>
					</tr>
					<tr>
						<th class="index">우편번호</th>
						<td>
							<input class="input_font" name="a_post" id="a_post" style="width: 600px;" readonly>							
						</td>
					</tr>
					<tr>
						<th class="index">세부 주소
							<div class="tooltip-content">세부 주소는 반드시 입력해야 합니다.</div> 
						</th>
						<td><input class="input_font" name="a_addr_detail" id="a_addr_detail" style="width: 600px;" readonly></td>
					</tr>
					<tr>
						<th class="index">썸네일사진
							<div class="tooltip-content">목록에 노출될 썸네일 사진을 등록해주세요. 256x256px 권장</div> 
						</th>
						<td><input class="input_font" type="file" name="s_photo"></td>
					</tr>
					<tr>
						<th class="index">메인사진
							<div class="tooltip-content">학원 소개와 함께 게시될 사진을 등록해주세요. 512x512px 권장</div> 
						</th>
						
						<td><input class="input_font" type="file" name="l_photo"></td>
					</tr>
					<tr>
						<th class="index">검색 키워드
							<div class="tooltip-content">해시태그(#)을 이용하여 검색될 키워드를 설정해주세요. 키워드는 #을 통해 구분합니다. 100자 이내</div> 
						</th>
						<td><input class="input_font" name="a_keyword" style="width: 600px;" placeholder="#(해시태그 사용) ex)#자바 #Spring"></td>
					</tr>
	
				</table>
			</div>
			
			<div id="regi_button">
				<input type="button" class="button2"  value="등록하기" onclick="regi_send(this.form);">
			</div>
		</form>
		
	</main>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>

