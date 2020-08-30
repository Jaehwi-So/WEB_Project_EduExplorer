package com.five.myacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.Member_LogVO;


public class Member_LogDAOImpl implements Member_LogDAO{
	SqlSession sqlsession;
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	public int insert(Member_LogVO vo) {
		int res = sqlsession.insert("m_log.log_insert", vo);
		return res;
	}
	public List<Member_LogVO> select_replyF_log(int m_idx) {
		List<Member_LogVO> list = sqlsession.selectList("m_log.log_select_reply", m_idx);
		return list;
	}

	public int check_log(int log_idx) {
		int res = sqlsession.update("m_log.log_check", log_idx);
		return res;
	}
}
