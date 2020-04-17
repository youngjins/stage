package kr.co.dao;

import kr.co.vo.AdminVO;

public interface LoginDAO {
	public AdminVO login(AdminVO vo) throws Exception;
}
