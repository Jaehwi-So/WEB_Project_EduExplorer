package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import vo.AddressVO;

public class AddressDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<AddressVO> selectList_city(){
		List<AddressVO> list = null;
		list = sqlSession.selectList("addr_mapper.city_list");
		return list;
	}
	public List<AddressVO> selectList_region(String city){
		List<AddressVO> list = null;
		list = sqlSession.selectList("addr_mapper.region_list", city);
		return list;
	}
}
