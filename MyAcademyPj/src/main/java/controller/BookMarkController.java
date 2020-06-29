package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BookMarkDAO;
import vo.BookMarkVO;

@Controller
public class BookMarkController {
	public static final String VIEW_PATH_BOOKMARK = "/WEB-INF/views/bookmark/";
	@Autowired
	HttpServletRequest request;
	@Autowired 
	ServletContext application;
	@Autowired
	HttpSession session;
	
	BookMarkDAO bookmark_dao;
	
	public void setBookmark_dao(BookMarkDAO bookmark_dao) {
		this.bookmark_dao = bookmark_dao;
	}
	
	@RequestMapping("bookmark_insert.com")
	@ResponseBody
 	public String bm_insert(BookMarkVO vo) {
				
			System.out.println(vo.getM_idx());
			System.out.println(vo.getA_idx());
			
				//이미 장바구니에 등록된 상품인지 확인
				BookMarkVO res_vo = bookmark_dao.selectOne(vo);
				
				String result = "no";
				
				if( res_vo == null ) {//장바구니에 상품가가 가능한 상태
					
					result = "yes";
					
					//장바구니에 상품등록
					bookmark_dao.insert(vo);
				}
				
				String resultStr = String.format("[{'param' : '%s'}]" , result);
				
				return resultStr;
 	}
	
			//즐겨찾기목록으로 보내기
	
			@RequestMapping("bookmark.com")
			public String bookmark(Model model , Integer m_idx) {
				
				System.out.println("tt:"+m_idx);
				
				List<BookMarkVO> list = bookmark_dao.selectList(m_idx);
				model.addAttribute("list", list);
				return VIEW_PATH_BOOKMARK + "bookmark_list.jsp";
				
			}
	
}
