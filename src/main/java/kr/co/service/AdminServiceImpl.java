package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.AdminDAO;
import kr.co.vo.AdminVO;
import kr.co.vo.SearchCriteria;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public void write(AdminVO adminVO) throws Exception {
		dao.write(adminVO);
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
	public void update(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		dao.update(adminVO);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

}
