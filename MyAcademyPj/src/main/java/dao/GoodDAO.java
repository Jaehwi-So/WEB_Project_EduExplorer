package dao;

import org.apache.ibatis.session.SqlSession;

import vo.GoodVO;

public class GoodDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public GoodVO selectOne(String m_id) {
		GoodVO resVO = sqlSession.selectOne("g.good_check", m_id );
		return resVO;
	}
	
	public int insert(GoodVO vo) {
		int res = sqlSession.insert("g.good_insert", vo);
		return res;
	}
	
	
	public int delete(String m_id) {
		int res = sqlSession.delete("g.good_delete", m_id);
		return res;
	}
	
	public int selectJoin(int a_idx) {
		int join_num = sqlSession.selectOne("g.good_join", a_idx);
		return join_num;
	}
	
	
}
