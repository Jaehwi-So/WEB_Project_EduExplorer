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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.AcademyDAO;
import dao.AcademyNoticeDAO;
import vo.AcademyNoticeVO;
import vo.AcademyVO;
import vo.MemberVO;

@Controller
public class AcademyNoticeController {
	public static final String VIEW_PATH_ACADEMY = "/WEB-INF/views/academy_list/";
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;

	AcademyDAO academy_dao;
	AcademyNoticeDAO academynotice_dao;

	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}

	public void setAcademynotice_dao(AcademyNoticeDAO academynotice_dao) {
		this.academynotice_dao = academynotice_dao;
	}

	// 절대경로 얻어오기
	public String get_filename(MultipartFile photo) {
		String filename = "no_file";
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		// 업로드 한 파일이 실제로 존재한다면
		if (!photo.isEmpty()) {
			// 업로드 된 파일명
			filename = photo.getOriginalFilename();

			// 저장할 파일경로 지정
			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) {
				saveFile.mkdirs();// 없는 폴더 생성
			} else {
				// 동일파일명 업로드 방지를 위해 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				// 업로드된 파일은 MultipartResolver라는 클래스가 지정해둔
				// 임시저장소에 있는데, 임시저장소의 파일은 일정시간이 지나면 사라지기 때문에
				// 내가 지정해준 savePath경로로 복사해준다.
				photo.transferTo(saveFile);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // if
		return filename;
	}

	// 학원내 게시판 등록페이지로 이동
	@RequestMapping("/a_notice_insert_form.com")
	public String insert_form(Model model, int a_idx, String a_owner) {
		model.addAttribute("a_idx", a_idx);
		model.addAttribute("a_owner", a_owner);
		return VIEW_PATH_ACADEMY + "academy_notice_insert_form.jsp";
	}

	// 학원내 게시판 게시글 등록
	@RequestMapping("a_notice_insert.com")
	public String insert(Model model, AcademyNoticeVO vo) {
		MultipartFile a_photo = vo.getA_photo();
		String a_notice_photo = get_filename(a_photo);
		String content = vo.getA_notice_content().replaceAll("\n", "<br>");
		vo.setA_notice_content(content);
		String ip = request.getRemoteAddr();
		session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		int m_idx = member.getM_idx();
	
		vo.setA_notice_photo(a_notice_photo);
		vo.setA_notice_ip(ip);
		vo.setM_idx(m_idx);
		
		academynotice_dao.insert(vo);
		return "redirect:a_list_detail.com?a_idx=" + vo.getA_idx();
	}

	// 게시글 하나 보여주기
	@RequestMapping("/view.com")
	public String view(Model model, int a_notice_idx) {
		AcademyNoticeVO vo = academynotice_dao.selectOne(a_notice_idx);
		model.addAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_notice_view.jsp";
	}
	
	// 게시글 삭제하기
	@RequestMapping("/a_notice_del.com")
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
	@RequestMapping("/a_notice_modify_form.com")
	public String modify_form(int a_notice_idx) {
		AcademyNoticeVO vo = academynotice_dao.selectOne(a_notice_idx);
		String content = vo.getA_notice_content().replaceAll("<br>", "\n");
		vo.setA_notice_content(content);
		request.setAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_notice_modify_form.jsp";
	}
	
	//게시글 수정하기
	@RequestMapping("/a_notice_modify.com")
	public String a_notice_modify(AcademyNoticeVO vo, Model model) {
		MultipartFile a_photo = vo.getA_photo();
		String a_notice_photo = get_filename(a_photo);
		String content = vo.getA_notice_content().replaceAll("\n", "<br>");
		vo.setA_notice_content(content);
		vo.setA_notice_photo(a_notice_photo);
		academynotice_dao.modify(vo);
		return "redirect:a_list_detail.com?a_idx=" + vo.getA_idx();
		
	}

}
