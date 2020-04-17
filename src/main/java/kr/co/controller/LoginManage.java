package kr.co.controller;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginManage implements HttpSessionBindingListener {
	private static final Logger logger = LoggerFactory.getLogger(LoginManage.class);
	private static LoginManage loginManage = null;
	
	private static Hashtable<Object, Object> loginUsers = new Hashtable<>();
	
	//싱글톤 패턴
	public static synchronized LoginManage getInstance() {
		
		if(loginManage == null) {
			loginManage = new LoginManage();
		}
		
		return loginManage;
	}
	
	// 세션이 연결됬을시 호출 (hashtable 접속자 저장) 
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		loginUsers.put(event.getSession(), event.getName());
		logger.info(event.getName() + "님이 로그인 하셨습니다.");
		logger.info("현재 접속자 수 : "+loginUsers.size());
		
	}

	// 세션이 끊겼을시 호출
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		loginUsers.remove(event.getSession());
		logger.info(event.getName() + "님이 로그아웃 하셨습니다.");
		logger.info("현재 접속자 수 : "+loginUsers.size());
	}
	
	// 입력받은 아이디를 해시테이블에서 삭제
	public void removeSession(String userId) {
		Enumeration<Object> e = loginUsers.keys();
		HttpSession session = null;
		
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
            if(loginUsers.get(session).equals(userId)){
                //세션이 invalidate될때 HttpSessionBindingListener를 
                //구현하는 클레스의 valueUnbound()함수가 호출된다.
                session.invalidate();
            }
		}
	}
	
    public boolean isUsing(String userId){
        return loginUsers.containsValue(userId);
    }
    
    public void setSession(HttpSession session, String userId){
        //이순간에 Session Binding이벤트가 일어나는 시점
        //name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는 Object)
        session.setAttribute(userId, this);//login에 자기자신을 집어넣는다.
    }
    
    public String getUserID(HttpSession session){
        return (String)loginUsers.get(session);
    }
    
	// 현재 접속중인 모든 사용자 리스트 리턴..
	public Collection<Object> getUsers() {

		Collection<Object> collection = loginUsers.values();
		return collection;
	}
	
	// 현재 접속중인 모든 사용자 아이디 출력
	public void loginUsersPrint() {
		Enumeration<Object> e = loginUsers.keys();
		HttpSession session = null;
		logger.info("=========================================");
		int i = 0;
		while(e.hasMoreElements()) {
			session = (HttpSession) e.nextElement();
			logger.info((++i)+"접속자 : {}", loginUsers.get(session));
		}
		logger.info("=========================================");
	}
		
}