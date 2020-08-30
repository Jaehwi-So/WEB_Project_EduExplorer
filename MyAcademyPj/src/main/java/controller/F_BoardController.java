package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.AcademyDAO;
import dao.F_BoardDAO;
import dao.Member_LogDAO;
import dao.ReplyDAO;
import util.PageUtil;
import util.Paging;
import vo.AcademyVO;
import vo.F_BoardVO;
import vo.Member_LogVO;
import vo.ReplyVO;

@Controller
public class F_BoardController {

	public static final String VIEW_PATH_MY = "/WEB-INF/views/mypage/";
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	F_BoardDAO f_BoardDAO;
	Member_LogDAO member_log_dao;
	AcademyDAO academy_dao;
	ReplyDAO reply_dao;


	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}
	public void setF_BoardDAO(F_BoardDAO f_BoardDAO) {
		this.f_BoardDAO = f_BoardDAO;
	}
	public void setMember_log_dao(Member_LogDAO member_log_dao) {
		this.member_log_dao = member_log_dao;
	}
	public void setReply_dao(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
	}


	@RequestMapping("f_list.com")
	public String list(Model model, Integer page, String keyword) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list", list);
		}
		
		int nowPage = 1;// 기본페이지

		if (page != null) {
			nowPage = page;
		}
		List<F_BoardVO> f_list = null;
		String pageMenu;
		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;
		if(keyword != null) {
			String key = "%" + keyword + "%";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", key);
	
			int row_total = f_BoardDAO.getRowTotal_keyword(key);
			f_list = f_BoardDAO.selectList_keyword(map);
	
			pageMenu = Paging.getPaging_fBoard_keyword("f_list.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
					PageUtil.Board.BLOCKPAGE, keyword);
		}
		else {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			f_list = f_BoardDAO.selectList(map);
	
			// 전체게시물 수 구하기
			int row_total = f_BoardDAO.getRowTotal();
	
			// 하단 페이지메뉴 생성하기
			pageMenu = Paging.getPaging("f_list.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
					PageUtil.Board.BLOCKPAGE);
		}
		model.addAttribute("f_list", f_list);
		model.addAttribute("pagemenu_f", pageMenu);
		request.getSession().removeAttribute("show");

		return PageUtil.Board.F_VIEW_PATH + "f_board_list.jsp";
		
	}

	@RequestMapping("/f_view.com")
	public String view(Model model, int f_idx) {
		// idx에 해당하는 게시글 한 건 얻어오기
		F_BoardVO vo = f_BoardDAO.selectOne(f_idx);

		// 조회수 증가
		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			f_BoardDAO.update_readhit(f_idx);
			session.setAttribute("show", "yes");
		}
		model.addAttribute("vo", vo);

		// 댓글 가져오기
		List<ReplyVO> r_list = null;
		r_list = reply_dao.selectList(f_idx);

		model.addAttribute("r_list", r_list);	
		System.out.println(r_list);

		return PageUtil.Board.F_VIEW_PATH + "f_board_view.jsp";
	}

	// 게시글 작성 화면으로 이동
	@RequestMapping("/f_insert_form.com")
	public String insert_form() {
		return PageUtil.Board.F_VIEW_PATH + "f_board_write.jsp";
	}

	// 게시글 등록
	@RequestMapping("/f_insert.com")
	public String insert(Model model, F_BoardVO vo) {

		String ip = request.getRemoteAddr();// 접속자의 ip
		vo.setF_ip(ip);
		String content = vo.getF_content().replaceAll("\n", "<br>");
		vo.setF_content(content);
		f_BoardDAO.insert(vo);

		return "redirect:f_list.com";
	}

	// 게시글 삭제
	@RequestMapping("/f_del.com")
	@ResponseBody
	public String delete(int f_idx, String f_pwd) {

		// 삭제하고자 하는 vo정보를 얻어온다
		F_BoardVO baseVO = f_BoardDAO.selectOne(f_idx, f_pwd);

		String resultStr = "";
		String result = "no";

		if (baseVO == null) {
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}

		baseVO.setF_subject("작성자에 의해 삭제된 게시글 입니다");
		baseVO.setF_name("Unknown");

		int res = f_BoardDAO.del_update(baseVO);
		if (res == 1) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;

	}

	// 답글작성 화면으로 전환
	@RequestMapping("/f_reply_form.com")
	public String reply_form() {
		return PageUtil.Board.F_VIEW_PATH + "f_board_reply.jsp";
	}

	// 답글 등록
	@RequestMapping("/f_reply.com")
	public String reply(F_BoardVO vo, int page, String keyword) {
		String ip = request.getRemoteAddr();

		F_BoardVO baseVO = f_BoardDAO.selectOne(vo.getF_idx());
		System.out.println("depth" + baseVO.getF_depth());
		// 기준글의 step보다 큰 값은 step + 1처리
		f_BoardDAO.update_step(baseVO);
		vo.setF_ip(ip);

		// 답글이 들어갈 위치 초기화
		vo.setF_ref(baseVO.getF_ref());
		vo.setF_step(baseVO.getF_step() + 1);
		vo.setF_depth(baseVO.getF_depth() + 1);
		String keywordEncode = "";
		try {
			keywordEncode = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		f_BoardDAO.reply(vo);

		return "redirect:f_list.com?page=" + page + "&keyword=" + keywordEncode;
	}

	//댓글 등록
	@RequestMapping("/reply_insert.com")
	@ResponseBody
	public String insertRpy(ReplyVO vo, HttpSession session ) {

		String resultStr = "";
		String result = "no";

		int res = reply_dao.insert(vo);

		if (res == 1) {
			String url = "f_view.com?f_idx=" + vo.getR_board();
			//알림 로그 생성
			Member_LogVO logVO = new Member_LogVO();
			F_BoardVO boardVO = f_BoardDAO.selectOne(vo.getR_board());
			logVO.setM_idx(boardVO.getM_idx());
			logVO.setLog_type(1);
			logVO.setLog_url(url);
			int logres = member_log_dao.insert(logVO);
			if(logres == 1) {
				result = "yes";
			}
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}

	//댓글 삭제
	@RequestMapping("/reply_del.com")
	@ResponseBody
	public String resultRpy(int r_idx) {
		int res = reply_dao.delete(r_idx);

		String result = String.format("[{'result':'%s'}]", "no");
		if(res!=0) {
			result = String.format("[{'result':'%s'}]", "yes");
		}
		return result;
	}

	//게시글 수정 폼으로 이동
	@RequestMapping("f_modify_form.com")
	public String move_modify_form(int f_idx){
		F_BoardVO vo = f_BoardDAO.selectOne(f_idx);
		String content = vo.getF_content().replaceAll("<br>", "\n");
		vo.setF_content(content);
		request.setAttribute("vo", vo);
		return PageUtil.Board.F_VIEW_PATH + "f_board_modify_form.jsp";
	}

	//게시글 수정하기
	@RequestMapping("/f_modify.com")
	public String academy_modify(F_BoardVO vo, Model model, int page, String keyword) {
		String content = vo.getF_content().replaceAll("\n", "<br>");
		vo.setF_content(content);
		int f_idx = vo.getF_idx();
		int res = f_BoardDAO.modify(vo);
		String keywordEncode = "";
		try {
			keywordEncode = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:f_view.com?f_idx=" + f_idx + "&page=" + page + "&keyword=" + keywordEncode;
	}


	//내가 올린 게시물 조회
	@RequestMapping("f_list_my.com")
	public String list_my(Model model, Integer page, int m_idx) {

		int nowPage = 1;// 기본페이지

		if (page != null) {
			nowPage = page;
		}

		// 한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("m_idx", (Integer)m_idx);
		System.out.println(map);
		// 전체게시물 수 구하기
		int row_total = f_BoardDAO.getRowTotal_my(m_idx);

		// 게시글 전체목록 가져오기
		List<F_BoardVO> f_list = null;
		f_list = f_BoardDAO.selectList_my(map);

		// 하단 페이지메뉴 생성하기
		String pageMenu = Paging.getPaging_myFboard("f_list_my.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
				PageUtil.Board.BLOCKPAGE, m_idx);
		model.addAttribute("f_list", f_list);
		model.addAttribute("pagemenu_f", pageMenu);
		model.addAttribute("info", "post");

		// 세션에 기록되어 있던 show정보를 지운다
		request.getSession().removeAttribute("show");

		return VIEW_PATH_MY + "mypage_fboard.jsp";
	}

	//내가 댓글단 게시물 조회
	@RequestMapping("f_list_myreply.com")
	public String list_myreply(Model model, Integer page, int m_idx) {

		int nowPage = 1;// 기본페이지

		if (page != null) {
			nowPage = page;
		}

		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("m_idx", (Integer)m_idx);
		System.out.println(map);
		int row_total = f_BoardDAO.getRowTotal_myreply(m_idx);

		List<F_BoardVO> f_list = null;
		f_list = f_BoardDAO.selectList_myreply(map);

		// 하단 페이지메뉴 생성하기
		String pageMenu = Paging.getPaging_myFboard("f_list_myreply.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
				PageUtil.Board.BLOCKPAGE, m_idx);
		model.addAttribute("f_list", f_list);
		model.addAttribute("pagemenu_f", pageMenu);
		model.addAttribute("info", "comment");

		// 세션에 기록되어 있던 show정보를 지운다
		request.getSession().removeAttribute("show");

		return VIEW_PATH_MY + "mypage_fboard.jsp";
	}

}

