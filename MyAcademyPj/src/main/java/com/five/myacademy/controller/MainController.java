package com.five.myacademy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.five.myacademy.dao.AcademyDAO;
import com.five.myacademy.dao.MemberDAO;
import com.five.myacademy.vo.AcademyVO;
import com.five.myacademy.vo.MemberVO;

@Controller
public class MainController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	private AcademyDAO academy_dao;


	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	public static final String VIEW_PATH_MEMBER = "/WEB-INF/views/member/";
	public static final String VIEW_PATH_MAIN = "/WEB-INF/views/main/";
	public static final String VIEW_PATH_MYPAGE = "/WEB-INF/views/mypage/";


	//메인으로 이동
	@RequestMapping(value = {"/", "main.do"})
	public String start_main(Model model) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list",list);
		}
		return VIEW_PATH_MAIN + "main.jsp";
	}

	//고객지원으로 이동
	@RequestMapping("member_service.do")
	public String m_service(Model model) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list",list);
		}
		return VIEW_PATH_MEMBER + "member_service.jsp";
	}


	//내 강의실 페이지로 전환
	@RequestMapping("mylecture.do")
	public String mylecture() {
		return VIEW_PATH_MYPAGE + "mypage.jsp";
	}

}