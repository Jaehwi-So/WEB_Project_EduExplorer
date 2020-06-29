package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BookMarkVO;

public class BookMarkDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public BookMarkVO selectOne( BookMarkVO vo) {
		
		BookMarkVO resVO = sqlSession.selectOne("b.bookmark_one", vo);
	
		
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
}
