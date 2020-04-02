package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void delete(MenuVO menuVO) throws Exception {
		sqlSession.delete("MenuMapper.delete", menuVO);
	}
	
	@Override
	public void insert(MenuVO menuVO) throws Exception {
		sqlSession.insert("MenuMapper.insert", menuVO);
	}
	
	@Override
	public void update(MenuVO menuVO) throws Exception {
		sqlSession.update("MenuMapper.update", menuVO);
	}
	
	@Override
	public List<Map<String, Object>> list() throws Exception {
		
		return sqlSession.selectList("MenuMapper.list");

	}
	
	@Override
	public List<Map<String, Object>> upList() throws Exception {
		
		return sqlSession.selectList("MenuMapper.upList");
	}
}
