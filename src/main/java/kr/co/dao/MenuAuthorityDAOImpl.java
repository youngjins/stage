package kr.co.dao;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MenuAuthorityDAOImpl implements MenuAuthorityDAO{

	@Inject
	private SqlSession sqlSession;

	// 사용자 그룹 리스트
	@Override
	public List<Map<String, Object>> groupList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("menuAuthorityMapper.groupNameList");
	}
	
	// 사용자 권한 리스트
	@Override
	public List<Map<String, Object>> authorityList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("menuAuthorityMapper.menuAuthorityList", map);
	}

	@Override
	public void authorityAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectList("menuAuthorityMapper.menuAuthorityAdd", map);
	}

	@Override
	public void authorityDel(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectList("menuAuthorityMapper.menuAuthorityDel", map);
	}






	
	
}
