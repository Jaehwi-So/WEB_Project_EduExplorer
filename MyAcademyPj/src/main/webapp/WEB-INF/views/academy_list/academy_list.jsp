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
		<title>학원 목록</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<style>
			body{
				position:relative;
			}
			.box{
				position: relative;
				left: 80px;
				display : inline-block;
				width:220px;
				height:240px;
				border-style:solid;
				border-color:black;
				margin:10px;
				padding:10px;
				text-align: center;
				background-color: #FFF;
				box-shadow: 6px 6px 6px 6px #000;
				overflow:hidden;
				text-overflow:hidden;
				white-space:nowrap;
			}
			.filter_box{
				position: relative;
				float: left;
				margin:20px auto;
				margin-top: 20px;
				margin-left: 100px;
				top: 0px;
				width:500px; height:180px; border-style:solid;
				border-color:black;  padding:20px;
				background: radial-gradient(farthest-corner at 10%, #ffee0056, white);
			}
			.filter_box p{
				font-size: 25px;
				font-family: 'Do Hyeon', sans-serif;
			}
			.reg_box{
				float:right;
				position : relative;
				margin : 20px auto;
				margin-right:100px;
				margin-top:20px;
				width: 500px; height: 220px;
				border: 3px solid black;
				background: radial-gradient(farthest-corner at 10%, #ffee0056, white);
			}
			.list_box{
				position: relative;
				left:10px;
				top: 30px;
				width:1000px; height:900px; border-style:solid;
				border-color:#000; margin:20px auto; padding: 40px 70px;
				background: radial-gradient(farthest-corner at 10%, #ffee0023, white);
				float:left;
				margin-left:50px;
			}
			.button{
				background-color : #fffdab; 
				position: relative;
				border: 0;
				
			}
			.button_search{ 
				background-color : #fffdab; 
				position: relative;
				margin : auto;
				border: 0;
				cursor : pointer;
				
			}
			.button2{
				background-color : #fffdab;
				padding: 0px 180px;
				width: 140px; height: 140px;
				border: 0;
			}
			.reg_box p{
				padding: 20px;
				margin : auto;
				text-align : center;
				font-family: 'Do Hyeon', sans-serif;
				font-size: 25px;
			}
			.image_box{
				float: left;
				margin-top:10px;
				margin-left: 20px;

			}
			.select_box{
				float: right;
				margin-top:10px;
				margin-right: 20px;
			}
		
			.top_box{
				margin-top:-10px;
			}
			.reg_img{
				display : block;
				margin:auto;
				cursor : pointer;
			}
			main{
				height: 1500px;
			}
			
			
		</style>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
		<link href='https://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Do+Hyeon' rel='stylesheet' type='text/css'>
		<!-- 제이쿼리 등록 -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script type="text/javascript">
		
			//필터를 통한 검색 스크립트
			function filter_search(f){
				f.action = "a_listfilter.com"
				f.submit();
			}
			//맨 처음 실행되는 메서드. 시/도 리스트를 불러옴
			window.onload=function(){	
				sendRequest("a_city_search.com", null, resultFn_filter, "post");		
			};
			//시/도 리스트의 콜백메서드. 시/도 폼을 채워넣고 현재 파라미터값, 없다면 디폴트값으로 설정
 			function resultFn_filter(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
				    var data = xhr.responseText;
					var json = eval(data);
					var cf = document.getElementById("city_filter");
					$('#city_filter').empty();
					var option = document.createElement("option");
					option.innerHTML = "상관없음";
					option.value = "c_every";
					city_filter.appendChild(option);
					cf.value = "c_every";
					for(var i = 0; i < json.length; i++){
						var option = document.createElement("option");
						option.innerHTML = json[i].addr_city;
						option.value = json[i].addr_city;
						city_filter.appendChild(option);
						//$('city_filter').append(option);
					} 
					var p_f_city = "${param.f_city}";
					if(p_f_city != "" && p_f_city != null){
						cf.value = p_f_city;
					}
					var af = document.getElementById("area_filter");
					var a_filter = "${param.f_area}";
					if(a_filter != "" && a_filter != null){
						af.value = a_filter;
					}
					var kf = document.getElementById("keyword_filter");
					kf.value = "${param.f_keyword}";
					city_select();	//현재 시/도에 따른 구/군 선택 메서드 호출
				}
			} 
 			//구/군 리스트를 불러오는 메서드. 시/도 폼의 변화를 감지하거나 불러왔을 때 호출됨
 			function city_select(){
 				var cf = document.getElementById("city_filter").value;
 				var url = "a_region_search.com";
 				var param = "addr_city=" + cf;
 				sendRequest(url, param, resultFn_region, "post");
 			}
 			
 			//구/군 리스트의 콜백메서드. 구/군 폼을 채워넣고 현재 파라미터값, 없다면 디폴트값으로 설정
 			function resultFn_region(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
				    var data = xhr.responseText;
					var json = eval(data);
					var rf = document.getElementById("region_filter");
					$('#region_filter').empty();
					var option = document.createElement("option");
					option.innerHTML = "상관없음";
					option.value = "r_every";
					region_filter.appendChild(option);
					if(json == null){
						return;
					}
					for(var i = 0; i < json.length; i++){
						var option = document.createElement("option");
						option.innerHTML = json[i].addr_region;
						option.value = json[i].addr_region;
						region_filter.appendChild(option);
						//$('city_filter').append(option);
					} 
					var p_f_region = "${param.f_region}";
					if(p_f_region != "" && p_f_region != null){
						rf.value = p_f_region;
					}
					if(rf.value == null || rf.value == ""){
						rf.value = "r_every";
					}
					var af = document.getElementById("area_filter");
					var a_filter = "${param.f_area}";
					if(a_filter != "" && a_filter != null){
						af.value = a_filter;
					}
					if(rf.value == null || rf.value == ""){
						rf.value = "a_every";
					}
					var kf = document.getElementById("keyword_filter");
					kf.value = "${param.f_keyword}";
				}
			} 
			//상세 페이지 보기 메서드
			function send_detail_page(f){
				f.action = "a_list_detail.com";
				f.submit();
			}
			
			//학원 등록하기 메서드
			function reg_academy(){
				location.href="a_move_form.com";
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
		<br>
		<hr>
		<form>
			<div class="top_box">
			
			<div class="filter_box">
				<p align="center">검색하기</p>
				<div class="image_box">
				<label type="label" class="label">
				<img src="${pageContext.request.contextPath}/resources/img/magnifying_glass.png" width="100px" height="100px"></label>
				</div>
			
				<div class="select_box">
				<label>시/도 선택</label>
				<select name="f_city" id="city_filter" onchange = "city_select();"> <!-- onchange : select의 내용이 바뀌는 것을 감지 -->
				<option value="c_every">상관없음</option>
				</select><br>
				<label>구/군 선택</label>
				<select name="f_region" id="region_filter">
				<option value="r_every">상관없음</option>
				</select><br>
				<label>카테고리별 선택</label>
				<select name="f_area" id="area_filter" >
				<option value = "a_every">전체</option><!-- 초기상태 -->
				<!-- 나중에 값 바꿔야함 -->
				<option value="단과">단과 </option>
				<option value="종합">종합</option>
				<option value="입시">입시 </option>
				<option value="편입">편입 </option>	
				<option value="공무원">공무원 </option>	
				<option value="전문직">전문직 </option>	
				<option value="미술">미술 </option>	
				<option value="음악">음악</option>	
				<option value="체육">체육 </option>	
				<option value="영어">영어 </option>	
				<option value="제2외국어">제2외국어</option>	
				<option value="운전">운전</option>	
				<option value="기타 자격증">기타 자격증</option>	
				<option value="기타 입시">기타 입시</option>	
				<option value="기타 취업">기타 취업</option>	
				<option value="기타 예체능">기타 예체능</option>	
				<option value="기타 어학원">기타 어학원</option>	
				<option value="기타">기타</option>	
				</select><br>
				<label>키워드 검색</label>					
				<input value="" name="f_keyword" id="keyword_filter"><hr>	
				<%-- <img src="${pageContext.request.contextPath}/resources/img/search.png" width="30px" height="30px" onclick="filter_search(this.form);"/>	 --%>	
				<!-- input type="button" class="button" value="검색하기" onclick="filter_search(this.form);"> -->
				<button type="button" class="button_search" onclick="filter_search(this.form);">
				<img src="${pageContext.request.contextPath}/resources/img/search.png" width="40px" height="40px"></button>
				</div>
			</div>	
			
		
				
		
			<div class="reg_box">
				
				<p>등록하기</p>
				<img class="reg_img" src="${pageContext.request.contextPath}/resources/img/register_academy.png" width="200px" height="150px" onclick="reg_academy();" align="center">
					
			</div>
		</div>
		
		</form>	
		
		
		<div class="list_box">
				<c:forEach var="vo" items="${list}">
					<div class="box">
					<form method="get" >
						<input type="hidden" name="a_idx" value="${vo.a_idx}">
						<input type="hidden" name="page" value="${ empty param.page ? 1 : param.page}">
						<span style="font-weight:bold; font-size:18px;">${vo.a_name}<br></span>
						<div style="color:blue; font-size:12px;">${vo.a_area}<br></div>
						<div style="color:gray; font-size:15px; font-weight:bold;">${vo.a_keyword}<br></div>
						<div style="color:black; font-size:12px;">${vo.a_addr}<br></div>
						<img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}" width="140" height="130" /><br>
						<button type="button" class="button" onclick="send_detail_page(this.form);">
						<img src="${pageContext.request.contextPath}/resources/img/detail.png" width="30px" height="30px" style="cursor:pointer;"></button>
					</form>
					</div>					
				</c:forEach><br>
				<div style="position:absolute; left : 500px; bottom : 20px;">${pageMenu}</div>
		</div>
		<c:forEach var="vo" items="${addr_list}">
			${vo.addr_city}
		</c:forEach>
	
	</main>
		<%@ include file="../recommend/recommend.jsp" %>
		<%@ include file="../head/footer.jsp" %>
	</body>
</html>