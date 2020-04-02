package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.MenuVO;

public interface MenuDAO {
	public void delete(MenuVO menuVO) throws Exception;
	
	public void insert(MenuVO menuVO) throws Exception;
	
	public void update(MenuVO menuVO) throws Exception;
	
	public List<Map<String, Object>> list() throws Exception;

	public List<Map<String, Object>> upList() throws Exception;
}
