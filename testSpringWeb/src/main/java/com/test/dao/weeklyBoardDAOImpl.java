package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.WeeklyReportDTO;

@Repository
public class weeklyBoardDAOImpl implements weeklyBoardDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.test.mappers.weeklyboardMapper";
	
	@Override
	public void insertBoard(WeeklyReportDTO wrDTO) {
		sqlSession.insert(Namespace+".insertBoard", wrDTO);
	}
	@Override
	public List<WeeklyReportDTO> weeklyList(WeeklyReportDTO weeklyDTO) {
		if (weeklyDTO.getENDWEEK() == null) {
			weeklyDTO.setENDWEEK("");
		}
		if (weeklyDTO.getUSERNM() == null) {
			weeklyDTO.setUSERNM("");
		}
		return sqlSession.selectList(Namespace+".weeklyList",weeklyDTO);
		
	}
}
