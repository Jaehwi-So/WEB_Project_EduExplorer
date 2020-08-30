package com.five.myacademy.controller;

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

import com.five.myacademy.dao.AcademyDAO;
import com.five.myacademy.dao.N_BoardDAO;
import com.five.myacademy.paging.PageUtil;
import com.five.myacademy.paging.Paging;
import com.five.myacademy.vo.AcademyVO;
import com.five.myacademy.vo.F_BoardVO;
import com.five.myacademy.vo.N_BoardVO;

@Controller
public class N_BoardController {

	@Autowired
	HttpServletRequest request;
	
	private N_BoardDAO n_BoardDAO;
	private AcademyDAO academy_dao;

	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}
	public void setN_BoardDAO(N_BoardDAO n_BoardDAO) {
		this.n_BoardDAO = n_BoardDAO;
	}

	//공지게시글 조회
	@RequestMapping("n_list.do")
	public String list(Model model, Integer page) {

		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list",list);
		}

		int nowPage = 1;

		if (page != null) {
			nowPage = page;
		}

		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		List<N_BoardVO> n_list = null;
		n_list = n_BoardDAO.selectList(map);

		int row_total = n_BoardDAO.getRowTotal();

		String pageMenu = Paging.getPaging("n_list.do", nowPage, row_total, PageUtil.Board.BLOCKLIST,
				PageUtil.Board.BLOCKPAGE);

		model.addAttribute("n_list", n_list);
		model.addAttribute("n_pagemenu", pageMenu);

		request.getSession().removeAttribute("show");

		return PageUtil.Board.N_VIEW_PATH + "n_board_list.jsp";
	}

	//공지 게시글 상세조회
	@RequestMapping("/n_view.do")
	public String view(Model model, int n_idx) {
		N_BoardVO vo = n_BoardDAO.selectOne(n_idx);

		HttpSession session = request.getSession();
		String show = (String) session.getAttribute("show");

		if (show == null) {
			n_BoardDAO.update_readhit(n_idx);
			session.setAttribute("show", "yes");
		}

		model.addAttribute("vo", vo);
		return PageUtil.Board.N_VIEW_PATH + "n_board_view.jsp";
	}

	// 공지 게시글 작성 화면으로 이동
	@RequestMapping("/n_insert_form.do")
	public String insert_form() {
		return PageUtil.Board.N_VIEW_PATH + "n_board_write.jsp";
	}

	// 공지게시글 등록
	@RequestMapping("/n_insert.do")
	public String insert(Model model, N_BoardVO vo) {
		String n_ip = request.getRemoteAddr(); // 접속자의 ip
		vo.setN_ip(n_ip);

		n_BoardDAO.insert(vo);

		return "redirect:n_list.do";
	}

	// 공지게시글 삭제
	@RequestMapping("/n_del.do")
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
