package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

	// 나의 전체 학원목록 조회
	public List<AcademyVO> selectList(int m_idx) {
		List<AcademyVO> list = null;
		list = sqlSession.selectList("a_mapper.academy_mylist", m_idx);
		return list;
	}

	// a_idx를 통해 m_idx 얻어내기
	public int selectM_idx(int a_idx) {
		int m_idx = sqlSession.selectOne("a_mapper.academy_get_m", a_idx);
		return m_idx;
	}

	//추천학원 랜덤으로 띄우는 로직
	public List<AcademyVO> selectList_random(){

		List<Integer> list = new ArrayList<Integer>();
		List<AcademyVO> list2 = new ArrayList<AcademyVO>();

		list = sqlSession.selectList("a_idx_list");

		int[] arr = new int[5];


		for(int i = 0; i < 5; i++) {
			Random rnd = new Random();

			arr[i] = rnd.nextInt(list.size());
			for(int j = 0; j < i; j++){
				if(arr[i] == arr[j]){
					i--; 
					break; 
				}
			}

		}

		//중복되지않는 5칸짜리 배열에 list의 랜덤 인덱스 5개를 넣엇음

		for(int i = 0; i < 5; i++) {
			int random_list = list.get(arr[i]);
			AcademyVO vo = new AcademyVO();
			vo = sqlSession.selectOne("a_idx_list_one",random_list);
			list2.add(vo);
		}


		return list2;
	}

	//게시물 갯수가져오기
	public int selectList_cnt() {
		int count = sqlSession.selectOne("a_mapper.academy_count");
		return count;
	}


}