package com.five.myacademy.dao;


import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.MemberVO;


public interface MemberDAO {

	public void setSqlSession(SqlSession sqlSession);
	//로그인을 위한 받아온id에대한 회원의 정보한건 조회
	public MemberVO selectOne(String id);
	//회원가입을 위한 정보
	public int insert(MemberVO vo);
	//회원정보 변경
	public int update(MemberVO vo);
	public int delete(int m_idx);
	
}
