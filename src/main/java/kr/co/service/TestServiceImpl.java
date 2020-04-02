package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.TestDAO;
import kr.co.util.FileUtils;
import kr.co.vo.SearchCriteria;
import kr.co.vo.testVO;

@Service
public class TestServiceImpl implements TestService {

	@Inject
	private TestDAO dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 게시글 작성
	@Override
	public void write(testVO testVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(testVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(testVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}
	
	// 게시물 목록 조회
	@Override
	public List<testVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public testVO read(int bno) throws Exception {
			dao.boardHit(bno);
		return dao.read(bno);
	}
	
	// 게시물 수정
	@Override
	public void update(testVO testVO) throws Exception {

		dao.update(testVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	
	@Override
	public void update(testVO testVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.update(testVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(testVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW") != null && tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

}
