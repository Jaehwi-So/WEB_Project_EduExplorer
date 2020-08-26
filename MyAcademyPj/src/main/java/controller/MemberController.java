package controller;

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

import dao.AcademyDAO;
import dao.MemberDAO;
import vo.AcademyVO;
import vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	MemberDAO member_dao;
	AcademyDAO academy_dao;


	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}

	public static final String VIEW_PATH_MEMBER = "/WEB-INF/views/member/";
	public static final String VIEW_PATH_MAIN = "/WEB-INF/views/main/";
	public static final String VIEW_PATH_BOOKMARK = "/WEB-INF/views/bookmark/";
	public static final String VIEW_PATH_MYPAGE = "/WEB-INF/views/mypage/";

	//로그인 창으로 전환
	@RequestMapping("login_form.com")
	public String login_form(Model model) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list",list);
		}
		return VIEW_PATH_MEMBER + "login_form.jsp";
	}
	
	//로그인 체크 매핑
	@RequestMapping("login_check.com")
	@ResponseBody
	public String login(MemberVO vo , Model model) {
		MemberVO user = member_dao.selectOne(vo.getM_id());
		String resultStr = "";
		String param = "";


		if(user == null) {				
			param = "no_id";
			resultStr = String.format("[{'param' : '%s'}]", param);

			return resultStr;
		}

		if( !user.getM_pwd().equals(vo.getM_pwd()) ) {
			param = "no_pwd";
			resultStr = String.format("[{'param' : '%s'}]", param);

			return resultStr;

		}
		session = request.getSession();
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(60 * 60); //세션 유지시간 60초 * 60

		//로그인 가능
		param = "clear";
		resultStr = String.format("[{'param' : '%s'}]", param);
		return resultStr;
	}
	//회원등록으로 연결해주는 매핑
	@RequestMapping("reg_form.com")
	public String reg_form() {
		return VIEW_PATH_MEMBER + "reg_form.jsp";
	}

	//회원등록 ajax
	@RequestMapping("insert.com")
	@ResponseBody
	public String insert(MemberVO vo){

		int res	= member_dao.insert(vo);
		String str = "yes";
		if( res == 0 ) {
			str = "no";
		}
		String resultStr = String.format("[{'param': '%s'} ]", str);
		return resultStr;
	}

	//로그아웃 세션제거
	@RequestMapping("logout.com")
	public String logout(Model model) {
		session.removeAttribute("user");
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list", list);
		}
		return "redirect:main.com";
	}


	//회원정보 폼 전환
	@RequestMapping("member_update.com")
	public String member_update() {
		return VIEW_PATH_MEMBER + "update_form.jsp";
	}


	//회원정보변경
	@RequestMapping("update.com")
	@ResponseBody
	public String member_update(Model model,MemberVO vo) {
		int res = member_dao.update(vo);

		String str = "no";
		
		//세션 재등록
		if( res != 0 ) {
			str = "yes";
			session.removeAttribute("user");
			MemberVO user = member_dao.selectOne(vo.getM_id());
			session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(60 * 60);
		}
		String resultStr = String.format("[{'param': '%s'}]", str);
		return resultStr;
	}
	//중복확인
	@RequestMapping("over_check.com")
	@ResponseBody
	public String over_check(String m_id) {
		MemberVO checkVO = member_dao.selectOne(m_id);		

		String str = "no";
		if(checkVO == null) {
			str = "yes";
		}
		String resultStr = String.format("[{'param': '%s'}]", str);
		return resultStr;
	}
	//회원 탈퇴
	@RequestMapping("member_del.com")
	@ResponseBody
	public String del_member(int m_idx) {
		int res = member_dao.delete(m_idx);

		String str = "no";

		if( res != 0 ) {
			str = "yes";
			session.removeAttribute("user");
			String resultStr = String.format("[{'param': '%s'} ]", str);
			return resultStr;
		}
		else {
			String resultStr = String.format("[{'param': '%s'} ]", str);	
			return resultStr;
		}

	}
}