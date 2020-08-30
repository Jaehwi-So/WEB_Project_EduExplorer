package com.five.myacademy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.BookMarkVO;

public class BookMarkDAOImpl implements BookMarkDAO{
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public BookMarkVO selectOne( BookMarkVO vo) {
		BookMarkVO resVO = sqlSession.selectOne("b.bookmark_one", vo);
		return resVO;
	}
	public BookMarkVO selectOne(int m_idx, int a_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_idx", m_idx);
		map.put("a_idx", a_idx);
		BookMarkVO resVO = sqlSession.selectOne("b.bookmark_ck", map);
		return resVO;
	}
	
	public int insert( BookMarkVO vo ) {
		int res = sqlSession.insert("b.bookmark_insert", vo);	
		return res;	
	}
	
	public List<BookMarkVO> selectList(int m_idx){
		List<BookMarkVO> list = sqlSession.selectList("b.bookmark_list", m_idx);
		return list;
	}
	
	public int delete(BookMarkVO vo) {
		int res = sqlSession.delete("b.bookmark_delete", vo);
		return res;
	}
}
