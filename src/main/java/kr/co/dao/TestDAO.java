package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.SearchCriteria;
import kr.co.vo.testVO;

public interface TestDAO {

	// 게시글 작성
	public void write(testVO testVO) throws Exception;
	
	// 게시물 목록 조회
	public List<testVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public testVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(testVO testVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
	// 게시판 조회수
	public void boardHit(int bno) throws Exception;
}
