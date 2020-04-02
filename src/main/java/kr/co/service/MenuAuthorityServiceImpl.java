package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.dao.MenuAuthorityDAO;

@Service
public class MenuAuthorityServiceImpl implements MenuAuthorityService {
	
	@Inject
	private MenuAuthorityDAO menuAuthorityDAO;

	// 사용자 그룹 리스트
	@Override
	public List<Map<String, Object>> groupList() throws Exception {
		
		return menuAuthorityDAO.groupList();
	}

	// 사용자 권한 리스트
	@Override
	public List<Map<String, Object>> authorityList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return menuAuthorityDAO.authorityList(map);
	}
	
	// 사용자 권한 추가 삭제
	@Override
	public void authorityAdd(Map<String, Object> map, String[] insertMenuCode, String[] deleteMenuCode) throws Exception {
		//권한 추가
		List<Map<String, Object>> authorityList =  menuAuthorityDAO.authorityList(map);
		Map<String, Object> insertMap = new HashMap<String, Object>();
		for(int i=0; i<insertMenuCode.length; i++) {
			
			for(int j=0; j<authorityList.size(); j++) {
				if(authorityList.get(j).get("GROUP_NO") == null && authorityList.get(j).get("MENU_CODE").toString().equals(insertMenuCode[i])) {
					insertMap.put("GROUP_NO", map.get("GROUP_NO"));
					insertMap.put("MENU_CODE", insertMenuCode[i]);
					insertMap.put("MENU_NAME", authorityList.get(j).get("MENU_NAME"));
					menuAuthorityDAO.authorityAdd(insertMap);
				}
			}
		}
		
		// 권한 삭제
		Map<String, Object> deleteMap = new HashMap<String, Object>();
		for(int i=0; i<deleteMenuCode.length; i++) {
			
			for(int j=0; j<authorityList.size(); j++) {
				if(authorityList.get(j).get("GROUP_NO") != null && authorityList.get(j).get("MENU_CODE").toString().equals(deleteMenuCode[i])) {
					deleteMap.put("GROUP_NO", map.get("GROUP_NO"));
					deleteMap.put("MENU_CODE", deleteMenuCode[i]);
					menuAuthorityDAO.authorityDel(deleteMap);
				}
			}
		}
	}
	
}


















