package controller;

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

import dao.F_BoardDAO;
import dao.ReplyDAO;
import util.PageUtil;
import util.Paging;
import vo.AcademyVO;
import vo.F_BoardVO;
import vo.ReplyVO;

@Controller
public class F_BoardController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	F_BoardDAO f_BoardDAO;

	public void setF_BoardDAO(F_BoardDAO f_BoardDAO) {
		this.f_BoardDAO = f_BoardDAO;
	}

	@RequestMapping("f_list.com")
	public String list(Model model, Integer page) {

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

		// 게시글 전체목록 가져오기
		List<F_BoardVO> f_list = null;
		f_list = f_BoardDAO.selectList(map);

		// 전체게시물 수 구하기
		int row_total = f_BoardDAO.getRowTotal();

		// 하단 페이지메뉴 생성하기
		String pageMenu = Paging.getPaging("f_list.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
				PageUtil.Board.BLOCKPAGE);
		model.addAttribute("f_list", f_list);
		model.addAttribute("pagemenu_f", pageMenu);

		// 세션에 기록되어 있던 show정보를 지운다
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
		// response.sendRedirect("list.do");
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
			// idx나 pwd가 일치하지 않을 경우 null이기 때문에 no를 콜백메서드로 전송한다
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

	// 댓글작성 화면으로 전환
	@RequestMapping("/f_reply_form.com")
	public String reply_form() {
		return PageUtil.Board.F_VIEW_PATH + "f_board_reply.jsp";
	}

	// 답글 등록
	@RequestMapping("/f_reply.com")
	public String reply(F_BoardVO vo, int page) {
		String ip = request.getRemoteAddr();

		// 댓글을 달고자 하는 기준글 번호(idx)를 사용하여 게시물 정보를 얻기
		F_BoardVO baseVO = f_BoardDAO.selectOne(vo.getF_idx());
		System.out.println("depth" + baseVO.getF_depth());
		// 기준글의 step보다 큰 값은 step + 1처리
		f_BoardDAO.update_step(baseVO);
		vo.setF_ip(ip);

		// 댓글이 들어갈 위치 선정
		vo.setF_ref(baseVO.getF_ref());
		vo.setF_step(baseVO.getF_step() + 1);
		vo.setF_depth(baseVO.getF_depth() + 1);

		// 댓글 등록
		f_BoardDAO.reply(vo);

		return "redirect:f_list.com?page=" + page;
		// response.sendRedirect("list.do?page=" + page);
	}

	ReplyDAO reply_dao;

	public void setReply_dao(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
	}
	
	/*
	 * @RequestMapping("/reply_list.com") public String r_list(Model model){
	 * List<ReplyVO> r_list = null; r_list = reply_dao.selectList();
	 * 
	 * 
	 * model.addAttribute("r_list", r_list); System.out.println(r_list); return
	 * PageUtil.Board.F_VIEW_PATH+"f_board_view.jsp";
	 * 
	 * }
	 */
	
	@RequestMapping("/reply_insert.com")
	@ResponseBody
	public String insertRpy(ReplyVO vo, HttpSession session ) {
		
		String resultStr = "";
		String result = "no";
		
		int res = reply_dao.insert(vo);
		
		if (res == 1) {
			result = "yes";
		}

		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}
	
	@RequestMapping("/reply_del.com")
	@ResponseBody
	public String resultRpy(int r_idx) {
		int res = reply_dao.delete(r_idx);

		String result = String.format("[{'result':'%s'}]", "no");
		if(res!=0) {
			result = String.format("[{'result':'%s'}]", "yes");
		}
		//@ResponseBody 어노테이션을 통해
		//result값이 스트링 타입 그대로 콜백메서드로 반환된다.
		return result;
	}
	
	//게시글 수정 폼으로 이동
	@RequestMapping("f_modify_form.com")
	public String move_modify_form(int f_idx){
		F_BoardVO vo = f_BoardDAO.selectOne(f_idx);
		request.setAttribute("vo", vo);
		return PageUtil.Board.F_VIEW_PATH + "f_board_modify_form.jsp";
	}
	
	//학원 게시글 수정하기
	@RequestMapping("/f_modify.com")
	public String academy_modify(F_BoardVO vo, Model model) {
		System.out.println("====================" + vo.getF_content());	
		String content = vo.getF_content().replaceAll("\n", "<br>");
		vo.setF_content(content);
			
		int res = f_BoardDAO.modify(vo);
		return "redirect:f_list.com";
	}
	

}
