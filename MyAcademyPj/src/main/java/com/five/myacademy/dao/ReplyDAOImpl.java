package com.five.myacademy.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO{
	
	SqlSession sqlsession;
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//전체목록보기
	public List<ReplyVO> selectList(int r_board){
		List<ReplyVO> r_list = null;
		r_list = sqlsession.selectList("r.reply_list", r_board);
		return r_list;
	}
	
	//게시물 쓰기
	public int insert(ReplyVO vo){	

		int res = sqlsession.insert("r.reply_insert",vo);
		return res;
	}
	
	//삭제
	public int delete(int r_idx) {
		int res = sqlsession.delete("r.reply_delete", r_idx);
		return res;
	}
	

}
