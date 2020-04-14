package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat() throws Exception{
		logger.info("chat");
		return "/chat";
		
	}
}