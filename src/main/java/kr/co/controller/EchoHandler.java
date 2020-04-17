package kr.co.controller;

import java.io.IOException;
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
		
		/*for(WebSocketSession sess : sessionList){
			sess.sendMessage(new TextMessage(((Map)map.get("member")).get("userId") +"님입장"));
		}*/
		broadCast(((Map)map.get("member")).get("userId")+"님이 입장하셨습니다.");
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		broadCast(((Map)map.get("member")).get("userId") +" : "+ message.getPayload());
       /* for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(((Map)map.get("member")).get("userId") +" : "+ message.getPayload()));
        }*/
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*Map<String, Object> map = session.getAttributes();
		session.sendMessage(new TextMessage(((Map)map.get("member")).get("userId") +"님 퇴장"));*/
		Map<String, Object> map = session.getAttributes();
		sessionList.remove(session);
		logger.info("퇴장 : {}", session.getId());
		broadCast(((Map)map.get("member")).get("userId")+"님이 퇴장하셨습니다.");
	}
	
	private void broadCast(String message) throws Exception {
		
		for(WebSocketSession sess : sessionList) {
			
			if(sess.isOpen()) {
				sess.sendMessage(new TextMessage(message));
			}
		}
		
	}
	
	
}