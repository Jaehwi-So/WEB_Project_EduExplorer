package com.five.myacademy.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.five.myacademy.dao.AcademyDAO;
import com.five.myacademy.dao.AcademyNoticeDAO;
import com.five.myacademy.util.FileUtil;
import com.five.myacademy.vo.AcademyNoticeVO;
import com.five.myacademy.vo.AcademyVO;
import com.five.myacademy.vo.MemberVO;

@Controller
public class AcademyNoticeController {
	public static final String VIEW_PATH_ACADEMY = "/WEB-INF/views/academy_list/";
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;

	private AcademyDAO academy_dao;
	private AcademyNoticeDAO academynotice_dao;
	private FileUtil fileUtil;

	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	public void setAcademynotice_dao(AcademyNoticeDAO academynotice_dao) {
		this.academynotice_dao = academynotice_dao;
	}

	public void setFileUtil(FileUtil fileUtil) {
		this.fileUtil = fileUtil;
	}
	

	// 학원내 게시판 등록페이지로 이동
	@RequestMapping("/a_notice_insert_form.do")
	public String insert_form(Model model, int a_idx, String a_owner, int page) {
		model.addAttribute("a_idx", a_idx);
		model.addAttribute("a_owner", a_owner);
		model.addAttribute("page", page);
		return VIEW_PATH_ACADEMY + "academy_notice_insert_form.jsp";
	}

	// 학원내 게시판 게시글 등록
	@RequestMapping("a_notice_insert.do")
	public String insert(Model model, AcademyNoticeVO vo) {
		MultipartFile a_photo = vo.getA_photo();
		String a_notice_photo = fileUtil.get_filename(a_photo);
		String ip = request.getRemoteAddr();
		session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		int m_idx = member.getM_idx();
	
		vo.setA_notice_photo(a_notice_photo);
		vo.setA_notice_ip(ip);
		vo.setM_idx(m_idx);
		
		academynotice_dao.insert(vo);
		return "redirect:a_list_detail.do?a_idx=" + vo.getA_idx();
	}

	// 게시글 하나 보여주기
	@RequestMapping("/notice_view.do")
	public String view(Model model, int a_notice_idx) {
		AcademyNoticeVO vo = academynotice_dao.selectOne(a_notice_idx);
		model.addAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_notice_view.jsp";
	}
	
	// 게시글 삭제하기
	@RequestMapping("/a_notice_del.do")
	@ResponseBody
	public String delete(int a_notice_idx) {
		AcademyNoticeVO vo = academynotice_dao.selectOne(a_notice_idx);
		
		String resultStr = "";
		String result = "no";
		
		if( vo == null) {
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
		
		int res = academynotice_dao.delete( a_notice_idx );
		
		if( res == 1 ) {
			result = "yes";
		}
		
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
		
	}
	
	//게시글 수정 폼으로 이동
	@RequestMapping("/a_notice_modify_form.do")
	public String modify_form(int a_notice_idx, int page) {
		AcademyNoticeVO vo = academynotice_dao.selectOne(a_notice_idx);
		String content = vo.getA_notice_content().replaceAll("<br>", "\n");
		vo.setA_notice_content(content);
		request.setAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_notice_modify_form.jsp";
	}
	
	//게시글 수정하기
	@RequestMapping("/a_notice_modify.do")
	public String a_notice_modify(AcademyNoticeVO vo, Model model, int page) {
		MultipartFile a_photo = vo.getA_photo();
		String a_notice_photo = fileUtil.get_filename(a_photo);
		vo.setA_notice_photo(a_notice_photo);
		academynotice_dao.modify(vo);
		return "redirect:notice_view.do?a_notice_idx="+ vo.getA_notice_idx() +"&page=" + page;
		
	}

}
