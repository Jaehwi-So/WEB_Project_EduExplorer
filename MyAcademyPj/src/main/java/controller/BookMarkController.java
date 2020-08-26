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
	
	//즐겨찾기 추가
	@RequestMapping("bookmark_insert.com")
	@ResponseBody
	public String bm_insert(BookMarkVO vo) {

		BookMarkVO res_vo = bookmark_dao.selectOne(vo);

		String result = "no";

		if( res_vo == null ) {//즐겨찾기 등록이 가능한 상태
			result = "yes";
			//즐겨찾기 추가
			bookmark_dao.insert(vo);
		}
		String resultStr = String.format("[{'param' : '%s'}]" , result);
		return resultStr;
	}

	//즐겨찾기 목록으로 이동
	@RequestMapping("bookmark.com")
	public String bookmark(Model model , Integer m_idx) {

		System.out.println("tt:"+m_idx);

		List<BookMarkVO> list = bookmark_dao.selectList(m_idx);
		model.addAttribute("list", list);
		return VIEW_PATH_BOOKMARK + "bookmark_list.jsp";

	}
	
	//즐겨찾기 삭제
	@RequestMapping("bm_delete.com")
	@ResponseBody
	public String bm_delete(BookMarkVO vo) {
		System.out.println(vo.getA_idx());
		System.out.println(vo.getM_idx());
		int res = bookmark_dao.delete(vo);
		System.out.println(res);
		String result = "yes";
		if(res == 0) {
			result = "no";
			String resultStr = String.format("[{'param' : '%s'}]" , result);
			return resultStr;
		}
		String resultStr = String.format("[{'param' : '%s'}]" , result);
		return resultStr;

	}
}













