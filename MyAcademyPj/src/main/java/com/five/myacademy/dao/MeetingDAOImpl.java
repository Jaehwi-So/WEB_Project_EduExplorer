package com.five.myacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.MeetingVO;

public class MeetingDAOImpl implements MeetingDAO{

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체게시물 조회
	public List<MeetingVO> selectList(Map<String, Integer> map) {
		//a_idx, start, end
		List<MeetingVO> list = null;
		list = sqlSession.selectList("m_mapper.meeting_list", map);
		return list;
	}
	public int getRowTotal(int a_idx) {
		int count = sqlSession.selectOne("m_mapper.meeting_count", a_idx);
		return count;
	}

	// 문의글 작성하기
	public int insert(MeetingVO vo) {
		int cnt = sqlSession.insert("m_mapper.meeting_insert", vo);
		return cnt;
	}

	// 학원내 게시판 게시글 보기
	public MeetingVO selectOne(int meeting_idx) {
		MeetingVO vo = null;
		vo = sqlSession.selectOne("m_mapper.meeting_one", meeting_idx);
		return vo;
	}
	
	public int selectSeq() {
		int seq = sqlSession.selectOne("m_mapper.select_seq");
		return seq;
	}

	// 게시글 수정
	public int modify(MeetingVO vo) {
		int res = sqlSession.update("m_mapper.meeting_modify", vo);
		return res;
	}

}
