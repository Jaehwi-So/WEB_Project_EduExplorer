package com.five.myacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.five.myacademy.vo.AcademyVO;
import com.five.myacademy.vo.FilterVO;

public interface AcademyDAO {

	public void setSqlSession(SqlSession sqlSession);
	public List<AcademyVO> selectList();
	public AcademyVO selectOne(int a_idx); 
	// 학원 등록
	public int insert(AcademyVO vo);
	// 학원 삭제
	public int delete(int idx);
	// 학원 수정
	public int modify(AcademyVO vo);
	// 페이징을 포함한 게시글 목록 출력
	public List<AcademyVO> selectList(Map<String, Integer> map);
	// 페이징과 필터 포함한 게시글 목록 출력
	public List<AcademyVO> selectList(FilterVO vo);
	// 전체 게시물 수 구하기
	public int getRowTotal();
	// 필터 포함한 전체 게시물 수 구하기
	public int getRowTotal(FilterVO vo);
	// (분야별)페이징과 필터 포함한 게시글 목록 출력
	public List<AcademyVO> selectList_area(FilterVO vo);
	// (분야별) 필터 포함한 전체 게시물 수 구하기
	public int getRowTotal_area(FilterVO vo);
	// 나의 전체 학원목록 조회
	public List<AcademyVO> selectList(int m_idx);
	// a_idx를 통해 m_idx 얻어내기
	public int selectM_idx(int a_idx);
	//추천학원 랜덤으로 띄우는 로직
	public List<AcademyVO> selectList_random();
	//게시물 갯수가져오기
	public int selectList_cnt();


}