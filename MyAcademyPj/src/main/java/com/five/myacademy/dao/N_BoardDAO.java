package com.five.myacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.N_BoardVO;

public interface N_BoardDAO{
	
	public void setSqlsession(SqlSession sqlsession);
	//전체 목록 보기
	public List<N_BoardVO> selectList();
	//게시물 쓰기
	public int insert(N_BoardVO vo);
	//게시글 한 건 상세보기
	public N_BoardVO selectOne(int idx);
	//조회수 증가
	public int update_readhit(int idx);
	//기준글의 step값 증가시키기
	public int update_step(N_BoardVO baseVO);
	//댓글위치 설정
	public int reply(N_BoardVO vo);
	//삭제를 위한 게시글 정보 얻어오기
	public N_BoardVO selectOne(int idx, String pwd);
	//게시글 삭제
	public int delete(int n_idx);
	//페이징을 포함한 게시글 목록 출력
	public List<N_BoardVO> selectList(Map<String, Integer> map);
	
	public int getRowTotal();
		
}
