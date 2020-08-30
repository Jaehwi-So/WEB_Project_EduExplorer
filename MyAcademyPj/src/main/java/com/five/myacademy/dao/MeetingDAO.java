package com.five.myacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.MeetingVO;

public interface MeetingDAO {

	public void setSqlSession(SqlSession sqlSession);
	// 전체게시물 조회
	public List<MeetingVO> selectList(Map<String, Integer> map);
	public int getRowTotal(int a_idx);
	// 문의글 작성하기
	public int insert(MeetingVO vo);
	// 학원내 게시판 게시글 보기
	public MeetingVO selectOne(int meeting_idx);
	public int selectSeq();
	// 게시글 수정
	public int modify(MeetingVO vo);

}
