package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.NoticeManageDAO;
import kr.co.vo.SearchCriteria;

@Service
public class NoticeManageServiceImpl implements NoticeManageService {
	
	@Inject
	private NoticeManageDAO noticeManageDAO;
	
	// 공지사항 작성
	public void noticeWrite(Map<String, Object> map) throws Exception{
		noticeManageDAO.noticeWrite(map);
	}
	
	// 공지사항 목록 조회
	public List<Map<String, Object>> noticeList(SearchCriteria scri) throws Exception {
		
		return noticeManageDAO.noticeList(scri);
	}

	// 메뉴 목록 조회
	@Override
	public List<Map<String, Object>> menuList() throws Exception {
		// TODO Auto-generated method stub
		return noticeManageDAO.menuList();
	}
	
	// 메뉴 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return noticeManageDAO.listCount(scri);
	}

	// 공지사항 수정
	@Override
	public Map<String, Object> noticeUpdateView(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return noticeManageDAO.noticeUpdateView(map);
	}

	// 공지사항 수정
	@Override
	public void noticeUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeManageDAO.noticeUpdate(map);
	}

	// 공지사항 삭제
	@Override
	public void noticeDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		noticeManageDAO.noticeDelete(map);
	}

	@Override
	public List<Map<String, Object>> selectNoticeList(int menuCode) throws Exception {
		// TODO Auto-generated method stub
		return noticeManageDAO.selectNoticeList(menuCode);
	}
	
	// 메뉴별 공지사항 조회
	
}
