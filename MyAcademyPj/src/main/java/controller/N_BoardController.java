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

import dao.AcademyDAO;
import dao.N_BoardDAO;
import util.PageUtil;
import util.Paging;
import vo.AcademyVO;
import vo.F_BoardVO;
import vo.N_BoardVO;

@Controller
public class N_BoardController {

	@Autowired
	HttpServletRequest request;

	N_BoardDAO n_BoardDAO;
	AcademyDAO academy_dao;
	
	
	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
		System.out.println("컨트롤러");
	}

	public void setN_BoardDAO(N_BoardDAO n_BoardDAO) {
		this.n_BoardDAO = n_BoardDAO;
	}

	@RequestMapping("n_list.com")
	public String list(Model model, Integer page) {
		
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
		List<AcademyVO> list = academy_dao.selectList_random();
		model.addAttribute("rec_list",list);
		}

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
		List<N_BoardVO> n_list = null;
		n_list = n_BoardDAO.selectList(map);

		// 전체게시물 수 구하기
		int row_total = n_BoardDAO.getRowTotal();

		// 하단 페이지메뉴 생성하기
		String pageMenu = Paging.getPaging("n_list.com", nowPage, row_total, PageUtil.Board.BLOCKLIST,
				PageUtil.Board.BLOCKPAGE);

		model.addAttribute("n_list", n_list);
		model.addAttribute("n_pagemenu", pageMenu);

		// 세션에 기록되어 있던 show정보를 지운다
		request.getSession().removeAttribute("show");

		return PageUtil.Board.N_VIEW_PATH + "n_board_list.jsp";
	}

	@RequestMapping("/n_view.com")
	public String view(Model model, int n_idx) {
		// idx에 해당하는 게시글 한 건 얻어오기
		N_BoardVO vo = n_BoardDAO.selectOne(n_idx);

		// 조회수 증가
		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			n_BoardDAO.update_readhit(n_idx);
			session.setAttribute("show", "yes");
		}

		model.addAttribute("vo", vo);
		return PageUtil.Board.N_VIEW_PATH + "n_board_view.jsp";
	}

	// 게시글 작성 화면으로 이동
	@RequestMapping("/n_insert_form.com")
	public String insert_form() {
		return PageUtil.Board.N_VIEW_PATH + "n_board_write.jsp";
	}

	// 게시글 등록
	@RequestMapping("/n_insert.com")
	public String insert(Model model, N_BoardVO vo) {
		String n_ip = request.getRemoteAddr(); // 접속자의 ip
		vo.setN_ip(n_ip);

		n_BoardDAO.insert(vo);

		return "redirect:n_list.com";
		// response.sendRedirect("n_list.com");
	}
	
	// 게시글 삭제
	@RequestMapping("/n_del.com")
	@ResponseBody
	public String delete(int n_idx) {
		String resultStr = "";
		String result = "no";
		int res = n_BoardDAO.delete(n_idx);
		if (res == 1) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}

}
