package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.AuthorityVO;
import kr.co.vo.SearchCriteria;


public interface AuthorityService {
	
	// 작성
	public void write(AuthorityVO authorityVO) throws Exception;
	
	public void update(AuthorityVO authorityVO) throws Exception;
	
	// 게시물 목록 조회
	public List<Map<String, Object>> list(SearchCriteria scri) throws Exception;
	
	// 게시물 메뉴 조회
	public List<Map<String, Object>> menuList() throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
