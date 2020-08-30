package com.five.myacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.AddressVO;

public interface AddressDAO {

	public void setSqlSession(SqlSession sqlSession);
	//시/도 목록 가져오기
	public List<AddressVO> selectList_city();
	//시/도에 따른 군/구 목록 가져오기
	public List<AddressVO> selectList_region(String city);
}
