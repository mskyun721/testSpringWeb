package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.UserScheduleDTO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.test.mappers.homeMapper";
	
//	user ------------------------------------------------------
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
	public UserMstInfoDTO oneUser(UserMstInfoDTO umiDTO) {
		return sqlSession.selectOne(Namespace+".oneUser",umiDTO);
	}
	@Override
	public UserMstInfoDTO login(UserMstInfoDTO umiDTO) {
		return sqlSession.selectOne(Namespace+".login",umiDTO);
	}
//	user ------------------------------------------------------
	
	@Override
	public void insertSchedule(UserScheduleDTO usDTO) {
		sqlSession.insert(Namespace+".insertSch",usDTO);
	}
	@Override
	public List<UserScheduleDTO> schList(UserScheduleDTO usDto) {
		return sqlSession.selectList(Namespace+".selectSch", usDto);
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
