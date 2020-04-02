package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MenuDAO;
import kr.co.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Inject
	private MenuDAO dao;
	
	@Override
	public void delete(MenuVO menuVO) throws Exception {
		dao.delete(menuVO);
	}
	
	@Override
	public void insert(MenuVO menuVO) throws Exception {
		dao.insert(menuVO);
	}
	
	@Override
	public void update(MenuVO menuVO) throws Exception {
		dao.update(menuVO);
	}
	
	@Override
	public List<Map<String, Object>> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public List<Map<String, Object>> upList() throws Exception {
		return dao.upList();
	}
}
