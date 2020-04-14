package kr.co.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.vo.MemberVO;


public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		sessionList.add(session);
		logger.info("접속 : {}", session.getId());
		logger.info("map : {}", map);
		
		for(WebSocketSession sess : sessionList){
			sess.sendMessage(new TextMessage(((Map)map.get("member")).get("userId") +"님입장"));
		}
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		
		logger.info("sesionId : "+ map.get("HTTP.SESSION.ID"));
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
        for(WebSocketSession sess : sessionList){
        	logger.info("dddddddd : {}"+sess);
        	logger.info("dddddddd2 : {}"+session);
            sess.sendMessage(new TextMessage(((Map)map.get("member")).get("userId") +" : "+ message.getPayload()));
        }
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("퇴장 : {}", session.getId());
	}
	
	
}