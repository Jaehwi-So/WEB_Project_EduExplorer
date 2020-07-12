<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<style>
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

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link href='https://fonts.googleapis.com/css?family=Yellowtail'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Do+Hyeon'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script>
	//수정버튼 클릭
	function modify_academy(f) {
		var m_idx = "${sessionScope.user.m_idx}";
		var m_type = "${sessionScope.user.m_type}";
		if (m_idx != f.m_idx.value && m_type != '운영자') {
			alert("권한이 없는 접근입니다");
			return;
		}
		f.action = "a_modify_form.com";
		f.submit();
	}
	//삭제버튼 클릭
	function delete_academy(f) {
		var m_idx = "${sessionScope.user.m_idx}";
		var m_type = "${sessionScope.user.m_type}";
		if (m_idx != f.m_idx.value && m_type != '운영자') {
			alert("권한이 없는 접근입니다");
			return;
		}
		// ??? Session의 m_idx와 현재게시글의 m_idx를 비교하여 유효성 체크 추가 ???
		var a_idx = f.a_idx.value;
		if (confirm("정말로 삭제하시겠습니까?")) {
			var url = "a_del.com"; //+다른 사람이 url통해서 쉽게 접근 못하도록 member의 파라미터도 추가해야할듯.
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
				location.href = "a_list.com";
			} else {
				alert("삭제에 실패했습니다. 관리자에게 문의하세요");
				return;
			}
		}
	}
	//좋아요 버튼 ajax처리 할것임
	function good_send(a_idx) {
		var url = "good_insert.com";
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

			} else if (json[0].param == 'no') {
				alert("좋아요를 취소하였습니다");
				var indiv = document.getElementById("good_cnt");
				indiv.innerHTML = json[0].good_num;

			}
		}
	}

	//즐겨찾기 추가
	function insert(a_idx) {
		var url = "bookmark_insert.com";
		var param = "m_idx=${user.m_idx}&a_idx=" + a_idx;
		sendRequest(url, param, insert_resultFn, "POST");
	}

	//즐겨찾기 추가 콜백메서드
	function insert_resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);
			if (json[0].param == 'yes') {
				alert("즐겨찾기 등록하였습니다!");
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
		location.href = "bookmark.com?m_idx=${user.m_idx}";
	}

	//학원소식 글쓰기
	function a_notice_form(f) {
		var m_idx = "${sessionScope.user.m_idx}";
		var m_type = "${sessionScope.user.m_type}";
		if (m_idx != f.m_idx.value && m_type != '운영자') {
			alert("권한이 없는 접근입니다");
			return;
		}
		f.action = "a_notice_insert_form.com";
		f.submit();
	}

	//1:1문의게시판 이동
	function send_meet(a_idx) {
		location.href = "meeting.com?m_idx=${user.m_idx}&a_idx=" + a_idx;
	}
</script>

<style>
.button3 {
	background-color: #000;
	width: 90px;
	height: 40px;
	font-size: 20px;
	color: #E5D700;
	border: 2px solid black;
	font-family: 'Do Hyeon', sans-serif;
	cursor: pointer;
}

#academy_table {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 250px;
}

#academy_info {
	margin-left: 50px; 
	font-family: 'Do Hyeon';
}

.academy_name {
	font-weight: bold;
	font-size: 40px;
	font-family: 'Do Hyeon';
}

#academy_button {
	margin-left: 50px;
}

#academy_main {
	border: solid black 3px;
	background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
	margin-top: 20px;
}

#academy_photo {
	margin: 20px;
}

#academy_content {
	margin-left: 20px;
	margin-bottom: 20px;
	margin-right: 20px;
	border: solid black 1px;
	overflow-y: scroll;
	height: 200px;	
	background-color: #fff; 
}

#academy_addr {
	border: solid black 3px;
	margin-top: 40px;
}

#addr_detail {
	margin-left: 50px;
}

.addr_detail {
	background-color: #f5f2c4;
	font-weight: bold;
}

#map {
	border: solid black 2px;
	margin: 20px;
	margin-top: 25px;
}

#academy_inner{
	margin-left: 300px;
	margin-top: 40px;
}

.button4 {
	margin-left: 910px;
	margin-bottom: 10px;
	margin-top: 15px;
	background-color: #000;
	width: 90px;
	height: 40px;
	font-size: 20px;
	color: #E5D700;
	border: 2px solid black;
	font-family: 'Do Hyeon', sans-serif;
	cursor: pointer;
}

.academy_bottom {
	margin-top: 10px;
	margin-left: 250px;
	margin-bottom: 10px;
}

#table_inner, #table_inner th, #table_inner td {
	border: 1px solid gray;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	height: 40px;
}

