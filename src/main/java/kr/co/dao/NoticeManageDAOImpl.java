package kr.co.dao;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.SearchCriteria;

@Repository
public class NoticeManageDAOImpl implements NoticeManageDAO{

	@Inject
	private SqlSession sqlSession;
	
	//공지사항 등록
	public void noticeWrite(Map<String, Object> map) throws Exception{
		sqlSession.insert("noticeManageMapper.insert", map);
	}
	
	// 공지사항 목록 조회
	@Override
	public List<Map<String, Object>> noticeList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeManageMapper.list", scri);
	}

	// 메뉴 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("noticeManageMapper.listCount", scri);
	}
	
	// 메뉴 목록 조회
	@Override
	public List<Map<String, Object>> menuList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeManageMapper.menuList");
	}

	// 공지사항 수정뷰
	public Map<String, Object> noticeUpdateView(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectOne("noticeManageMapper.updateView", map);
	}
	
	
	// 공지사항 수정
	@Override
	public void noticeUpdate(Map<String, Object> map) throws Exception {
		sqlSession.update("noticeManageMapper.update", map);
	}
	
	// 공지사항 삭제
	@Override
	public void noticeDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("noticeManageMapper.delete", map);
	}

	@Override
	public List<Map<String, Object>> selectNoticeList(int menuCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeManageMapper.selectList", menuCode);
	}
	
	
}
