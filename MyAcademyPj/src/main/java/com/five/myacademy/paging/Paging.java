package com.five.myacademy.paging;

import com.five.myacademy.vo.FilterVO;
/*
        nowPage:현재페이지
        rowTotal:전체데이터갯수
        blockList:한페이지당 게시물수
        blockPage:한화면에 나타낼 페이지 메뉴 수
 */
public class Paging {
	
	//#### 필터링을 통한 학원 목록 조회 시 페이징 처리 ####
	public static String getPaging_filter(String pageURL,int nowPage, int rowTotal, int blockList, int blockPage, FilterVO vo){
		int totalPage/*전체페이지수*/,
		startPage/*시작페이지번호*/,
		endPage;/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; 

		isPrevPage=isNextPage=false;
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;

		if(nowPage > totalPage)nowPage = totalPage;

		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;

		if(endPage < totalPage) isNextPage = true;

		sb = new StringBuffer();
		//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			//sb.append(nowPage - blockPage);
			sb.append( startPage-1 );
			sb.append("&f_city="+vo.getF_city()+"&f_region=");//!!
			sb.append(vo.getF_region());
			sb.append("&f_area=" + vo.getF_area());
			sb.append("&f_keyword=" + vo.getF_keyword());
			sb.append("'>prev</a>");
		}
		else
			sb.append("prev");
		//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#f00'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("&f_city="+vo.getF_city()+"&f_region=");//!!
				sb.append(vo.getF_region());
				sb.append("&f_area=" + vo.getF_area() );
				sb.append("&f_keyword=" + vo.getF_keyword());
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}

		sb.append("&nbsp;");

		//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");

			sb.append(endPage + 1);
			sb.append("&f_city="+vo.getF_city()+"&f_region=");//!!
			sb.append(vo.getF_region());
			sb.append("&f_area=" + vo.getF_area() );
			sb.append("&f_keyword=" + vo.getF_keyword());
			sb.append("'>next</a>");
		}
		else
			sb.append("next");
		//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}

	//#### 학원 목록 전체조회 페이징 처리 ####
	public static String getPaging_myFboard(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage, int m_idx){

		int totalPage/*전체페이지수*/,
		startPage/*시작페이지번호*/,
		endPage;/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳


		isPrevPage=isNextPage=false;
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;

		if(nowPage > totalPage)nowPage = totalPage;

		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;

		if(endPage < totalPage) isNextPage = true;
		if(startPage > 1)isPrevPage = true;

		sb = new StringBuffer();
		//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append( startPage-1 );
			sb.append("&m_idx=" + m_idx);
			sb.append("'>prev</a>");
		}
		else
			sb.append("prev");

		//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#f00'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("&m_idx=" + m_idx);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		sb.append("&nbsp;");

		//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");

			sb.append(endPage + 1);
			sb.append("&m_idx=" + m_idx);
			sb.append("'>next</a>");
		}
		else
			sb.append("next");
		//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
	
	//#### 게시판 페이징 처리 ####
	public static String getPaging(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){

		int totalPage/*전체페이지수*/,
		startPage/*시작페이지번호*/,
		endPage;/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳


		isPrevPage=isNextPage=false;
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;


		if(nowPage > totalPage)nowPage = totalPage;

		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;

		if(endPage < totalPage) isNextPage = true;
		if(startPage > 1)isPrevPage = true;

		sb = new StringBuffer();
		//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append( startPage-1 );
			sb.append("'>prev</a>");
		}
		else
			sb.append("prev");
		//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#f00'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}

		sb.append("&nbsp;");

		//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage + 1);
			sb.append("'>next</a>");
		}
		else
			sb.append("next");
		//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
	
	//#### 학원 내부 게시판 페이징처리  ####
	public static String getPaging_Ainner(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){

		int totalPage/*전체페이지수*/,
		startPage/*시작페이지번호*/,
		endPage;/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳


		isPrevPage=isNextPage=false;
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;


		if(nowPage > totalPage)nowPage = totalPage;

		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;

		if(endPage < totalPage) isNextPage = true;
		if(startPage > 1)isPrevPage = true;

		sb = new StringBuffer();
		//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"&page=");
			sb.append( startPage-1 );
			sb.append("'>prev</a>");
		}
		else
			sb.append("prev");
		//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#f00'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"&page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}

		sb.append("&nbsp;");

		//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"&page=");
			sb.append(endPage + 1);
			sb.append("'>next</a>");
		}
		else
			sb.append("next");
		//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}

	//#### 자유게시판 키워드 검색 페이징 ####
	public static String getPaging_fBoard_keyword(String pageURL,int nowPage, int rowTotal, int blockList, int blockPage, String keyword){

		int totalPage/*전체페이지수*/,
		startPage/*시작페이지번호*/,
		endPage;/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳


		isPrevPage=isNextPage=false;
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;

		if(nowPage > totalPage)nowPage = totalPage;

		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;
		if(endPage < totalPage) isNextPage = true;
		if(startPage > 1)isPrevPage = true;

		sb = new StringBuffer();
		//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append( startPage-1 );
			sb.append("&keyword=" + keyword);
			sb.append("'>prev</a>");
		}
		else
			sb.append("prev");
		//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#f00'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("&keyword=" + keyword);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}

		sb.append("&nbsp;");

		//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage + 1);
			sb.append("&keyword=" + keyword);
			sb.append("'>next</a>");
		}
		else
			sb.append("next");
		//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
	
	
}

