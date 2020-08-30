package com.five.myacademy.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.five.myacademy.dao.AcademyDAO;
import com.five.myacademy.dao.AcademyNoticeDAO;
import com.five.myacademy.dao.BookMarkDAO;
import com.five.myacademy.dao.GoodDAO;
import com.five.myacademy.paging.PageUtil;
import com.five.myacademy.paging.Paging;
import com.five.myacademy.util.FileUtil;
import com.five.myacademy.vo.AcademyNoticeVO;
import com.five.myacademy.vo.AcademyVO;
import com.five.myacademy.vo.BookMarkVO;
import com.five.myacademy.vo.FilterVO;
import com.five.myacademy.vo.GoodVO;
import com.five.myacademy.vo.MemberVO;
//수정된 목록
@Controller
public class AcademyController {
	public static final String VIEW_PATH_ACADEMY = "/WEB-INF/views/academy_list/";
	@Autowired
	HttpServletRequest request;
	@Autowired 
	ServletContext application; 
	@Autowired
	HttpSession session;

	private GoodDAO good_dao;
	private BookMarkDAO bookmark_dao;
	private AcademyNoticeDAO academynotice_dao;
	private AcademyDAO academy_dao;
	private FileUtil fileUtil;
	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}
	public void setGood_dao(GoodDAO good_dao) {
		this.good_dao = good_dao;
	}
	public void setAcademynotice_dao(AcademyNoticeDAO academynotice_dao) {
		this.academynotice_dao = academynotice_dao;
	}
	public void setFileUtil(FileUtil util) {
		this.fileUtil = util;
	}
	public void setBookmark_dao(BookMarkDAO bookmark_dao) {
		this.bookmark_dao = bookmark_dao;
	}



	//학원등록 폼으로 이동
	@RequestMapping("/a_move_form.do")
	public String move_form() {
		return VIEW_PATH_ACADEMY + "academy_regi_form.jsp";
	}

	//학원 상세조회 시  조회
	@RequestMapping("/a_list_detail.do")
	public String show_detail(Model model, Integer page) {
		int a_idx = Integer.parseInt(request.getParameter("a_idx"));
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null) {
			String m_id = user.getM_id();
			GoodVO resVO = good_dao.selectOne(m_id, a_idx);
			
			int m_idx = user.getM_idx();
			BookMarkVO bookResVO = bookmark_dao.selectOne(m_idx, a_idx);
			if(resVO != null) {
				request.setAttribute("good_ck", 1);
			}
			else {
				request.setAttribute("good_ck", 0);
			}
			if(bookResVO != null) {
				request.setAttribute("bookmark_ck", 1);
			}
			else {
				request.setAttribute("bookmark_ck", 0);
			}
		}
		else {
			request.setAttribute("good_ck", "0");
			request.setAttribute("bookmark_ck", 0);
		}
		int good_num = good_dao.selectJoin(a_idx);	//좋아요 수 조회
		request.setAttribute("good_num", good_num);
		
		
		AcademyVO vo = academy_dao.selectOne(a_idx);	//학원 조회
		request.setAttribute("vo", vo);			
		int nowPage = 1;//기본페이지
		if( page != null ) {
			nowPage = page;
		}
		int start = (nowPage -1 ) * PageUtil.Notice.BLOCKLIST + 1;
		int end = start + PageUtil.Notice.BLOCKLIST - 1; 

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("a_idx", a_idx);

		//내부 게시판 목록 가져오기
		List<AcademyNoticeVO> list = null;       
		list = academynotice_dao.selectList(map);

		//전체게시물 수 구하기
		int row_total = academynotice_dao.getRowTotal(a_idx);

		//페이징 메뉴 생성
		String pageMenu = Paging.getPaging_Ainner(
				"a_list_detail.do?a_idx="+a_idx, nowPage, row_total, 
				PageUtil.Notice.BLOCKLIST, 
				PageUtil.Notice.BLOCKPAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);		
		return VIEW_PATH_ACADEMY + "academy_detail.jsp";
	}

	//학원 등록하기
	@RequestMapping("/a_academy_regi.do")
	public String academy_register(AcademyVO vo, Model model) {

		MultipartFile photo_l = vo.getL_photo();
		MultipartFile photo_s = vo.getS_photo();
		String s_filename = fileUtil.get_filename(photo_s);
		String l_filename = fileUtil.get_filename(photo_l);
		session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		int m_idx = member.getM_idx();

		vo.setA_image_l(l_filename);
		vo.setA_image_s(s_filename);
		vo.setM_idx(m_idx);

		academy_dao.insert(vo);
		return "redirect:a_list.do";
	}

	//학원 게시글 삭제
	@RequestMapping("/a_del.do")
	@ResponseBody
	public String delete(int a_idx) {
		AcademyVO baseVO = academy_dao.selectOne(a_idx);

		String resultStr = "";
		String result = "no";
		if( baseVO == null ) {
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
		int res = academy_dao.delete(a_idx);		//학원인덱스(a_idx)를 통해 DB의 튜플 삭제
		if( res == 1 ) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}

	//학원 게시글 수정 폼으로 이동
	@RequestMapping("a_modify_form.do")
	public String move_modify_form(int a_idx){
		AcademyVO vo = academy_dao.selectOne(a_idx);

		String content = vo.getA_content().replaceAll("<br>", "\n");
		vo.setA_content(content);

		request.setAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_modify_form.jsp";
	}

	//학원 게시글 수정하기
	@RequestMapping("/a_academy_modify.do")
	public String academy_modify(AcademyVO vo, Model model) {

		//업로드 된 파일의 정보
		MultipartFile photo_l = vo.getL_photo();
		MultipartFile photo_s = vo.getS_photo();
		String s_filename = fileUtil.get_filename(photo_s);
		String l_filename = fileUtil.get_filename(photo_l);
		vo.setA_image_l(l_filename);
		vo.setA_image_s(s_filename);

		int res = academy_dao.modify(vo);
		System.out.println(res);
		return "redirect:a_list.do";
	}

	//학원 리스트 전체 조회
	@RequestMapping("/a_list.do")
	public String show_list( Model model, Integer page) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list", list);
		}
		int nowPage = 1;//기본페이지

		if( page != null ) {
			nowPage = page;
		}

		int start = (nowPage -1 ) * PageUtil.Academy.BLOCKLIST + 1;
		int end = start + PageUtil.Academy.BLOCKLIST - 1; 

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		//게시글 전체목록 가져오기
		List<AcademyVO> list = null;       
		list = academy_dao.selectList(map);

		//전체게시물 수 구하기
		int row_total = academy_dao.getRowTotal();

		//페이징 메뉴 생성
		String pageMenu = Paging.getPaging(
				"a_list.do", nowPage, row_total, 
				PageUtil.Academy.BLOCKLIST, 
				PageUtil.Academy.BLOCKPAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return PageUtil.Academy.VIEW_PATH + "academy_list.jsp"; 
	}

	//필터를 통한 학원 리스트 조회
	@RequestMapping("/a_listfilter.do")
	public String list_filter(Model model, Integer page, FilterVO vo) {
		int list_cnt = academy_dao.selectList_cnt();
		if(list_cnt >= 5) {
			List<AcademyVO> list = academy_dao.selectList_random();
			model.addAttribute("rec_list", list);
		}
		//파라미터로 받은 값을 DB에서 like를 통해 검색할 문자열 형태로 변경
		//지역별
		if(vo.getF_city().equals("c_every")) {
			vo.setF_addr("%");
		}
		else if(vo.getF_region().equals("r_every")) {
			vo.setF_addr("%" + vo.getF_city() + "%");
		}
		else {
			vo.setF_addr("%" + vo.getF_city() + " " + vo.getF_region() + "%");
		}
		//카테고리별
		if(vo.getF_area().equals("a_every")) {
			vo.setF_area("%");
		}
		else {
			vo.setF_area("%" + vo.getF_area() + "%");
		}
		//키워드별
		if(vo.getF_keyword().equals("") || vo.getF_keyword() == null) {
			vo.setF_keyword("%");
		}
		else {
			vo.setF_keyword("%" + vo.getF_keyword() + "%");
		}

		int nowPage = 1;//기본페이지	
		//페이징 처리
		if( page != null ) {
			nowPage = page;
		}
		int start = (nowPage -1 ) * PageUtil.Academy.BLOCKLIST + 1;
		int end = start + PageUtil.Academy.BLOCKLIST - 1; 
		vo.setStart(start);
		vo.setEnd(end);

		//게시글 전체목록 가져오기
		List<AcademyVO> list = null;       
		list = academy_dao.selectList(vo);
		System.out.println("리스트 크기" + list.size());
		//전체게시물 수 구하기
		int row_total = academy_dao.getRowTotal(vo);
		System.out.println(row_total);      

		String url = "a_listfilter.do";
		String pageMenu = Paging.getPaging_filter(
				url, nowPage, row_total, 
				PageUtil.Academy.BLOCKLIST, 
				PageUtil.Academy.BLOCKPAGE, vo);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return PageUtil.Academy.VIEW_PATH + "academy_list.jsp"; 
	} 	   	     	


	//주소 찾기 폼으로 이동
	@RequestMapping("/a_addr_form.do")
	public String move_addr_form(){
		return PageUtil.Academy.VIEW_PATH + "academy_addr_form.jsp";
	}

	//나의 학원목록 가져오기
	@RequestMapping("get_myacademy.do")
	public String get_myacademy(int m_idx){
		List<AcademyVO> list = null;       
		list = academy_dao.selectList(m_idx);
		request.setAttribute("myacademy_list", list);
		return "/WEB-INF/views/mypage/mypage_academy.jsp";
	}

}
