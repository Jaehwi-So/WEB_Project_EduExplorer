<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet"> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 학원 : SpringSchool</title>
   
<style type="text/css">
	
	@font-face {
	   font-family: 'TmoneyRoundWindExtraBold';
	   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
	   font-weight: normal;
	   font-style: normal;
	}
	
	@font-face {
	   font-family: 'BBTreeCB';
	   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeCB.woff') format('woff');
	   font-weight: normal;
	   font-style: normal;
	}
	
	
	*{margin: 0px; padding: 0px;}
	ul{list-style: none;} /* 리스트 앞에 . 같은거 제거*/
	a{text-decoration: none;} /* 링크에 밑줄 같은거 제거*/
	 
	header{
	    width: 1320px; /*메인 이미지의 너비 사이즈와 같음*/
	    height: 200px;
	    background-color: black;
	 
	    /* header 안에 요소들을 모두 absolute 포지션으로 배치할 것이라서 */
	    /* absolute 요소가 header의 좌상단을 기준으로 하려면 */
	    /* header의 position이 relative 여야만 함 */
	    position: relative;
	    margin: 0px auto;
	}
	 
	/* 제목영역안에 있는 메인 로고 이미지 위치 지정 */
	#header_logo{
	    position: absolute;
	    width: 400px;
	    top: 5px;
	    left: 70px;
	    cursor: pointer;
	}
	 
	/* 제목영역안에 오른쪽 상단에 top_menu 배치 */
	#header_top_menu{
	    position: absolute;
	    top: 20px;
	    right: 10px;
	    font-family: 'TmoneyRoundWindExtraBold', serif;
	    cursor: pointer;
	}
	 
	/* top_menu a의 글시 하얀색으로 */
	#header_top_menu a{ 
	   color: white;
	   float: left; 
	   border-right: 5px solid gray;
	   padding-left: 15px;
	   padding-right: 15px;
	   text-align: left;
	}
	
	#header_top_left { border-left: 5px solid gray; }
	
	#title {
	   position: absolute;
	   left: 250px;
	   top: 1px;
	   width: 700px;
	   height: 500px; 
	   font-size: 90px;
	   color: white;
	   margin-top:5px;
	   /* font-family: 'BBTreeCB', serif; */
	   font-family: 'TmoneyRoundWindExtraBold', serif; 
	   font-weight:bold;
	   cursor : pointer;
	}
	/* #top_menu a:hover { border-left: 5px solid gray; } */
	 
	/* 헤더 영역안에 네비게이션 메뉴 배치 */
	#header_navi{
	    position: relative;
	    width: 1320px;
	    height: 80px;
	   top: 120px;   
	   cursor: pointer;
	}
	 
	#header_navi li{
	    display: inline;
	    width: 250px;
	}
	 
	#header_navi li a{ 
	   margin-top : 30px;
	   color: black;
	   width: 24.52%;
	   height: 100%;
	   float: left;
	   border-right: 5px solid gray;
	   border-bottom: 5px solid gray;
	   /* padding-top: 10px; */
	   text-align: center;
	   background: white;
	   font-size: 40px;
	   font-family: 'TmoneyRoundWindExtraBold', serif;
	}
	
	#header_left { border-left: 5px solid gray; }
	
	#header_side {
	   position: fixed;
	   left: 1650px;
	   top: 200px;
	    width: 200px;
	   height: 400px; 
	   border: 2px solid black;
	   background: black;
	   cursor: pointer;
	   
	   /* transform:translate(0,0);
	    transition:transform 300ms cubic-bezier(0.4, 0, 0.2, 1); */
	}
	
	#header_side li{
	   
	   width: 100%;
	   height: 25%;
	   padding-top: 33.5px;
	   padding-bottom: 33.5px;
	   display: block;
	   
	}
	
	#header_side li a {
	   color: #e5d700;
	   text-align: center;
	   font-size: 25px;
	   font-family: 'TmoneyRoundWindExtraBold', serif;
	   
	}
	
	#header_quickmenu { text-align: center; border-bottom: 1px solid white; }
	
	#mid_quickmenu { border-bottom: 1px solid white; }
	
	#header_img { 
	   /* margin-top: 10px; */
	   margin-left: 7px;
	   margin-right: 7px;}

</style>

<script type="text/javascript">
   function send_find() {
      location.href="a_list.do";
   }
   function send_service(){
      location.href="member_service.do";
      
   }
   function log_in() {
      location.href="login_form.do";
   }
   function log_out() {
      if(!confirm("로그아웃 하시겠습니까?")){
         return;   
      }
      if("${sessionScope.user}" == null){
    	  location.href="main.do";
      }
      else{
	      alert("로그아웃되었습니다 메인페이지로 이동합니다.")
	      location.href="logout.do";
      }
   }
   function send_notice(){
      location.href = "n_list.do";
   }
   
   function send_board(){
      location.href = "f_list.do";
   }
   
</script>

</head>
<body>
   <div id="page">
      
      <header>
         <div id="header_logo">
         <ul>
            <li><a onclick="location.href='main.do'">    
            	<figure> 
	        		<img src="${pageContext.request.contextPath}/resources/img/rainbow.png" width="160px" height="130px"  alt="logo">
	        		<figurecaption>https://kr.lovepik.com/images/2330858.html</figurecaption>
        	 	</figure>
    		 </a></li>
         </ul>   
         </div>
         
         <div id="header_top_menu">
         	<c:choose>
				<c:when test="${!empty sessionScope.user}">
					<a id="header_top_left">${user.m_name}님 환영합니다</a>
		            <a onclick="location.href='log_view.do?m_idx=${sessionScope.user.m_idx}'">MyPage</a>
		            <a onclick="log_out()">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="#" onclick="window.open('reg_form.do', '_blank', 'width=700 height=500')">회원가입</a>
	                <a onclick="log_in()">로그인</a>
				</c:otherwise>
			</c:choose>
         </div>
         
         <div id="title">
            <ul>
               <li>
                  <a onclick="location.href='main.do'">SpringSchool</a>
               </li>
            </ul>
         </div>
         
         <div id="header_navi">
            <ul>
               <li><a id="header_left" onclick="send_notice();"><img src="${pageContext.request.contextPath}/resources/img/header_notice.png" width="40px" height="40px">공지사항</a></li>
               <li><a onclick="send_find();"><img src="${pageContext.request.contextPath}/resources/img/mypage_academy.png" width="40px" height="40px">학원찾기</a></li>
               <li><a onclick="send_board();"><img src="${pageContext.request.contextPath}/resources/img/header_noticeboard.png" width="40px" height="40px">자유게시판</a></li>
               <li><a onclick="send_service();"><img src="${pageContext.request.contextPath}/resources/img/header_service.png" width="40px" height="40px">고객지원</a></li>
            </ul>
         </div>
      </header>
      
   </div> 
</body> 
</html>