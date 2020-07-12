package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.AcademyNoticeVO;




public class AcademyNoticeDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//학원내 게시판 전체 보여주기
	public List<AcademyNoticeVO> selectList( int a_idx ) {
		List<AcademyNoticeVO> list = null;
		list = sqlSession.selectList("an_mapper.a_notice_list", a_idx);
		return list;	
	}
	
	//학원내 게시판 게시글 보기
	public AcademyNoticeVO selectOne( int a_notice_idx ) {
		AcademyNoticeVO vo = null;
		vo = sqlSession.selectOne("an_mapper.a_notice_one", a_notice_idx);
		return vo;
	}
	
	//게시글 작성하기
	public int insert( AcademyNoticeVO vo ) {	
		int cnt = sqlSession.insert("an_mapper.a_notice_insert", vo);
		return cnt;
	}
	
	//게시글 삭제(된 것 처럼 업데이트)
	public int delete( int a_notice_idx ) {
		int res = sqlSession.delete("an_mapper.a_notice_del", a_notice_idx);
		return res;
	}
	
	//게시글 수정
	public int modify(AcademyNoticeVO vo) {
		int res = sqlSession.update("an_mapper.a_notice_modify", vo);
		return res;
	}
	
	
}
