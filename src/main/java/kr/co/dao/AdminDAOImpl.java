package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.AdminVO;
import kr.co.vo.SearchCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(AdminVO adminVO) throws Exception {
		sqlSession.insert("AdminMapper.insert", adminVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("AdminMapper.adminListPage", scri);

	}
	
	// 게시물 메뉴 조회
	@Override
	public List<Map<String, Object>> menuList() throws Exception {
	
		return sqlSession.selectList("AdminMapper.AuthorityList");

	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("AdminMapper.listCount", scri);
	}

	@Override
	public void update(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("AdminMapper.update", adminVO);
		
	}

}
