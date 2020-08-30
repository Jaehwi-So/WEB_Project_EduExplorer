package com.five.myacademy.dao;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.AcademyNoticeVO;

public interface AcademyNoticeDAO {
	
	public void setSqlSession(SqlSession sqlSession);	
	//학원내 게시판 전체 보여주기
	public List<AcademyNoticeVO> selectList( Map<String, Integer> map )	;
	// 학원 내 게시물 수 구하기
	public int getRowTotal(int a_idx);
	//학원내 게시판 게시글 보기
	public AcademyNoticeVO selectOne( int a_notice_idx );	
	//게시글 작성하기
	public int insert( AcademyNoticeVO vo );
	//게시글 삭제(된 것 처럼 업데이트)
	public int delete( int a_notice_idx );	
	//게시글 수정
	public int modify(AcademyNoticeVO vo);
	
	
}
