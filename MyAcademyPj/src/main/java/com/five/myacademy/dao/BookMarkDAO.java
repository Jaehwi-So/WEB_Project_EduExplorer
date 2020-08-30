package com.five.myacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.BookMarkVO;

public interface BookMarkDAO {

	public void setSqlSession(SqlSession sqlSession);
	public BookMarkVO selectOne( BookMarkVO vo);
	public BookMarkVO selectOne(int m_idx, int a_idx);
	public int insert( BookMarkVO vo );
	
	public List<BookMarkVO> selectList(int m_idx);
	
	public int delete(BookMarkVO vo);
}
