package kr.co.controller;

import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MenuAuthorityService;

@Controller
public class menuAuthorityController {
	@Inject
	MenuAuthorityService menuAuthorityService;
	
	// 사용자 목록, 권한 조회
	@RequestMapping(value="/menuAuthorityManage/menuAuthorityList", method = RequestMethod.GET)
	public String menuAuthorityList(@RequestParam Map<String, Object> map, Model model) throws Exception{
		model.addAttribute("groupList", menuAuthorityService.groupList());
		
		if(map.get("GROUP_NO")!="" && map.get("GROUP_NO")!=null) {
			model.addAttribute("authorityList", menuAuthorityService.authorityList(map));
		}
		return "/menuAuthorityManage/menuAuthorityList";
	}

	// 사용자 권한 적용
	@RequestMapping(value="/menuAuthorityManage/menuAuthoritySave", method = RequestMethod.POST)
	public String menuAuthoritySave(@RequestParam Map<String, Object> map, 
									@RequestParam(value="INSERT_MENU_CODE[]") String[] insertMenuCode,
									@RequestParam(value="DELETE_MENU_CODE[]") String[] deleteMenuCode,
									RedirectAttributes rttr,
									Model model) throws Exception{
		
		
		menuAuthorityService.authorityAdd(map, insertMenuCode, deleteMenuCode);
		rttr.addAttribute("GROUP_NO", map.get("GROUP_NO"));
		return "redirect:/menuAuthorityManage/menuAuthorityList";
	}
	
}












