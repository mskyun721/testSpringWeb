package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.test.mappers.homeMapper";
	
	@Override
	public void insertUser(UserMstInfoDTO umiDTO) {
		sqlSession.insert(Namespace+".insertUser", umiDTO);
	}
	@Override
	public List<UserMstInfoDTO> selectUser() {
		return sqlSession.selectList(Namespace+".selectUser");
	}
	@Override
	public void delUser(UserMstInfoDTO umiDTO) {
		sqlSession.delete(Namespace+".delUser",umiDTO);
	}
	@Override
	public UserMstInfoDTO loginCheck(UserMstInfoDTO umiDTO) {
		return sqlSession.selectOne(Namespace+".loginCheck", umiDTO);
		
	}
	@Override
	public void insertCst(CstMstInfoDTO cmiDTO) {
		sqlSession.insert(Namespace+".insertCst",cmiDTO);
		
	}
	@Override
	public List<CstMstInfoDTO> corpList(CstMstInfoDTO cmiDTO) {
		return sqlSession.selectList(Namespace+".corpList",cmiDTO);
	}
	@Override
	public void delCorp(CstMstInfoDTO cmiDTO) {
		sqlSession.delete(Namespace+".delCorp",cmiDTO);
	}
	@Override
	public CstMstInfoDTO selectOneCST(CstMstInfoDTO cmiDTO) {
		return sqlSession.selectOne(Namespace+".selectOneCST",cmiDTO);
	}

}
