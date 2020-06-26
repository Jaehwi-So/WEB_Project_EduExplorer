package controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.AcademyDAO;
import util.PageUtil;
import util.Paging;
import vo.AcademyVO;
import vo.FilterVO;
import vo.MemberVO;
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
	
	AcademyDAO academy_dao;
	public void setAcademy_dao(AcademyDAO academy_dao) {
		this.academy_dao = academy_dao;
	}
	
	//절대경로 얻어오기
	public String get_filename(MultipartFile photo) {
		String filename = "no_file";
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		
		//업로드 한 파일이 실제로 존재한다면
		if(!photo.isEmpty()) {
			//업로드 된 파일명
			filename = photo.getOriginalFilename();
			
			//저장할 파일경로 지정
			File saveFile = new File(savePath, filename);
			if( !saveFile.exists() ) {
				saveFile.mkdirs();//없는 폴더 생성
			}else {
				//동일파일명 업로드 방지를 위해 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			
			try {
				//업로드된 파일은 MultipartResolver라는 클래스가 지정해둔 
				//임시저장소에 있는데, 임시저장소의 파일은 일정시간이 지나면 사라지기 때문에
				//내가 지정해준 savePath경로로 복사해준다.
				photo.transferTo(saveFile);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		}//if
		return filename;
	}
	
	//등록 폼으로 이동
	@RequestMapping("/a_move_form.com")
	public String move_form() {
		return VIEW_PATH_ACADEMY + "academy_regi_form.jsp";
	}

	//학원 클릭 시 세부사항 조회
	@RequestMapping("/a_list_detail.com")
	public String show_detail() {
		int a_idx = Integer.parseInt(request.getParameter("a_idx"));
		AcademyVO vo = academy_dao.selectOne(a_idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_detail.jsp";
	}
	
	//학원 등록하기
	@RequestMapping("/a_academy_regi.com")
	public String academy_register(AcademyVO vo, Model model) {

		//업로드 된 파일의 정보
		MultipartFile photo_l = vo.getL_photo();
		MultipartFile photo_s = vo.getS_photo();
		String s_filename = get_filename(photo_s);
		String l_filename = get_filename(photo_l);
		session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("user");
		int m_idx = member.getM_idx();
		String content = vo.getA_content().replaceAll("\n", "<br>");	//\n(엔터값)을 jsp의 <br>로 바꿈. 이렇게 생성하는 것이 수정시 유용하다.
		vo.setA_content(content);
		
		vo.setA_image_l(l_filename);
		vo.setA_image_s(s_filename);
		vo.setM_idx(m_idx);
		
		academy_dao.insert(vo);
		return "redirect:a_list.com";
	}
	
	//학원 게시글 삭제
	@RequestMapping("/a_del.com")
	@ResponseBody
	public String delete(int a_idx) {
		System.out.println("delete호출");
		//삭제하고자 하는 vo정보를 얻어온다
		AcademyVO baseVO = academy_dao.selectOne(a_idx);

		String resultStr = "";
		String result = "no";
		//해당 idx가 존재하지 않을 경우
		if( baseVO == null ) {
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
 
		//a_idx를 통해 DB의 튜플 삭제
		int res = academy_dao.delete(a_idx);
		if( res == 1 ) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}
	
	//학원 게시글 수정 폼으로 이동
	@RequestMapping("a_modify_form.com")
	public String move_modify_form(int a_idx){
		AcademyVO vo = academy_dao.selectOne(a_idx);
		request.setAttribute("vo", vo);
		return VIEW_PATH_ACADEMY + "academy_modify_form.jsp";
	}
	
	//학원 게시글 수정하기
	@RequestMapping("/a_academy_modify.com")
	public String academy_modify(AcademyVO vo, Model model) {
		
		//업로드 된 파일의 정보
		MultipartFile photo_l = vo.getL_photo();
		MultipartFile photo_s = vo.getS_photo();
		String s_filename = get_filename(photo_s);
		String l_filename = get_filename(photo_l);
		vo.setA_image_l(l_filename);
		vo.setA_image_s(s_filename);
		String content = vo.getA_content().replaceAll("\n", "<br>");
		vo.setA_content(content);
		
		int res = academy_dao.modify(vo);
		System.out.println(res);
		return "redirect:a_list.com";
	}
	
	//학원 리스트 전체 조회
	@RequestMapping("/a_list.com")
	public String show_list( Model model, Integer page) {
		int nowPage = 1;//기본페이지
	      
	    if( page != null ) {
	       nowPage = page;
	    }
	      
	    //한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
	    int start = (nowPage -1 ) * PageUtil.Academy.BLOCKLIST + 1;
	    int end = start + PageUtil.Academy.BLOCKLIST - 1; 
	      
	    Map<String, Integer> map = new HashMap<String, Integer>();
	    map.put("start", start);
	    map.put("end", end);
	      
	    //게시글 전체목록 가져오기
	    List<AcademyVO> list = null;       
	    list = academy_dao.selectList( map );
	      
	    //전체게시물 수 구하기
	    int row_total = academy_dao.getRowTotal();
	      
	    //하단 페이지 메뉴 생성하기
	    String pageMenu = Paging.getPaging(
	             "a_list.com", nowPage, row_total, 
	             PageUtil.Academy.BLOCKLIST, 
	             PageUtil.Academy.BLOCKPAGE);
	      
	    model.addAttribute("list", list);
	    model.addAttribute("pageMenu", pageMenu);
	      
	    //세션에 기록되어 있던 show정보를 지운다
	    request.getSession().removeAttribute("show");
	      
	    return PageUtil.Academy.VIEW_PATH + "academy_list.jsp"; 
	 }
	//필터를 통한 학원 리스트 조회
	@RequestMapping("/a_listfilter.com")
	public String list_filter(Model model, Integer page, FilterVO vo) {
		int nowPage = 1;//기본페이지
		//DB에서 like로 검색할 주소 설정
		if(vo.getF_city().equals("c_every")) {
			vo.setF_addr("%");
		}
		else if(vo.getF_region().equals("r_every")) {
			vo.setF_addr("%" + vo.getF_city() + "%");
		}
		else {
			vo.setF_addr("%" + vo.getF_city() + " " + vo.getF_region() + "%");
		}		
		//페이징 처리
		if( page != null ) {
		   nowPage = page;
		}
		//한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
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
		//하단 페이지 메뉴 생성하기
		String url = "a_listfilter.com";
		String pageMenu = Paging.getPaging_filter(
		         url, nowPage, row_total, 
		         PageUtil.Academy.BLOCKLIST, 
		         PageUtil.Academy.BLOCKPAGE, vo);
		      
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		      
		//세션에 기록되어 있던 show정보를 지운다
		request.getSession().removeAttribute("show");
		      
		return PageUtil.Academy.VIEW_PATH + "academy_list.jsp"; 
	} 	   	     	
	  
	
	//주소 찾기 폼으로 이동
	@RequestMapping("/a_addr_form.com")
	public String move_addr_form(){
		return PageUtil.Academy.VIEW_PATH + "academy_addr_form.jsp";
	}
	
	
}
