package com.five.myacademy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.F_BoardVO;

public class F_BoardDAOImpl implements F_BoardDAO{

	SqlSession sqlsession;

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 전체 목록 보기
	public List<F_BoardVO> selectList() {
		List<F_BoardVO> f_list = null;
		f_list = sqlsession.selectList("f.f_board_list");
		return f_list;
	}

	// 게시물 쓰기
	public int insert(F_BoardVO vo) {


		int res = sqlsession.insert("f.f_board_insert", vo);
		return res;

	}

	// 게시글 한 건 상세보기
	public F_BoardVO selectOne(int idx) {
		F_BoardVO resVO = null;
		resVO = sqlsession.selectOne("f.f_board_one", idx);
		return resVO;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		int res = sqlsession.update("f.f_board_update_readhit", idx);
		return res;
	}

	// 기준글의 step값 증가시키기
	public int update_step(F_BoardVO baseVO) {
		int res = sqlsession.update("f.f_board_update_step", baseVO);
		return res;

	}

	// 댓글위치 설정
	public int reply(F_BoardVO vo) {
		int res = sqlsession.update("f.f_board_reply", vo);
		return res;

	}

	// 삭제를 위한 게시글 정보 얻어오기
	public F_BoardVO selectOne(int f_idx, String f_pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_idx", f_idx);
		map.put("f_pwd", f_pwd);
		F_BoardVO vo = sqlsession.selectOne("f.f_board_idx_pwd", map);
		return vo;
	}

	// 게시글 삭제
	public int del_update(F_BoardVO baseVO) {
		int res = sqlsession.update("f.f_board_del_update", baseVO);
		return res;
	}
	
	// 페이징을 포함한 게시글 목록 출력
	public List<F_BoardVO> selectList(Map<String, Integer> map) {
		List<F_BoardVO> f_list = sqlsession.selectList("f.f_board_list_paging", map);
		return f_list;
	}

	public int getRowTotal() {
		int count = sqlsession.selectOne("f.f_board_count");
		return count;
	}
	
	// 페이징을 포함한 나의 게시글 목록 출력
	public List<F_BoardVO> selectList_my(Map<String, Integer> map) {
		List<F_BoardVO> f_list = sqlsession.selectList("f.f_board_list_paging_my", map);
		return f_list;
	}
	
	public int getRowTotal_my(int m_idx) {
		int count = sqlsession.selectOne("f.f_board_count_my", m_idx);
		return count;
	}
	
	// 페이징을 포함한 내가 댓글단 게시글 목록 출력
	public List<F_BoardVO> selectList_myreply(Map<String, Integer> map) {
		List<F_BoardVO> f_list = sqlsession.selectList("f.f_board_list_paging_myreply", map);
		return f_list;
	}
	
	public int getRowTotal_myreply(int m_idx) {
		int count = sqlsession.selectOne("f.f_board_count_myreply", m_idx);
		return count;
	}
	
	// 페이징을 포함한 키워드 검색 게시물 출력
	public List<F_BoardVO> selectList_keyword(Map<String, Object> map) {
		List<F_BoardVO> f_list = sqlsession.selectList("f.f_board_list_paging_keyword", map);
		return f_list;
	}
	
	public int getRowTotal_keyword(String keyword) {
		int count = sqlsession.selectOne("f.f_board_count_keyword", keyword);
		return count;
	}
	
	//수정
	public int modify(F_BoardVO vo) {
		int res = sqlsession.update("f.f_board_modify", vo);
		return res;
	}
}
