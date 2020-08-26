package controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AcademyDAO;
import dao.Member_LogDAO;
import vo.AcademyVO;
import vo.F_BoardVO;
import vo.Member_LogVO;

@Controller
public class Member_LogController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	AcademyDAO academy_dao;
	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	public static final String VIEW_PATH_MY = "/WEB-INF/views/mypage/";
	Member_LogDAO member_log_dao;

	public void setMember_log_dao(Member_LogDAO member_log_dao) {
		this.member_log_dao = member_log_dao;
	}	
	
	
	//해당 회원(m_idx)에 해당하는 알림로그 목록 조회
	@RequestMapping("log_view.com")
	public String f_log_list(Model model, int m_idx) {
		
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
		List<AcademyVO> list = academy_dao.selectList_random();
		model.addAttribute("list",list);
		}

		// 댓글달린 게시글관련 로그 가져오기
		List<Member_LogVO> reply_list = null;
		reply_list = member_log_dao.select_replyF_log(m_idx);
		model.addAttribute("reply_list", reply_list);
		
		// 1:1답변관련로그 가져오기

		return VIEW_PATH_MY + "mypage.jsp";
	}
	
	//알림로그 조회 시 읽음표시 설정
	@ResponseBody
	@RequestMapping("log_update.com")
	public String f_log_update(int log_idx, String url) {

		//댓글달린 게시글관련 로그 가져오기
		int res = member_log_dao.check_log(log_idx);
		String resultStr = "";
		String result = "no";
		//해당 idx가 존재하지 않을 경우
		if( res == 0 ) {
			resultStr = String.format("[{'result':'%s', 'url' : '%s'}]", result, url);
			return resultStr;
		}
		if( res == 1 ) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s', 'url' : '%s'}]", result, url);
		return resultStr;
	}
	
}
