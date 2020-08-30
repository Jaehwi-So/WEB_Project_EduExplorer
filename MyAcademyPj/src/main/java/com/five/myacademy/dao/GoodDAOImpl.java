package com.five.myacademy.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.GoodVO;

public class GoodDAOImpl implements GoodDAO{
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public GoodVO selectOne(String m_id, int a_idx) {
		Map<String, String> map = new HashMap<String, String>();
		String idx = "" + a_idx;
		map.put("m_id", m_id);
		map.put("a_idx", idx);
		GoodVO resVO = sqlSession.selectOne("g.good_check", map);
		return resVO;
	}
	
	public int insert(GoodVO vo) {
		int res = sqlSession.insert("g.good_insert", vo);
		return res;
	}
	
	
	public int delete(GoodVO vo) {
		int res = sqlSession.delete("g.good_delete", vo);
		return res;
	}
	
	public int selectJoin(int a_idx) {
		int join_num = sqlSession.selectOne("g.good_join", a_idx);
		return join_num;
	}
	
	
}
