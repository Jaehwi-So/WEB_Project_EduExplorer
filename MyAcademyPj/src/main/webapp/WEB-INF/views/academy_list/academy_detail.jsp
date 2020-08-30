<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세상의 모든 학원 : SpringSchool</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/main.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script>
			if("${param.notice}" == "true"){
				location.href = "#inner";
			}
			//수정버튼 클릭
			function modify_academy() {
				var f = document.f; 
				var m_idx = "${sessionScope.user.m_idx}";
				var m_type = "${sessionScope.user.m_type}";
				if (m_idx != f.m_idx.value && m_type != '관리자') {
					alert("권한이 없는 접근입니다");
					return;
				}
				f.action = "a_modify_form.do";
				f.submit();
			}
			//삭제버튼 클릭
			function delete_academy() {
				var f = document.f; 
				var m_idx = "${sessionScope.user.m_idx}";
				var m_type = "${sessionScope.user.m_type}";
				if (m_idx != f.m_idx.value && m_type != '관리자') {
					alert("권한이 없는 접근입니다");
					return;
				}
				var a_idx = f.a_idx.value;
				if (confirm("정말로 삭제하시겠습니까?")) {
					var url = "a_del.do"; 
					var param = "a_idx=" + a_idx;
					sendRequest(url, param, del_resultFn, "post");
				}
			}
			//삭제 콜백메서드
			function del_resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					if (json[0].result == 'yes') {
						alert("글을 삭제했습니다");
						location.href = "a_list.do";
					} else {
						alert("삭제에 실패했습니다. 관리자에게 문의하세요");
						return;
					}
				}
			}
			//좋아요 ajax처리
			function good_send(a_idx) {
				var url = "good_insert.do";
				var param = "m_id=${user.m_id}&a_idx=" + a_idx; /*회원의 세션 id와 학원상품의 인덱스를 넘긴다 */
		
				sendRequest(url, param, gs_resultFn, "POST");
		
			}
		
			function gs_resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
		
					if (json[0].param == 'yes') {
						alert("좋아요 하였습니다!");
						var indiv = document.getElementById("good_cnt");
						indiv.innerHTML = json[0].good_num;
						document.getElementById("good_img").innerHTML = 
					'<img src="${pageContext.request.contextPath}/resources/img/good_yes.png"width="40px" height="40px">';

		
					} else if (json[0].param == 'no') {
						alert("좋아요를 취소하였습니다");
						var indiv = document.getElementById("good_cnt");
						indiv.innerHTML = json[0].good_num;
						document.getElementById("good_img").innerHTML = 
					'<img src="${pageContext.request.contextPath}/resources/img/good.png"width="40px" height="40px">';
						
					}
				}
			}
		
			//즐겨찾기 추가
			function insert(a_idx) {
				var url = "bookmark_insert.do";
				var param = "m_idx=${user.m_idx}&a_idx=" + a_idx;
				sendRequest(url, param, insert_resultFn, "POST");
			}
		
			//즐겨찾기 추가 콜백메서드
			function insert_resultFn() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);
					if (json[0].param == 'yes') {
						alert("즐겨찾기에 등록하였습니다!");
						document.getElementById("bookmark_img").innerHTML = 
							'<img src="${pageContext.request.contextPath}/resources/img/bookmark_yes.png"width="40px" height="40px">';
						if (confirm("즐겨찾기 화면으로 이동하시겠습니까?")) {
							send_m_idx();
						}	
						return;
					} else {
						if (confirm("이미 즐겨찾기에 등록된 학원입니다. 즐겨찾기 화면으로 이동하시겠습니까?")) {
							send_m_idx();
						}
						return;
					}
				}
			}
		
			//즐겨찾기 목록으로 이동
			function send_m_idx() {
				location.href = "bookmark.do?m_idx=${user.m_idx}";
			}
		
			//학원소식 글쓰기
			function a_notice_form(f) {
				var m_idx = "${sessionScope.user.m_idx}";
				var m_type = "${sessionScope.user.m_type}";
				if (m_idx != f.m_idx.value && m_type != '운영자') {
					alert("권한이 없는 접근입니다");
					return;
				}
				f.action = "a_notice_insert_form.do";
				f.submit();
			}
		
			//1:1문의게시판 이동
			function send_meet(a_idx) {
				if("${user.m_idx}" == null){
					alert("로그인 세션이 만료되었습니다.");
					return;
				}
				location.href = "meeting.do?m_idx=${user.m_idx}&a_idx=" + a_idx;
			}
		</script>
		
		<style>

		
		#academy_table {
			width : 850px;
			padding : 40px;
			padding-left : 100px;
			padding-right : 55px;
			margin-bottom: 50px;
			margin : auto;
			margin-top: 50px;
			border : 2px solid black;
		}
		
		#academy_info {
			margin-left: 50px; 
			font-family: 'Do Hyeon';
		}
		
		.academy_name {
			font-weight: bold;
			font-size: 45px;
			font-family: 'Do Hyeon';
		}
		
		#academy_button {
			margin-left: 50px;
		}
		
		#academy_main {
			background: white;
			margin-top: 20px;
		}
		
		#academy_photo {
			margin: 20px;
			width : 630px;
			height : 512px;
			padding : 30px;
			background-color : #ffee0023;
			border : solid black;
		}
		
		#academy_content {
			width : 630px;
			margin-left: 20px;
			margin-bottom: 20px;
			margin-right: 20px;
			border: solid black;
			padding : 30px;
			background-color : #ffee0023;
			font-family : "돋움체";
		}
		#academy_content .textdata{
			backgrount-color : white;
			font-size : 15px;
			overflow : auto;
		}
		
		#academy_addr {
			border: solid black 3px;
			margin-top: 40px;
		}
		
		.addr_content {
			text-align : center;
		}
		
		.addr_detail {
			background-color: #f5f2c4;
			font-weight: bold;
			text-align : center;
		}
		
		#map {
			border: solid black 2px;
			margin: 20px;
			margin-top: 25px;
		}
		
		#academy_inner{
			width : 700px;
			margin : 40px auto;
			margin-botton : 15px;
			margin-top: 40px;
		}	
		.inner_title{
			width : 600px;
			margin : 20px auto;
			font-family : Do Hyeon, sans-serif;
			font-size : 35px;
			text-align : center;
		}
		.academy_bottom {
			margin-top: 10px;
			margin-left: 280px; 
			margin-bottom: 10px;
		}
		.bookmark_bottom {
			margin-top: 10px;
			margin-left: 25px;
			margin-bottom: 10px;
		}
		
		#table_inner, #table_inner th, #table_inner td {
			border: 1px solid gray;
			border-width: 1px 0;
			border-collapse: collapse;
			text-align: center;
			height: 40px;
		}
		
		.t_a {
			background-color: #e5d700;
			font-size: 1.1em;
			color: #black;
			border-width: 2px 0;
			padding: 6px;
		}
		
		#one_and_one {
			margin-left: 30px;
		}
		
		.academy_etc {
			font-size: 20px;
			color: #1854ba;
		}
		.button {
			background-color: #fff;
			border: 0;
			cursor: pointer;
		}
		
		.button2 {
			background-color: #fff; 	
			border: 0;
			cursor: pointer;
		}
		.button3 {
			background-color: #000;
			width: 110px;
			height: 43px;
			font-size: 22px;
			color: #E5D700;
			border: 2px solid black;
			font-family: 'Do Hyeon', sans-serif;
			cursor: pointer;
		}
		.button4 {
			margin-left: 600px; 
			display : inline;
			background-color: #000;
			width: 90px;
			height: 40px;
			font-size: 20px;
			color: #E5D700;
			border: 2px solid black;
			font-family: 'Do Hyeon', sans-serif;
			cursor: pointer;
		}
		.m_button {
			width : 140px; height : 50px; padding : 10px; 
			font : 20px bold;
			font-family : Do Hyeon, "돋움체";
			background-color: #f5f2c4; 
			cursor:pointer;
		}
		.s_photo{
			border : solid black;
			padding : 2px;
		}
		</style>
	</head>
	<body>
		<main>
			<form name="f" method="post">
				<hr>
				<input type="hidden" name="a_idx" value="${vo.a_idx}">
				<input type="hidden" name="m_idx" value="${vo.m_idx}">
				<div id="academy_table">
					<table width="800" align="center" id="academy_table_a">
						<tr>
							<td>					
								<table width="800" align="center" id="academy_table_b">
									<tr>
										<td rowspan="2" width="200">
											<img
												src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}"
												width="200" height="200" class='s_photo' />
										</td>
										<td colspan="3">
											<div id="academy_info">
												<p class="academy_name">${vo.a_name}</p>
												<br>
												<div class="academy_etc">
													<p>${vo.a_area}</p>
													<p>${vo.a_keyword}</p>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td width="200">
											<div id="academy_button">
											<button type="button" class="button"
													onclick="good_send('${vo.a_idx}')">
													<div id="good_img">
													<c:if test="${good_ck eq 1}">
														<img src="${pageContext.request.contextPath}/resources/img/good_yes.png"
														 width="40px" height="40px"> 
													</c:if> 
													<c:if test="${good_ck eq 0}">
														<img src="${pageContext.request.contextPath}/resources/img/good.png"
														 width="40px" height="40px">
													</c:if>
													</div>
													
											</button>
				
											좋아요: 
											<div style='display: inline' id="good_cnt">${good_num}</div>
											</div>
										</td>
										<td width="150">
											<div id="bookmark_button">
											<button type="button" class="button"
													onclick="insert('${vo.a_idx}');">
													<div id="bookmark_img">
														<c:if test="${bookmark_ck eq 1}">		
														<img src="${pageContext.request.contextPath}/resources/img/bookmark_yes.png"
															 width="40px" height="40px"> 
														</c:if> 
														<c:if test="${bookmark_ck eq 0}">
															<img src="${pageContext.request.contextPath}/resources/img/bookmark.png"
															 width="40px" height="40px">
														</c:if>
													</div>
											</button>
											즐겨찾기
											</div>
										</td>
										<td>
											<div id="one_and_one">
												<input type="button" class="button3" value="1:1문의"
													   onclick="send_meet('${vo.a_idx}');">
											</div>
										</td>
									</tr>
								</table>
								<!-- 썸네일, 인포, 버튼 끝 -->
							</td>
						</tr>
						
						<tr>
							<td>
								<div id="academy_main">
									<!-- 메인사진, 내용 -->
									<table width="800" align="center" id="academy_table_c">
										<tr>
											<td align="center">
												<div id="academy_photo">
												<img
													src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_l}"
													width = "512px" height="512px" />
												</div>
											</td>
										</tr>
										<tr>
											<td align="center">
												<div id="academy_content">
												<textarea class="textdata" rows="15" cols="76" readonly>${vo.a_content}</textarea>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<!-- 메인사진, 내용 -->
							</td>
						</tr>
						
						<tr>
							<td>
								<div id="academy_addr">
									<table width="800" align="center" id="academy_table_d" border="1">
										<tr>
											<td rowspan="4" width="200">
												<div id="map" style="width: 200px; height: 200px; margin-top: 10px;"></div>
											</td>
											<td class="addr_detail">
												우편번호 
											</td>
											<td class="addr_content">
												${vo.a_post}
											</td>
										</tr>
										
										<tr>
											<td class="addr_detail">
												도로명 주소 
											</td>
											<td class="addr_content">
												${vo.a_addr}
											</td>
										</tr>
										
										<tr>
											<td class="addr_detail">
												홈페이지주소  
											</td>
											<td class="addr_content">
												<a href="http://${vo.a_site}">${vo.a_site}</a>
											</td>
										</tr>
										
										<tr>
											<td class="addr_detail">
												전화번호 
											</td>
											<td class="addr_content">
												${vo.a_tel}
											</td>
										</tr>
									</table>
								</div>					
							</td>
						</tr>
					</table>
				</form>
			<!-- 학원내 게시판 테이블 -->
			<div id="academy_inner">
				<div class="inner_title"><a name="inner">학원 소식</a></div>	
				<div id="test" style="display: inline;">		
				<form>
					<input type="hidden" name="a_idx" value="${vo.a_idx}"> 
					<input type="hidden" name="a_owner" value="${vo.a_owner}"> 
					<input type="hidden" name="m_idx" value="${vo.m_idx}">
					<input type="hidden" name="page" value="${ empty param.page ? 1 : param.page}">
					<input type="button" value="글쓰기" class="button4"
							onclick="a_notice_form(this.form);">
				</form>
				</div>
				<br>
				<table class="t2" border="1" width="700" align="center" id="table_inner">
					<tr>
						<th class="t_a" width="350" >제목</th>
						<th class="t_a">작성자</th>
						<th class="t_a">작성일</th>
					</tr>
					<c:forEach var="vo" items="${list }">
						<input type="hidden" value="${vo.a_notice_idx }">
		
						<tr>
							<td><a href="notice_view.do?a_notice_idx=${vo.a_notice_idx}&page=${ empty param.page ? 1 : param.page}">
									${vo.a_notice_subject } </a></td>
							<td>${vo.a_owner }</td>
							<td>${vo.a_notice_regdate }</td>
						</tr>
		
					</c:forEach>
		
					<c:if test="${ empty list }">
						<tr>
							<td align="center" colspan="3" height="50">현재 등록된 게시글이 없습니다</td>
						</tr>
					</c:if>
				</table>
				<div align="center" style="font-size:20px;">${pageMenu}</div>
			</div>
			
			<div class="academy_bottom">
				<table class="t1">
					<tr>
						<td>
						<input type="button" class="m_button"
								onclick="modify_academy();" value="수정">
						</td>
						<td>
						<input type="button" class="m_button"
								onclick="delete_academy();" value="삭제">
						</td>
						<td>
					</tr>
				</table> 
			</div>
			<hr>	

		<!-- ===================카카오맵 API관련========================= -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57bd357082d358d251a6461a6aace40b&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();
			var address_input = "${vo.a_addr}";

			geocoder.addressSearch(
				address_input, function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {
									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.a_name}</div>'
											});
									infowindow.open(map, marker);
									map.setCenter(coords);
								}
							});
			</script>
			<!-- ===================카카오맵 API관련========================= -->
		</main>
			<%@ include file="../head/footer.jsp" %>
	</body>
</html>

<c:if test="${sessionScope.user.m_idx ne vo.m_idx}">
	<script type="text/javascript">
		var test = document.getElementById("test");
		if (test.style.display == "inline") {
			test.style.display = "none";
		}
	</script>
</c:if>
