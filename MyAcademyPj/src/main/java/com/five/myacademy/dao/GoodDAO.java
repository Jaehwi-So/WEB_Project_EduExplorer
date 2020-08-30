package com.five.myacademy.dao;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.GoodVO;

public interface GoodDAO {

	public void setSqlSession(SqlSession sqlSession);
	
	public GoodVO selectOne(String m_id, int a_idx);
	public int insert(GoodVO vo);
	public int delete(GoodVO vo);	
	public int selectJoin(int a_idx);
	
}
