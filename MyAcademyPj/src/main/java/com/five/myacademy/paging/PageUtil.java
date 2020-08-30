package com.five.myacademy.paging;

//게시물 페이징 처리 관련 상수들을 정의한 내부 클래스를 모아둔 곳
public class PageUtil {

   public static class Academy{
      public static final String VIEW_PATH = "/WEB-INF/views/academy_list/";
      
      //한 페이지당 보여줄 게시물 수
      public final static int BLOCKLIST = 9;
      //한 화면에 보여지는 페이지 메뉴 수
      public final static int BLOCKPAGE = 4;
   }
   
	public static class Board{
		public static final String N_VIEW_PATH = "/WEB-INF/views/n_board/";
		public static final String F_VIEW_PATH = "/WEB-INF/views/f_board/";
		
		//한 페이지당 보여줄 게시물 수
		public final static int BLOCKLIST = 10;
		//한 화면에 보여지는 페이지 메뉴 수
		public final static int BLOCKPAGE = 5;
	}
	
	public static class Notice{
		public final static int BLOCKLIST = 8;
		public final static int BLOCKPAGE = 5;
	}
   
}




