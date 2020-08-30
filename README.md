# SpringSchool
## 학원을 등록하고 검색하며 커뮤니티 기능을 수행할 수 있는 웹 사이트
## JAVA 기반 웹 어플리케이션
--------------------
- [1. 버전 관리 및 분업](#1-버전-관리-및-분업)
	* [1-1. Version 1.x](#1-1-version-1x)
	* [1-2. Version 2.x](#1-2-version-2x)
- [2. 사용 언어 및 기술, 프로그램 버전](#2-사용-언어-및-기술-프로그램-버전)
	* [2-1. 실행 방법](#2-1-실행-방법)
- [3. 웹 어플리케이션 소개 및 기능](#3-웹-어플리케이션-소개-및-기능)
	* [3-1. 프로젝트 목표](#3-1-프로젝트-목표)
	* [3-2. 프로젝트 구성](#3-2-프로젝트-구성)
	* [3-3. 기능 아키텍처](#3-3-기능-아키텍처)
	* [3-4. 제공하는 기능 목록 및 이용 사례](#3-4-제공하는-기능-목폭-및-이용-사례)
		+ [3-4-1. 회원 관련 서비스](#3-4-1-회원-관련-서비스)
		+ [3-4-2. 게시판 관련 서비스](#3-4-2-게시판-관련-서비스)
		+ [3-4-3. 학원 관련 서비스](#3-4-3-학원-관련-서비스)
		+ [3-4-4. 마이페이지 서비스](#3-4-4-마이페이지-서비스)
		+ [3-4-5. 학원 추천 서비스](#3-4-5-학원-추천-서비스)
- [4. 개인적 평가 및 보완점](#4-개인적-평가-및-보완점)
	+ [4-1. 기능 및 서비스적 측면](#4-1-기능-및-서비스적-측면)
	+ [4-2. 기술 및 업무적 측면](#4-2-기술-및-업무적-측면)
	+ [4-3. 앞으로의 목표](#4-3-앞으로의-목표)

--------------------
# 1. 버전 관리 및 분업
# 1-1. Version 1.x
## 진행 기간 : 2020/06/22 ~ 2020/07/10
## 팀원 : 소재휘, 김준호, 서지수, 박소윤, 이지환, 길태윤 
- 소재휘 
	* 프로젝트 전체 관리, 합병, 수정 / 학원 찾기, 검색, 1:1 문의, 내부 게시판 서비스 구현 / 마이페이지 서비스 구현, 알림 로그 구현, 마이페이지 프론트 엔드
- 김준호 
	* 로그인, 회원 가입, 고객 서비스, 즐겨찾기, 좋아요 기능 구현, 학원 추천 서비스 구현, 
	회원 관련 프론트 엔드
- 이지환
	* 필터/해시 태그 기능/ 1:1문의, 내부 게시판 서비스 구현, 학원 찾기 프론트 엔드 보조 
- 박소윤
	* 게시판 프로토타입 구현 / 게시판, 학원 목록 프론트 엔드 
- 서지수
	* 게시판 프로토타입 구현 / 학원 상세보기 페이지 CSS
- 길태윤
	* 메인 화면 

### 프로젝트 규칙
1. 협업과 형상 관리는 Slack과 Git을 이용한다.
2. 자신이 맡은 서비스는 테스트와 예외처리를 반드시 거친 후 합병 요청한다.
3. 하루 프로젝트 일과 후 자신이 하루동안 만든 부분과 진행상황을 알린다.
4. 전체적 진행상황에 따라 일정은 유동적으로 변경될 수 있다.

### 프로젝트 진행 
* 설계 
	- 2020/06/22~ 시스템 설계, 분업, 협업 도구, 데이터베이스 스키마 논의
* 합병
	- 2020/06/22~2020/07/10 : 기능 완성 시 다음 작업으로 넘어갈 단계에 합병(소재휘, 김준호)
* 게시판
	- 2020/06/23~2020/07/02 : 리스트 출력, 상세보기, 수정, 삭제, 댓글, 답글 기능, 프론트엔드(서지수, 박소윤)
	- 2020/07/03~2020/07/04 : 상세보기 디자인 변경, 수정, 답글 오류 수정(소재휘)
	- 2020/07/04~2020/07/05 : 검색 기능 추가, 페이징 오류 수정(김준호, 소재휘)
* 학원 찾기
	- 학원 등록, 학원 목록
		+ 2020/06/23~2020/06/25 : 학원 등록, 학원 목록 보기 기능(소재휘)
		+ 2020/06/23~2020/06/24 : 학원 목록 프론트엔드 디자인(이지환)
		+ 2020/07/03~2020/07/05 : 학원 등록 프론트엔트, CSS 디자인(서지수)
		+ 2020/07/03~2020/07/07 : 학원 목록 프론트엔트, CSS 디자인(박소윤)
		+ 2020/07/04 : 학원 등록 시 지역, 카테고리, 해시태그 입력 추가(이지환)
	- 학원 상세보기 페이지
		+ 2020/06/27~2020/06/30 : 상세보기 페이지 설계(이지환)
		+ 2020/06/28~2020/06/31 : 좋아요 기능 추가(김준호)
		+ 2020/07/02~2020/07/04 : 즐겨찾기 기능 추가(김준호)
		+ 2020/07/06~2020/07/08 : 학원 상세보기 프론트엔트, CSS 디자인(서지수)
	- 학원 내부 소식 게시판
		+ 2020/06/24~2020/06/26 : 내부 소식 게시판 서비스 구현(이지환)
		+ 2020/07/01 : 내부 소식 게시판 페이징 처리, 오류 수정(소재휘)
		+ 2020/07/08 : 내부 소식 게시판 프론트엔트, CSS 디자인(이지환)
	- 학원 1:1문의
		+ 2020/06/26~2020/06/28 : 1:1 문의 서비스 구현(이지환, 소재휘)
		+ 2020/07/08 : 1:1 문의 서비스 에러 수정, 알림 구현(소재휘)
		+ 2020/07/08 : 내부 소식 게시판 프론트엔트, CSS 디자인(이지환, 소재휘)
	- 학원 검색
		+ 2020/06/29 : 지역별 검색 구현(소재휘)
		+ 2020/07/01~2020/07/02 : 카테고리, 해시태그를 통한 검색 구현(이지환, 소재휘)
		+ 2020/07/08 : 페이징 처리 오류 수정(소재휘)
		+ 2020/07/08 : 학원 검색 프론트엔트, CSS 디자인(박소윤)
* 회원
	- 회원 가입
		+ 2020/06/23~2020/06/24 : 회원 가입 구현(김준호)
		+ 2020/06/26 : 유효성 체크 추가(김준호)
		+ 2020/06/28 : 테이블 구조 변경에 따른 입력 추가(김준호)
	- 로그인, 로그아웃
		+ 2020/06/24~2020/06/25 : 로그인, 로그아웃 구현(김준호)
	- 회원 정보 수정, 탈퇴
		+ 2020/06/25~2020/06/26 : 회원 정보 수정, 탈퇴 기능 구현(김준호)
	- 프론트엔드 디자인
		+ 2020/06/23~2020/06/27 : 디자인(김준호)
* 추천
	- 2020/07/05~2020/07/08 : 페이지 전환 시 추천 목록 구현(김준호)
* 마이페이지
	- 2020/07/05~2020/07/06 : 마이페이지 프론트엔드 디자인, 즐겨찾기 연동(소재휘, 김준호)
	- 2020/07/05~2020/07/06 : 특정 이벤트에 알림 데이터베이스 조작 구현(소재휘)
	- 2020/07/07 : 내가 등록한 학원 목록, 게시물 목록 구현(이지환)
	- 2020/07/08 : 1:1문의 알림 구현, 댓글 알림 구현(소재휘)
* 메인 화면
	- 2020/06/22~2020/07/09 : 메인 화면 네비게이션 바 구현, 이미지 삽입, 메인화면 구성(길태윤)
---------------------
# 1-2. Version 2.x
## 진행 기간 : 2020/08/22 ~ 2020/08/30
## 팀원 : 소재휘, 김준호
### 프로젝트 보완, 보수
- Version 1.0을 완성하였으나 프로젝트의 미흡함을 인지하여 8월 22일부터 8월 30일동안 2차 프로젝트를 진행하였다.
- 페이징 처리의 오류, 특정 파라미터를 요청했을 시 URL 매핑의 오류 등 기능적인 오류가 발생하여 이를 보완할 필요성이 있다.
- 특수한 경우의 예외 처리와 웹 API의 기능 추가가 필요하였다.
- 분업 과정에서 통일되지 않고 문법에 맞지 않는 코드, 혹은 필요 없는 코드를 유지보수를 위해 깔끔한 구성으로 바꿀 필요성이 있었다.
- 더욱 꼼꼼하고 보기 좋은 유저 인터페이스를 제공할 필요가 있다고 판단하여 전체적인 UI와 디자인을 추가 혹은 재구성하였다.

### 프로젝트 진행 
- 08/22 : 로그아웃 세션 에러 수정, AOP 추가를 통해 단위 테스트
- 08/23 : 자유게시판 수정, 답글, 댓글 기능 오류수정, 혹은 재구성
- 08/24 : URL 간 유기성 재검토, 특수 상황 테스트, URL 오류 수정 
- 08/25 : 회원가입, 게시물 등록 시 데이터 유효성 체크 정밀화
- 08/26 : 알아볼 수 없는 형태의 HTML 문서구조 가독성 있게 최대한 변경
- 08/27~08/28 : 웹 전반적 디자인 재구성(게시판, 학원 목록, 학원 상세보기)
- 08/29 : URL 간 유기성 재검토, 특수 상황 테스트, 오류 수정
- 08/30 : 오류 테스트, 버전 업데이트 완료

---------------------------

# 2. 사용 언어 및 기술, 프로그램 버전
## JAVA 기반의 웹 어플리케이션
- ### jdk 1.8.0_251, eclipse IDE, Visual Studio Code
## 서버
- ### Apache Tomcat 8.5
## 언어
- ### JAVA, JSP, HTML/CSS, JavaScript
## 데이터베이스
- ### Oracle Database 11g
## 프레임워크
- ### Spring 3.1.1 
## 라이브러리
- ### JQuery, AspectJ, Jackson, JDBC/DBCP
## 협업 도구
- ### Slack, Git
## 오픈 API
- ### 카카오맵 API, 다음 우편번호 서비스 API

## 2-1. 실행 방법
1. MyAcademyPj 프로젝트를 import한다.
2. 데이터베이스에 스키마를 참고하여 테이블과 시퀀스, view를 생성한다.
3. db.properties의 데이터베이스 정보를 변경한다.
4. academy_detail.jsp에 카카오 API key를 발급받아 입력하여 사용
--------------------------

# 3. 웹 어플리케이션 소개 및 기능
- [3-1. 프로젝트 목표](#3-1-프로젝트-목표)
- [3-2. 프로젝트 구성](#3-2-프로젝트-구성)
- [3-3. 기능 아키텍처](#3-3-기능-아키텍처)
- [3-4. 제공하는 기능 목록 및 이용 사례](#3-4-제공하는-기능-목폭-및-이용-사례)
	+ [3-4-1. 회원 관련 서비스](#3-4-1-회원-관련-서비스)
	+ [3-4-2. 게시판 관련 서비스](#3-4-2-게시판-관련-서비스)
	+ [3-4-3. 학원 관련 서비스](#3-4-3-학원-관련-서비스)
	+ [3-4-4. 마이페이지 서비스](#3-4-4-마이페이지-서비스)
	+ [3-4-5. 학원 추천 서비스](#3-4-5-학원-추천-서비스)
------------------------------------------

## 3-1. 프로젝트 목표
인터넷이 활성화된 21세기에서 이제 사업주들의 홍보의 주된 수단은 웹이라고 봐도 무방하다.  
의류들은 쇼핑몰을 통해서, 아르바이트나 일자리도 웹사이트를 통해 구인하고 구직하며 음식점 또한 배달 어플리케이션 등으로 홍보되고 있다.   
그렇다면 학원 또한 인터넷에 검색하는 것, 혹은 직접 학원에 방문하며 찾아다니는 수고를 덜고 학원측이 홍보할 수 있고, 학생들이 학원을 검색할 수 있는 웹사이트를 개발하고자 프로젝트가 시작되었다.

### 프로젝트 목표
- 학원 검색과 홍보, 커뮤니티 기능을 가진 웹 애플리케이션 개발
- 공부를 하고자 학원을 찾는 학생들의 학원 검색
- 점주들의 학원 홍보와 소식 게시물, 1:1 문의를 통한 소통
- 클라이언트들 간에 게시물을 올리고 댓글과 답글을 통한 커뮤니티 기능
- 클라이언트들의 이용 편의를 위한 알림, 바로가기, 회원관리 등의 기능 
-----------------

## 3-2. 프로젝트 구성
<img src="/img_readme/pj1.png" width="760" height="400"></img>
<img src="/img_readme/pj2.png" width="760" height="400"></img>

### 데이터베이스
- 회원 테이블
- 게시판 테이블
- 댓글 테이블
- 알림 로그 테이블
- 학원 목록 테이블
- 학원 내부 게시판 테이블
- 1:1 문의 게시판 테이블
- 즐겨찾기, 좋아요 테이블

-----------------
## 3-3. 기능 아키텍쳐
<img src="/img_readme/arc.png" width="760" height="400"></img>

-----------------

# 3-4. 제공하는 기능 목록 및 이용 사례

# 3-4-1. 회원 관련 서비스
<img src="/img_readme/ex1.png" width="760" height="400"></img>
<img src="/img_readme/ex2.png" width="760" height="400"></img>
<img src="/img_readme/ex3.png" width="760" height="400"></img>
<img src="/img_readme/ex4.png" width="760" height="400"></img>

# 3-4-2. 게시판 관련 서비스
<img src="/img_readme/ex5.png" width="760" height="400"></img>
<img src="/img_readme/ex6.png" width="760" height="400"></img>
<img src="/img_readme/ex7.png" width="760" height="400"></img>
<img src="/img_readme/ex8.png" width="760" height="400"></img>
<img src="/img_readme/ex9.png" width="760" height="400"></img>
<img src="/img_readme/ex10.png" width="760" height="400"></img>

# 3-4-3. 학원 관련 서비스
<img src="/img_readme/ex11.png" width="760" height="400"></img>
<img src="/img_readme/ex12.png" width="760" height="400"></img>
<img src="/img_readme/ex13.png" width="760" height="400"></img>
<img src="/img_readme/ex14.png" width="760" height="400"></img>
<img src="/img_readme/ex15.png" width="760" height="400"></img>
<img src="/img_readme/ex16.png" width="760" height="400"></img>
<img src="/img_readme/ex17.png" width="760" height="400"></img>
<img src="/img_readme/ex18.png" width="760" height="400"></img>
<img src="/img_readme/ex19.png" width="760" height="400"></img>
<img src="/img_readme/ex20.png" width="760" height="400"></img>
<img src="/img_readme/ex21.png" width="760" height="400"></img>

# 3-4-4. 마이페이지 서비스
<img src="/img_readme/ex22.png" width="760" height="400"></img>
<img src="/img_readme/ex23.png" width="760" height="400"></img>
<img src="/img_readme/ex24.png" width="760" height="400"></img>
<img src="/img_readme/ex25.png" width="760" height="400"></img>

# 3-4-5. 학원 추천 서비스
<img src="/img_readme/ex26.png" width="760" height="400"></img>
<img src="/img_readme/ex27.png" width="760" height="400"></img>

------------------------------------------

# 4. 개인적 평가 및 보완점
-----------------
## 4-1. 기능 및 서비스적 측면
--------------
- 학원과 학생들간의 소통이 가능한 커뮤니티를 구현하여 프로젝트 목표에 부합하는 웹 어플리케이션을 제작하였다.
- 학원 측은 학원 등록, 소식 게시판, 1:1문의 등의 서비스를 통해 학생들에게 학원을 홍보하고 마케팅하려는 수단으로 웹을 이용할 가치가 있다고 본다. 
- 학생 측 또한 등록된 학원을 살펴보며 검색 기능을 통해 조건에 부합하는 학원을 찾을 수 있으며 1:1 문의나 게시판을 살펴보며 원하는 학원을 찾을 수 있어 사용자 요구를 만족시켰을 것이라고 본다.
- 자유게시판과 댓글, 답글 서비스를 통한 커뮤니티 기능과 사용자 편의를 만족시키는 알림이나 기타 유저 인터페이스를 제공하여 웹 서비스 이용이 더욱 흥미롭고 간편해 졌을 것이라고 본다.   
--------------------
- 관리자 계정에게 게시물 삭제, 학원 삭제 외에 다양한 서비스를 제공하지 못한 것이 아쉽다. 회원을 관리할 수 있는 플랫폼을 제공하면 좋을 것 같다.
- 검색 기능 외에 학원 측에 별점 평가 및 좋아요 순으로 정렬 기능을 고민했으나 별점이나 좋아요의 조작이나 소위 말하는 갑질을 고려하여 도입하지 못했다. 만약 도입한다면 별도의 자격을 갖춘 사람에게만 별점을 매길 수 있도록 하는 시스템을 구현하면 어떨까.
-----------------
## 4-2. 기술 및 업무적 측면
-------------------
- 매일 자신이 맡은 업무의 진척도를 기록하고 Slack을 통해 형상 관리를 하여 프로젝트 병합이 상대적으로 쉬웠다.
- 유지보수 과정에서 인터페이스 활용을 도입하여 남이 작업한 내용을 알아보기 쉬워져 협업에 유용하였다.
- 기본적으로 분업하여 작업했지만 검색을 통해 해결이 불가능하다면 물어보고 서로 아는 지식을 활발히 공유하였다.
- 프로젝트 이후의 유지보수를 통해 프로젝트의 더욱 편리한 UI를 제공하려 했으며 오류사항과 알고리즘 효율성 등을 보완하였다.      
--------------
- 프로젝트 계층을 더 작은 단위로 나누었으면 좋았을 것 같다. 처음에는 간단한 데이터 교환을 예측해 Controller 계층과 Dao 계층만을 나누었는데 하다보니 복잡한 알고리즘이 필요하여 중간에 Service 계층이 있었다면 유지보수가 원활했을 것이다.
- 협업 시 팀장으로서 업무의 분업과 프로젝트 병합을 담당하여 팀원들과 의사소통을 많이 하려고 노력하였지만 아쉬운 점이 남는다. 업무를 맡길 때 더 많은 소통을 통해 팀원들이 자신있는 부분이나 개인의 능력을 파악한 후 분업했으면 능률이 더욱 증가했을 것이다.
- 합병 시 나 자신을 포함한 서로의 코드 스타일이 달라 어려움을 겪었다. 나 혼자 만드는 것이 아닌 여러명이 함께 만드는 작품이므로 스파게티 코드나 유지보수가 어려운 코드는 반드시 지양하고 줄바꿈과 주석을 통한 가독성 있는 코드의 중요성을 다시 한번 깨달았다.
-----------------
## 4-3. 앞으로의 목표
-------------------
- 이번 프로젝트는 프레임워크에서 xml기반에 필요 시 어노테이션의 사용을 통해 컨테이너를 구성하였는데 다음에는 자바 Configure 기반과 어노테이션 기반의 웹 어플리케이션, 혹은 RESTful한 API 구현을 목표로 프로젝트를 진행해 보고 싶다.
- 2.0 버전으로 코드들을 가독성 좋은 형태로 수정하고 발견한 오류들을 모두 수정했지만 여전히 가독성 없고 비효율적인 코드들, 그리고 발견하지 못한 에러들이 남아있을 것이다. 추후 지속적인 유지보수를 하는 것이 개발자의 임무라고 생각한다.






