package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.MenuService;
import kr.co.vo.MenuVO;

@Controller
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	@Inject
	MenuService Service;
	
	@RequestMapping(value = "/MenuManage/delete", method = RequestMethod.POST)
	public String delete(MenuVO menuVO) throws Exception{
		logger.info("delete");
		
		Service.delete(menuVO);
		return "redirect:/MenuManage/MenuList";
	}
	
	@RequestMapping(value = "/MenuManage/insert", method = RequestMethod.POST)
	public String insert(MenuVO menuVO) throws Exception{
		logger.info("insert");
		
		Service.insert(menuVO);
		return "redirect:/MenuManage/MenuList";
	}
	
	@RequestMapping(value = "/MenuManage/update", method = RequestMethod.POST)
	public String update(MenuVO menuVO) throws Exception{
		logger.info("update");
		
		Service.update(menuVO);
		return "redirect:/MenuManage/MenuList";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/MenuManage/MenuList", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("upList", Service.upList());
		model.addAttribute("list", Service.list());
		
		return "/MenuManage/MenuList";
		
	}
}
