package kr.co.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.AuthorityService;
import kr.co.vo.AuthorityVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;


@Controller
public class AuthorityController {
	private static final Logger logger = LoggerFactory.getLogger(AuthorityController.class);
	@Inject
	AuthorityService Service;
	
	// 작성
	@RequestMapping(value = "/AuthorityManage/write", method = RequestMethod.POST)
	public String write(AuthorityVO authorityVO) throws Exception {
		logger.info("write");
		authorityVO.setAUTH_WRITER("관리자");
		Service.write(authorityVO);
		return "redirect:/AuthorityManage/AuthorityList";
	}
	
	@RequestMapping(value = "/AuthorityManage/update", method = RequestMethod.POST)
	public String update(AuthorityVO authorityVO) throws Exception {
		logger.info("update");
		
		authorityVO.setAUTH_MFWRITER("수정자");
		Service.update(authorityVO);
		
		return "redirect:/AuthorityManage/AuthorityList";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/AuthorityManage/AuthorityList", method = RequestMethod.GET)
	public String list(Model model, HttpSession session, SearchCriteria scri) throws Exception{
		logger.info("list");
		logger.info("menuList");
		
		model.addAttribute("list", Service.list(scri));
		model.addAttribute("menuList", Service.menuList());
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(Service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/AuthorityManage/AuthorityList";
		
	}
	
}