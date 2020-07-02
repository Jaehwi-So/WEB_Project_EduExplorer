package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.AcademyVO;
import vo.FilterVO;

public class AcademyDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체게시물 조회
	public List<AcademyVO> selectList() {
		List<AcademyVO> list = null;
		list = sqlSession.selectList("a_mapper.academy_list");
		return list;
	}

	public AcademyVO selectOne(int a_idx) {
		AcademyVO vo = null;
		vo = sqlSession.selectOne("a_mapper.academy_one", a_idx);
		return vo;
	}

	// 학원 등록
	public int insert(AcademyVO vo) {
		int cnt = sqlSession.insert("a_mapper.academy_insert", vo);
		return cnt;
	}

	// 학원 삭제
	public int delete(int idx) {
		int res = sqlSession.delete("a_mapper.academy_delete", idx);
		return res;
	}

	// 학원 수정
	public int modify(AcademyVO vo) {
		int res = sqlSession.update("a_mapper.academy_modify", vo);
		return res;
	}

	// 페이징을 포함한 게시글 목록 출력
	public List<AcademyVO> selectList(Map<String, Integer> map) {
		List<AcademyVO> list = sqlSession.selectList("a_mapper.academy_list_paging", map);
		return list;
	}
	
	// 페이징과 필터 포함한 게시글 목록 출력
	public List<AcademyVO> selectList(FilterVO vo) {
		List<AcademyVO> list = sqlSession.selectList("a_mapper.academy_list_filter", vo);
		return list;
	}

	// 전체 게시물 수 구하기
	public int getRowTotal() {
		int count = sqlSession.selectOne("a_mapper.academy_count");
		return count;
	}
	
	// 필터 포함한 전체 게시물 수 구하기
	public int getRowTotal(FilterVO vo) {
		int count = sqlSession.selectOne("a_mapper.academy_count_filter", vo);
		return count;
	}
	// (분야별)페이징과 필터 포함한 게시글 목록 출력
	public List<AcademyVO> selectList_area(FilterVO vo) {
		List<AcademyVO> list = sqlSession.selectList("a_mapper.academy_list_filter_area", vo);
		return list;
	}

	// (분야별) 필터 포함한 전체 게시물 수 구하기
	public int getRowTotal_area(FilterVO vo) {
		int count = sqlSession.selectOne("a_mapper.academy_count_filter_area", vo);
		return count;
	}

}