package com.five.myacademy.dao;


import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.MemberVO;


public class MemberDAOImpl implements MemberDAO{
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//로그인을 위한 받아온id에대한 회원의 정보한건 조회
	public MemberVO selectOne(String id) {
		MemberVO vo = sqlSession.selectOne("m.member_one", id);
		return vo;
	}
	
	//회원가입을 위한 정보
	public int insert(MemberVO vo) {
		int res = sqlSession.insert("m.member_insert", vo);
		return res;
	}
	
	//회원정보 변경
	public int update(MemberVO vo) {
		int res = sqlSession.update("m.member_update", vo);
		return res;
	}
	
	public int delete(int m_idx) {
		int res = sqlSession.delete("m.member_delete", m_idx);
		return res;
	}
	
}
