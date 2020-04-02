package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.AuthorityVO;
import kr.co.vo.SearchCriteria;

public interface AuthorityDAO {
	public void write(AuthorityVO authorityVO) throws Exception;
	
	public void update(AuthorityVO authorityVO) throws Exception;
	
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception;
	
	public List<Map<String, Object>> menuList() throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
