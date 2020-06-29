package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MemberController {

		@Autowired
		HttpServletRequest request;
		
		@Autowired
		HttpSession session;
		
		MemberDAO member_dao;	
		
		public void setMember_dao(MemberDAO member_dao) {
			this.member_dao = member_dao;
			System.out.println("컨트롤러");
		}
	
		public static final String VIEW_PATH_MEMBER = "/WEB-INF/views/member/";
		public static final String VIEW_PATH_MAIN = "/WEB-INF/views/main/";
		public static final String VIEW_PATH_BOOKMARK = "/WEB-INF/views/bookmark/";

		
		//메인
		@RequestMapping(value = {"/", "main.com"})
		public String start_main() {
			return VIEW_PATH_MAIN + "main.jsp";
		}
		
		//고객지원
		@RequestMapping("member_service.com")
		public String m_service() {
			return VIEW_PATH_MEMBER + "member_service.jsp";
		}
		
		//로그인 창으로 전환
		@RequestMapping("login_form.com")
		public String login_form() {
			return VIEW_PATH_MEMBER + "login_form.jsp";
		}
		//로그인 체크 매핑
		@RequestMapping("login_check.com")
		@ResponseBody
		public String login(MemberVO vo) {
			
	
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
			
			session = request.getSession();//HttpSession인터페이스를 사용
			session.setAttribute("user", user);
			//세션 유지시간은 기본이 30분 이지만 이것을 변경하고 싶다면..
			session.setMaxInactiveInterval(60 * 60); //60초 * 60
			
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
		public String logout() {
			session.removeAttribute("user");
			return VIEW_PATH_MAIN + "main.jsp";
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
			
			String str = "yes";
			
			if( res == 0 ) {
				str = "no";
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
		
		//내강의실 페이지로 전환
		@RequestMapping("mylecture.com")
		public String mylecture() {
			return VIEW_PATH_MEMBER + "mylecture.jsp";
		}
		
	
		
		
		
}

