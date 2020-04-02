package kr.co.controller;

import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.service.NoticeManageService;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
public class NoticeManageController {
	@Inject
	NoticeManageService noticeService;
	
	// 공지사항 목록 조회
	@RequestMapping(value="/noticeManage/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{

		model.addAttribute("LIST", noticeService.noticeList(scri));
		model.addAttribute("MENU_LIST", noticeService.menuList());
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/noticeManage/noticeList";
	}

	// 공지사항 등록
	@RequestMapping(value="/noticeManage/noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(@RequestParam Map<String, Object> map) throws Exception {
		
		noticeService.noticeWrite(map);
		
		return "redirect:/noticeManage/noticeList";
	}
	
	
	// 공지사항 수정
	@RequestMapping(value="/noticeManage/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(@RequestParam Map<String, Object> map) throws Exception {
		
		noticeService.noticeUpdate(map);
		return "redirect:/noticeManage/noticeList";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/noticeManage/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam Map<String, Object> map) throws Exception {
		
		noticeService.noticeDelete(map);
		return "redirect:/noticeManage/noticeList";
	}
}












