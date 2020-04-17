package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.AdminVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	@Inject SqlSession sql;
	
	@Override
	public AdminVO login(AdminVO vo) throws Exception{
		return sql.selectOne("LoginMapper.login", vo);
	}
}
