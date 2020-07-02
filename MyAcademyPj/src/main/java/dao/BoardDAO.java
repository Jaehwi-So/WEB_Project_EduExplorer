package dao;

import java.util.List;
import java.util.Map;

import vo.N_BoardVO;

public interface BoardDAO {
	
	List<N_BoardVO> selectList();
	int insert(N_BoardVO vo);
	public Object selectOne(int idx);
	public int update_readhit(int idx);
	public int update_step(N_BoardVO baseVO);
	
	public N_BoardVO selectOne(int idx, String pwd);
	public int del_update(N_BoardVO baseVO);
	public List<N_BoardVO> selectList(Map<String, Integer> map);
	public int getRowTotal();
	

}
