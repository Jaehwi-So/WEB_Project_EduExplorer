package com.five.myacademy.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.five.myacademy.vo.Member_LogVO;


public interface Member_LogDAO {
	public void setSqlsession(SqlSession sqlsession);
	
	public int insert(Member_LogVO vo);
	public List<Member_LogVO> select_replyF_log(int m_idx);
	public int check_log(int log_idx);
}
