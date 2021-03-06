package controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.AcademyDAO;
import dao.MeetingDAO;
import dao.MemberDAO;
import dao.Member_LogDAO;
import vo.AcademyNoticeVO;
import vo.F_BoardVO;
import vo.MeetingVO;
import vo.MemberVO;
import vo.Member_LogVO;

@Controller
public class MeetingController {
	public static final String VIEW_PATH = "/WEB-INF/views/meeting/";
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;

	MeetingDAO meeting_dao;
	Member_LogDAO member_log_dao;
	AcademyDAO academy_dao;

	public void setMeeting_dao(MeetingDAO meeting_dao) {
		this.meeting_dao = meeting_dao;
	}

	public void setMember_log_dao(Member_LogDAO member_log_dao) {
		this.member_log_dao = member_log_dao;
	}

	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	// 절대경로 얻어오기
	public String get_filename(MultipartFile photo) {
		String filename = "no_file";
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		if (!photo.isEmpty()) {
			filename = photo.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return filename;
	}

	//문의 게시판 조회
	@RequestMapping("/meeting.com")
	public String meet_list(Model model, int a_idx) {
		List<MeetingVO> list = null;
		list = meeting_dao.selectList(a_idx);
		model.addAttribute("list", list);
		model.addAttribute("a_idx", a_idx);
		return VIEW_PATH + "meeting_list.jsp";

	}

	// 문의게시판 등록페이지로 이동
	@RequestMapping("/meeting_insert_form.com")
	public String insert_form(Model model, int m_idx) {
		model.addAttribute("m_idx", m_idx);
		return VIEW_PATH + "meeting_insert_form.jsp";
	}

	// 문의게시판 게시글 등록
	@RequestMapping("/meeting_insert.com")
	public String insert(Model model, MeetingVO vo) {
		MultipartFile m_photo = vo.getM_photo();
		String meeting_photo = get_filename(m_photo);
		String content = vo.getMeeting_content().replaceAll("\n", "<br>");
		vo.setMeeting_content(content); 
		vo.setMeeting_photo(meeting_photo);

		meeting_dao.insert(vo);

		//알림 로그 생성
		Member_LogVO logVO = new Member_LogVO();
		int a_idx = vo.getA_idx();
		int m_idx = academy_dao.selectM_idx(a_idx);
		int meeting_idx = meeting_dao.selectSeq();
		logVO.setM_idx(m_idx);	//학원주에게 알림로그 생성
		logVO.setLog_type(2);
		String url = "meeting_view.com?meeting_idx=" + meeting_idx;
		logVO.setLog_url(url);
		int logres = member_log_dao.insert(logVO);
		return "redirect:meeting.com?m_idx=" + vo.getM_idx() +"&a_idx=" + vo.getA_idx();
	}

	// 문의게시글 하나 보여주기
	@RequestMapping("/meeting_view.com")
	public String view(Model model, int meeting_idx) {
		MeetingVO vo = meeting_dao.selectOne(meeting_idx);
		model.addAttribute("vo", vo);
		return VIEW_PATH + "meeting_view.jsp";
	}

	// 문의게시글 답변 폼으로 이동
	@RequestMapping("/meeting_modify_form.com")
	public String modify_form(int meeting_idx) {
		MeetingVO vo = meeting_dao.selectOne(meeting_idx);
		int m_idx = academy_dao.selectM_idx(vo.getA_idx());
		String content = vo.getMeeting_content().replaceAll("\n", "<br>");
		vo.setMeeting_content(content); 
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member.getM_idx() != m_idx) {
			request.setAttribute("res", "no");
		}
		else {
			request.setAttribute("res", "yes");
		}

		content =  vo.getMeeting_content() + "\n Re :";
		content = content.replaceAll("<br>", "\n");
		vo.setMeeting_content(content); 
		request.setAttribute("vo", vo);

		return VIEW_PATH + "meeting_modify_form.jsp";
	}

	// 문의게시글 답변하기
	@RequestMapping("/meeting_modify.com")
	public String meeting_modify(MeetingVO vo, Model model) {
		MultipartFile m_photo = vo.getM_photo();
		String meeting_photo = get_filename(m_photo);

		vo.setMeeting_photo(meeting_photo);
		meeting_dao.modify(vo);

		Member_LogVO logVO = new Member_LogVO();
		logVO.setM_idx(vo.getM_idx());	//학생에게 알림로그 생성
		logVO.setLog_type(3);
		String url = "meeting_view.com?meeting_idx=" + vo.getMeeting_idx();
		logVO.setLog_url(url);
		int logres = member_log_dao.insert(logVO);


		return "redirect:meeting.com?m_idx=" + vo.getM_idx() +"&a_idx=" + vo.getA_idx();

	}

}
