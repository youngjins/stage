package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.LoginService;
import kr.co.vo.AdminVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	LoginService service;
	
	@RequestMapping(value = "/LoginPage/login", method= RequestMethod.GET)
	public String list(AdminVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("list");
		
		return "/LoginPage/login";
	}
	
	
	@RequestMapping(value = "/LoginPage/LoginSend", method= RequestMethod.POST)
	public String send(AdminVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("list");
		
		AdminVO login = service.login(vo);
		
		if(login != null) {
			if(vo.getADMIN_PWD() == login.getADMIN_PWD()) {
				session.setAttribute("member", login);
				return "redirect:/AuthorityManage/AuthorityList";
			}else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
				return "redirect:/LoginPage/login";
			}
		}else {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/LoginPage/login";
		}
	}
}
