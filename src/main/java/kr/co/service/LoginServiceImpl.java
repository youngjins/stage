package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.LoginDAO;
import kr.co.vo.AdminVO;

@Service
public class LoginServiceImpl implements LoginService{
	@Inject LoginDAO dao;
	
	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		return dao.login(vo);
	}
}
