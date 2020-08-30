package com.five.myacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.F_BoardVO;

public interface F_BoardDAO {

	public void setSqlsession(SqlSession sqlsession);

	// 전체 목록 보기
	public List<F_BoardVO> selectList();

	// 게시물 쓰기
	public int insert(F_BoardVO vo);

	// 게시글 한 건 상세보기
	public F_BoardVO selectOne(int idx);
	// 조회수 증가
	public int update_readhit(int idx);

	// 기준글의 step값 증가시키기
	public int update_step(F_BoardVO baseVO);
	

	// 댓글위치 설정
	public int reply(F_BoardVO vo);

	// 삭제를 위한 게시글 정보 얻어오기
	public F_BoardVO selectOne(int f_idx, String f_pwd);

	// 게시글 삭제
	public int del_update(F_BoardVO baseVO);
	
	// 페이징을 포함한 게시글 목록 출력
	public List<F_BoardVO> selectList(Map<String, Integer> map);

	public int getRowTotal();
	
	// 페이징을 포함한 나의 게시글 목록 출력
	public List<F_BoardVO> selectList_my(Map<String, Integer> map);
	
	public int getRowTotal_my(int m_idx);
	
	// 페이징을 포함한 내가 댓글단 게시글 목록 출력
	public List<F_BoardVO> selectList_myreply(Map<String, Integer> map);
	
	public int getRowTotal_myreply(int m_idx);
	
	// 페이징을 포함한 키워드 검색 게시물 출력
	public List<F_BoardVO> selectList_keyword(Map<String, Object> map);
	
	public int getRowTotal_keyword(String keyword);
	
	//수정
	public int modify(F_BoardVO vo);
}
