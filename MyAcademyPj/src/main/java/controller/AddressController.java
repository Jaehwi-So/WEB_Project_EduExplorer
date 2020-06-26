package controller;



import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import dao.AddressDAO;
import vo.AddressVO;

@Controller
public class AddressController {
	public static final String VIEW_PATH = "/WEB-INF/views/academy_list/";
	@Autowired
	HttpServletRequest request;
	@Autowired 
	ServletContext application;
	@Autowired
	HttpSession session;
	AddressDAO address_dao;
	
	public void setAddress_dao(AddressDAO address_dao) {
		this.address_dao = address_dao;
	}

	//주소를 받음
	@RequestMapping("a_city_search.com")
	@ResponseBody
	public List<AddressVO> city_search(){
		List<AddressVO> list = address_dao.selectList_city();
		return list;
	}
	
	//주소를 받음
	@RequestMapping("a_region_search.com")
	@ResponseBody
	public List<AddressVO> region_search(@RequestParam String addr_city){
		if(addr_city.equals("c_every")) {
			return null;
		}
		else {
			List<AddressVO> list = address_dao.selectList_region(addr_city);
			return list;
		}
	}
}
