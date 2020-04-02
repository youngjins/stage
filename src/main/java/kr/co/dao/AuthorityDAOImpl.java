package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.AuthorityVO;
import kr.co.vo.SearchCriteria;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(AuthorityVO authorityVO) throws Exception {
		sqlSession.insert("AuthorityMapper.insert", authorityVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("AuthorityMapper.listPage", scri);

	}
	
	// 게시물 메뉴 조회
	@Override
	public List<Map<String, Object>> menuList() throws Exception {
	
		return sqlSession.selectList("AuthorityMapper.menuList");

	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AuthorityMapper.listCount", scri);
	}

	@Override
	public void update(AuthorityVO authorityVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("AuthorityMapper.update", authorityVO);
		
	}
}
