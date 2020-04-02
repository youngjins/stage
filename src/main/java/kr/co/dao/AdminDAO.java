package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.AdminVO;
import kr.co.vo.SearchCriteria;

public interface AdminDAO {
	public void write(AdminVO adminVO) throws Exception;
	
	public void update(AdminVO adminVO) throws Exception;
	
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception;
	
	public List<Map<String, Object>> menuList() throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
