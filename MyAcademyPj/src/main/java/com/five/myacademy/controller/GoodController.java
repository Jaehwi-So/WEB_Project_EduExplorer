package com.five.myacademy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.myacademy.dao.GoodDAO;
import com.five.myacademy.vo.GoodVO;

@Controller
public class GoodController {
	@Autowired
	HttpServletRequest request;
	
	private GoodDAO good_dao;

	public void setGood_dao(GoodDAO good_dao) {
		this.good_dao = good_dao;
	}

	public static final String VIEW_PATH = "/WEB-INF/views/academy_list/";
	
	//좋아요 수 조회하기
	@RequestMapping("good_insert.do")
	@ResponseBody
	public String good(GoodVO vo ,Model model) {
		System.out.println(vo.getA_idx());
		System.out.println(vo.getM_id());

		String str = "yes";
		//좋아요가 되있는지 조회 m_id,a_idx 활용
		GoodVO res_vo = good_dao.selectOne(vo.getM_id(), vo.getA_idx());

		if( res_vo != null ) {	//좋아요 취소
			str = "no";
			good_dao.delete(vo);
			int good_num = good_dao.selectJoin(vo.getA_idx()); // a_idx에 해당하는 m_id갯수를 불러온다
			String resultStr = String.format("[{'param' : '%s' , 'good_num' : '%d'}]", str ,good_num);
			return resultStr;
		}
		// 좋아요
		int res_insert = good_dao.insert(vo);		
		int good_num = good_dao.selectJoin(vo.getA_idx()); // a_idx에 해당하는 m_id갯수를 불러온다
		String resultStr = String.format("[{'param' : '%s' , 'good_num' : '%d'}]", str ,good_num);
		return resultStr;
	}
}