#t_a {
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
</style>

</head>
<body>
	<main>
		<!-- ============================상단부 배너================================ -->
		<div id="my_banner">
			<h3 align="center" style="color: '#A21CFF'">ACADEMY</h3>
			<div class="vector">
				<img
					src="${pageContext.request.contextPath}/resources/img/mypage_academy.png"
					width="70px" height="70px">
			</div>
			<div class="content">
				<p>
					&bull; 지역,카테고리,키워드에 따라 본인에게 알맞는 학원을 찾는 공간입니다.<br> &bull; 학원을
					즐겨찾기에 등록할 수 있고 점주의 경우는 학원을 등록,수정,삭제할 수 있습니다.
				</p>
			</div>
		</div>
		<!-- ============================상단부 배너================================ -->

		<form method="post">
			<hr>

			<input type="hidden" name="a_idx" value="${vo.a_idx}"> <input
				type="hidden" name="m_idx" value="${vo.m_idx}">
			<div id="academy_table">
				<table width="800" align="center" id="academy_table_a">
					<tr>
						<td>					
							<!-- 썸네일, 인포, 버튼 -->
							<table width="800" align="center" id="academy_table_b">
								<tr>
									<td rowspan="2" width="200">
										<img
											src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}"
											width="200" height="200" />
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
										<button type="button" class="button2"
												onclick="good_send('${vo.a_idx}')">
												<img src="${pageContext.request.contextPath}/resources/img/good.png"
													 width="30px" height="30px">
										</button>
										좋아요: 
										<div style='display: inline' id="good_cnt">${good_num}</div>
										</div>
									</td>
									<td width="100">
										<button type="button" class="button"
												onclick="insert('${vo.a_idx}');">
												<img
													src="${pageContext.request.contextPath}/resources/img/bookmark.png"
													width="30px" height="30px">즐겨찾기
										</button>
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
												src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}"
												height="200" />
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div id="academy_content">
												<p>${vo.a_content}</p>
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
											<div id="addr_detail">
												우편번호 
											</div>
										</td>
										<td>
											<div id="addr_detail">
												 ${vo.a_post}
											</div>
										</td>
									</tr>
									
									<tr>
										<td class="addr_detail">
											<div id="addr_detail">
												도로명 주소 
											</div>
										</td>
										<td>
											<div id="addr_detail">
												${vo.a_addr}
											</div>
										</td>
									</tr>
									
									<tr>
										<td class="addr_detail">
											<div id="addr_detail">
												홈페이지주소  
											</div>
										</td>
										<td>
											<div id="addr_detail">
												${vo.a_site}
											</div>
										</td>
									</tr>
									
									<tr>
										<td class="addr_detail">
											<div id="addr_detail">
												전화번호 
											</div>
										</td>
										<td>
											<div id="addr_detail">
												${vo.a_tel}
											</div>
										</td>
									</tr>
								</table>
							</div>					
						</td>
					</tr>
				</table>
			</div>
			
			<div class="academy_bottom">
			<table class="t1">
				<tr>
					<td>
					<button type="button" class="button"
							onclick="modify_academy(this.form);">
							<img
								src="${pageContext.request.contextPath}/resources/img/register.png"
								width="30px" height="30px">수정
					</button>
					</td>
					<td>
					<button type="button" class="button"
							onclick="delete_academy(this.form);">
							<img
								src="${pageContext.request.contextPath}/resources/img/delete.png"
								width="30px" height="30px">삭제
					</button>
					</td>
				</tr>

			</table>
			</div>
			
			<hr>
			
			
		</form>


		<!-- 학원내 게시판 테이블 -->
		<div id="academy_inner">
			<table class="t2" border="1" width="700" align="center" id="table_inner">
				<tr>
					<th id="t_a">제목</th>
					<th id="t_a">작성자</th>
					<th id="t_a">작성일</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<input type="hidden" value="${vo.a_notice_idx }">
	
					<tr>
						<td><a href="view.com?a_notice_idx=${vo.a_notice_idx }">
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
		</div>
		
		<form>
			<input type="hidden" name="a_idx" value="${vo.a_idx}"> <input
				type="hidden" name="a_owner" value="${vo.a_owner}"> <input
				type="hidden" name="m_idx" value="${vo.m_idx}">
			<div id="test" style="display: inline;">
				<input type="button" value="글쓰기" class="button4"
					onclick="a_notice_form(this.form);">
			</div>
		</form>


		<!-- ===================카카오맵 API관련========================= -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57bd357082d358d251a6461a6aace40b&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			var address_input = "${vo.a_addr}";
			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							address_input,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.a_name}</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
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
