package com.five.myacademy.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.ReplyVO;

public interface ReplyDAO {

	public void setSqlsession(SqlSession sqlsession);
	//전체목록보기
	public List<ReplyVO> selectList(int r_board);
	//게시물 쓰기
	public int insert(ReplyVO vo);
	//삭제
	public int delete(int r_idx);
	
}
