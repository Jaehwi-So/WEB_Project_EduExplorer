<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우편번호 검색</title>
		<style>
			.search_box{
			height:200px; overflow:auto;	
			}
		</style>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script>
		$(function() { $("#postcodify").postcodify({
		        insertPostcode5 : "#postcode",
		        insertAddress : "#address",
		        insertDetails : "#details",
		        hideOldAddresses : false}); });
		
		function send(f){
			opener.document.getElementById("a_addr").value = document.getElementById("address").value;
			opener.document.getElementById("a_post").value = document.getElementById("postcode").value;
			opener.document.getElementById("a_addr_detail").value = document.getElementById("details").value;
			window.close();
		}
		</script>
	</head>
	<body>
		<div align="center">
			<p>검색 요령</p>
		    <ul>
		        <li>도로명주소 검색 : 도로명과 건물번호를 입력하세요. &nbsp; 예: <span>세종대로 110</span></li>
		        <li>지번주소 검색 : "동" 또는 "리" 이름과 번지수를 입력하세요. &nbsp; 예: <span>연산동 1000</span></li>
		        <li>건물명 검색 : 빌딩 또는 아파트 이름을 입력하세요. &nbsp; 예: <span>방배동 래미안</span>, <span>수곡동 주공3차</span></li>
		        <li>사서함 검색 : 사서함 이름과 번호를 입력하세요. &nbsp; 예: <span>광화문우체국사서함 123-4</span></li>
		    </ul>
		    <form>
			    <table border="1" style="width:500px; margin:15px; text-align:center" >
			    	<tr>
				    	<td>검색하기</td>
				    	<td><div id="postcodify" class="search_box"></div></td>
			    	</tr>
			    	<tr>
			    		<td>우편번호</td>
			    		<td><input type="text" name="" name="post" id="postcode" style="width:300px;" value="" readonly/></td>
			    	</tr>
			    	<tr>
			    		<td>주소</td>
			    		<td><input type="text" name="" name="addr" id="address" style="width:300px;" value="" readonly/></td>
			    	</tr>
			    	<tr>
			    		<td>세부주소</td>
			    		<td><input type="text" name="" name="d_addr" id="details" style="width:300px;" value="" /></td>
			    	</tr>
			    </table>
			    <input type="button" value="완료" onclick="send(this.form);">
		    </form>
		    <ul>
		        <li>시·군·구·읍·면 등은 쓰지 않아도 되지만, 만약 쓰실 경우 반드시 띄어쓰기를 해 주세요.</li>
		        <li>도로명에 "××번길" 등이 포함되어 있는 경우에도 잊지 말고 써 주세요.</li>
		        <li>건물명보다는 도로명주소 또는 지번 주소로 검색하시는 것이 빠르고 정확합니다.</li>
		    </ul>		
	    </div>
	</body>
</html>