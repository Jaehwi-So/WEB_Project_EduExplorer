package com.five.myacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.AddressVO;

public class AddressDAOImpl implements AddressDAO{

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//시/도 목록 가져오기
	public List<AddressVO> selectList_city(){
		List<AddressVO> list = null;
		list = sqlSession.selectList("addr_mapper.city_list");
		return list;
	}
	//시/도에 따른 군/구 목록 가져오기
	public List<AddressVO> selectList_region(String city){
		List<AddressVO> list = null;
		list = sqlSession.selectList("addr_mapper.region_list", city);
		return list;
	}
}
