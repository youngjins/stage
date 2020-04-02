package kr.co.dao;

import java.util.List;
import java.util.Map;

public interface MenuAuthorityDAO {
	
	// 사용자 그룹 리스트
	public List<Map<String, Object>> groupList() throws Exception;

	// 사용자 권한 리스트
	public List<Map<String, Object>> authorityList(Map<String, Object> map) throws Exception;
	
	// 사용자 권한 추가
	public void authorityAdd(Map<String, Object> map) throws Exception;
	
	// 사용자 권한 삭제
	public void authorityDel(Map<String, Object> map) throws Exception;
}
