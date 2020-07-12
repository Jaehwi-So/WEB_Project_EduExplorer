package dao;

import org.apache.ibatis.session.SqlSession;

import vo.GoodVO;

public class GoodDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public GoodVO selectOne(GoodVO vo) {
		GoodVO resVO = sqlSession.selectOne("g.good_check", vo );
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
