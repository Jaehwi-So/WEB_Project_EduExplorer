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
		<style>
			body{
				position:relative;
			}
			.box{
				display : inline-block;
				width:220px;
				height:220px;
				border-style:solid;
				border-color:black;
				margin:10px;
				padding:10px;
				text-align: center;
			}
			.filter_box{
				left:10px;
				width:950px; height:150px; border-style:solid;
				border-color:black; margin:20px auto; padding:20px;
			}
			.list_box{
				left:10px;
				width:830px; height:850px; border-style:solid;
				border-color:black; margin:20px auto; padding: 40px 70px;
			}
		</style>
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
		<div class="filter_box">
		<h3 align="center">검색하기</h1>
		<form>
			<label>시/도 선택</label>
			<select name="f_city" id="city_filter" onchange = "city_select();"> <!-- onchange : select의 내용이 바뀌는 것을 감지 -->
				<option value="c_every">상관없음</option>
			</select><br>
			<label>구/군 선택</label>
			<select name="f_region" id="region_filter">
				<option value="r_every">상관없음</option>
			</select><br>
			<select name="f_area" id="area_filter" >
				<option value = "a_every">분야별 </option><!-- 초기상태 -->
				<!-- 나중에 값 바꿔야함 -->
				<option value="초등부">초등부 </option>
				<option value="중등부">중등부 </option>
				<option value="고등부">고등부 </option>
				<option value="예체능">예체능 </option>	
			</select>					
			<input type="button" value="검색하기" onclick="filter_search(this.form);">
		</form>
		
		
		</div>
		<input type="button" value="등록하기" onclick="reg_academy();">
		<div class="list_box">
				<c:forEach var="vo" items="${list}">
					<div class="box">
					<form method="get" >
						<input type="hidden" name="a_idx" value="${vo.a_idx}">
						${vo.a_name}<br>
						<div style="color:blue; font-size:10px;">${vo.a_regdate}<br></div>
						<div style="color:gray; font-size:12px;">${vo.a_addr}<br></div>
						<img src="${pageContext.request.contextPath }/resources/upload/${vo.a_image_s}" width="140" height="130" /><br>
						<input type="button" value="상세보기" onclick="send_detail_page(this.form);">
					</form>
					</div>					
				</c:forEach><br>
				<div style="position:absolute; left : 420px; bottom : 20px;">${pageMenu}</div>
		</div>
		<c:forEach var="vo" items="${addr_list}">
			${vo.addr_city}
		</c:forEach>
	</body>
</html>