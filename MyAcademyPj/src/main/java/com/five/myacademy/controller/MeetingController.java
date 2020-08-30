package com.five.myacademy.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.five.myacademy.dao.AcademyDAO;
import com.five.myacademy.dao.MeetingDAO;
import com.five.myacademy.dao.MemberDAO;
import com.five.myacademy.dao.Member_LogDAO;
import com.five.myacademy.paging.PageUtil;
import com.five.myacademy.paging.Paging;
import com.five.myacademy.util.FileUtil;
import com.five.myacademy.vo.AcademyNoticeVO;
import com.five.myacademy.vo.F_BoardVO;
import com.five.myacademy.vo.MeetingVO;
import com.five.myacademy.vo.MemberVO;
import com.five.myacademy.vo.Member_LogVO;

@Controller
public class MeetingController {
	public static final String VIEW_PATH = "/WEB-INF/views/meeting/";
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;

	private MeetingDAO meeting_dao;
	private Member_LogDAO member_log_dao;
	private AcademyDAO academy_dao;
	private FileUtil fileUtil;

	public void setMeeting_dao(MeetingDAO meeting_dao) {
		this.meeting_dao = meeting_dao;
	}

	public void setMember_log_dao(Member_LogDAO member_log_dao) {
		this.member_log_dao = member_log_dao;
	}

	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	public void setFileUtil(FileUtil fileUtil) {
		this.fileUtil = fileUtil;
	}

	//문의 게시판 조회
	@RequestMapping("/meeting.do")
	public String meet_list(Model model, int a_idx, Integer page) {
		List<MeetingVO> list = null;
		int nowPage = 1;// 기본페이지

		if (page != null) {
			nowPage = page;
		}
		
		String pageMenu;
		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("a_idx", a_idx);
		map.put("start", start);
		map.put("end", end);
		list = meeting_dao.selectList(map);
	
		// 전체게시물 수 구하기
		int row_total = meeting_dao.getRowTotal(a_idx);
		System.out.println(row_total);
		// 하단 페이지메뉴 생성하기
		pageMenu = Paging.getPaging_Ainner("meeting.do?a_idx=" + a_idx, nowPage, row_total, PageUtil.Board.BLOCKLIST,
					PageUtil.Board.BLOCKPAGE);
		model.addAttribute("list", list);
		model.addAttribute("a_idx", a_idx);
		model.addAttribute("pagemenu", pageMenu);

		return VIEW_PATH + "meeting_list.jsp";
	}

	// 문의게시판 등록페이지로 이동
	@RequestMapping("/meeting_insert_form.do")
	public String insert_form(Model model, int m_idx) {
		model.addAttribute("m_idx", m_idx);
		return VIEW_PATH + "meeting_insert_form.jsp";
	}

	// 문의게시판 게시글 등록
	@RequestMapping("/meeting_insert.do")
	public String insert(Model model, MeetingVO vo) {
		MultipartFile m_photo = vo.getM_photo();
		String meeting_photo = fileUtil.get_filename(m_photo);
		vo.setMeeting_photo(meeting_photo);

		meeting_dao.insert(vo);

		//알림 로그 생성
		Member_LogVO logVO = new Member_LogVO();
		int a_idx = vo.getA_idx();
		int m_idx = academy_dao.selectM_idx(a_idx);
		int meeting_idx = meeting_dao.selectSeq();
		logVO.setM_idx(m_idx);	//학원주에게 알림로그 생성
		logVO.setLog_type(2);
		String url = "meeting_view.do?meeting_idx=" + meeting_idx;
		logVO.setLog_url(url);
		int logres = member_log_dao.insert(logVO);
		return "redirect:meeting.do?m_idx=" + vo.getM_idx() +"&a_idx=" + vo.getA_idx();
	}

	// 문의게시글 하나 보여주기
	@RequestMapping("/meeting_view.do")
	public String view(Model model, int meeting_idx) {
		MeetingVO vo = meeting_dao.selectOne(meeting_idx);
		String content = vo.getMeeting_content();
		int idx= content.indexOf("&!@ANS&");
		String answer = "&NotHaveAnswer";
		if(idx != -1) {
			String question = content.substring(0, idx-1);
			answer = content.substring(idx + 7, content.length()-1);
			vo.setMeeting_content(question);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("meeting_answer", answer);
		return VIEW_PATH + "meeting_view.jsp";
	}

	// 문의게시글 답변 폼으로 이동
	@RequestMapping("/meeting_modify_form.do")
	public String modify_form(int meeting_idx) {
		MeetingVO vo = meeting_dao.selectOne(meeting_idx);
		int m_idx = academy_dao.selectM_idx(vo.getA_idx());
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member.getM_idx() != m_idx) {
			request.setAttribute("res", "no");
		}
		else {
			request.setAttribute("res", "yes");
		}
		request.setAttribute("vo", vo);

		return VIEW_PATH + "meeting_modify_form.jsp";
	}

	// 문의게시글 답변하기
	@RequestMapping("/meeting_modify.do")
	public String meeting_modify(MeetingVO vo, Model model, String meeting_answer) {
		String content = vo.getMeeting_content() + "\n\n";
		content += "&!@ANS&";
		content += meeting_answer;
		vo.setMeeting_content(content); 
		meeting_dao.modify(vo);

		Member_LogVO logVO = new Member_LogVO();
		logVO.setM_idx(vo.getM_idx());	//학생에게 알림로그 생성
		logVO.setLog_type(3);
		String url = "meeting_view.do?meeting_idx=" + vo.getMeeting_idx();
		logVO.setLog_url(url);
		int logres = member_log_dao.insert(logVO);


		return "redirect:meeting.do?m_idx=" + vo.getM_idx() +"&a_idx=" + vo.getA_idx();

	}

}
