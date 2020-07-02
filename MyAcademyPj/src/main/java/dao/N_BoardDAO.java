package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.F_BoardVO;
import vo.N_BoardVO;

public class N_BoardDAO{
	
	SqlSession sqlsession;
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//전체 목록 보기
	public List<N_BoardVO> selectList(){
		List<N_BoardVO> n_list = null;
		n_list = sqlsession.selectList("n.n_board_list");
		return n_list;
	}
	
	//게시물 쓰기
	public int insert(N_BoardVO vo){
		
		System.out.println(vo.getN_name());
		System.out.println(vo.getN_pwd());
		System.out.println(vo.getN_subject());
		System.out.println(vo.getN_pwd());
		System.out.println(vo.getN_content());
		System.out.println(vo.getN_ip());
		
		int res = sqlsession.insert("n.n_board_insert",vo);
		return res;

	}
	
	//게시글 한 건 상세보기
	public N_BoardVO selectOne(int idx) {
		N_BoardVO resVO = null;
		resVO = sqlsession.selectOne("n.n_board_one", idx);
		return resVO;
	}
	
	//조회수 증가
	public int update_readhit(int idx) {
		int res = sqlsession.update("n.n_board_update_readhit", idx);
		return res;
	}
	
	//기준글의 step값 증가시키기
	public int update_step(N_BoardVO baseVO) {
		int res = sqlsession.update("n.n_board_update_step", baseVO);
		return res;

	}
	
	//댓글위치 설정
	public int reply(N_BoardVO vo) {
		int res = sqlsession.update("n.n_board_reply", vo);
		return res;

	}
	
	
	//삭제를 위한 게시글 정보 얻어오기
	public N_BoardVO selectOne(int idx, String pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("pwd", pwd);
		N_BoardVO vo =sqlsession.selectOne("n.n_board_idx_pwd", map);
		return vo;
	}
	
	//게시글 삭제
	public int delete(int n_idx) {
		int res = sqlsession.delete("n.n_board_delete", n_idx);
		return res;
	}
	
	//페이징을 포함한 게시글 목록 출력
	public List<N_BoardVO> selectList(Map<String, Integer> map){
		List<N_BoardVO> n_list = sqlsession.selectList("n.n_board_list_paging", map);
		return n_list;
	}
	
	public int getRowTotal() {
		int count = sqlsession.selectOne("n.n_board_count");
		return count;
	}
		


}
