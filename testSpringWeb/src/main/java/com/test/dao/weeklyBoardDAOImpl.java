package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.WeekWrkHisDTO;

@Repository
public class weeklyBoardDAOImpl implements weeklyBoardDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.test.mappers.weeklyboardMapper";
	
	@Override
	public void insertBoard(WeekWrkHisDTO wrDTO) {
		sqlSession.insert(Namespace+".insertBoard", wrDTO);
	}
	@Override
	public List<WeekWrkHisDTO> weeklyList(WeekWrkHisDTO wrDTO) {
		if (wrDTO.getYEARWEEK()==null) {
			wrDTO.setYEARWEEK("");
		}
		if (wrDTO.getUSERID()==null) {
			wrDTO.setUSERID("");
		}
		return sqlSession.selectList(Namespace+".weeklyList",wrDTO);
		
	}
	@Override
	public void delBoard(WeekWrkHisDTO wrDTO) {
		sqlSession.delete(Namespace+".delBoard", wrDTO);
	}
}
