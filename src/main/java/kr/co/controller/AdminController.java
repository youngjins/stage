package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.AdminService;
import kr.co.vo.AdminVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Inject
	AdminService Service;
	
	// 작성
	@RequestMapping(value = "/AdminManage/write", method = RequestMethod.POST)
	public String write(AdminVO adminVO) throws Exception {
		logger.info("write");
		adminVO.setADMIN_WRITER("관리자");
		Service.write(adminVO);
		return "redirect:/AdminManage/AdminList";
	}
	
	@RequestMapping(value = "/AdminManage/update", method = RequestMethod.POST)
	public String update(AdminVO adminVO) throws Exception {
		logger.info("update");
		
		adminVO.setADMIN_MFWRITER("수정자");
		Service.update(adminVO);
		
		return "redirect:/AdminManage/AdminList";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/AdminManage/AdminList", method = RequestMethod.GET)
	public String list(Model model, SearchCriteria scri) throws Exception{
		logger.info("list");
		logger.info("menuList");
		
		model.addAttribute("list", Service.list(scri));
		model.addAttribute("menuList", Service.menuList());
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(Service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/AdminManage/AdminList";
		
	}
}
