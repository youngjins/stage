package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.AuthorityDAO;
import kr.co.vo.AuthorityVO;
import kr.co.vo.SearchCriteria;

@Service
public class AuthorityServiceImpl implements AuthorityService{

	@Inject
	private AuthorityDAO dao;
	
	@Override
	public void write(AuthorityVO authorityVO) throws Exception {
		dao.write(authorityVO);
	}
	
	@Override
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}
	
	@Override
	public List<Map<String, Object>> menuList() throws Exception {
		// TODO Auto-generated method stub
		return dao.menuList();
	}

	@Override
	public void update(AuthorityVO authorityVO) throws Exception {
		// TODO Auto-generated method stub
		dao.update(authorityVO);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

}
