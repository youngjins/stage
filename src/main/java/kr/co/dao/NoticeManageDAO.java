package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.SearchCriteria;

public interface NoticeManageDAO {
	
	// 공지사항 등록
	public void noticeWrite(Map<String, Object> map) throws Exception;
	
	// 공지사항 목록 조회
	public List<Map<String, Object>> noticeList(SearchCriteria scri) throws Exception;
	
	// 메뉴 목록 조회
	public List<Map<String, Object>> menuList() throws Exception;
	
	// 메뉴 카운트
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 공지사항 수정뷰
	public Map<String, Object> noticeUpdateView(Map<String, Object> map) throws Exception;

	// 공지사항 수정
	public void noticeUpdate(Map<String, Object> map) throws Exception;
	
	// 공지사항 삭제
	public void noticeDelete(Map<String, Object> map) throws Exception;
	
	// 메뉴별 공지사항 조회
	public List<Map<String, Object>> selectNoticeList(int menuCode) throws Exception;
}
