package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.weeklyBoardDAO;
import com.test.dto.CalDTO;
import com.test.dto.WeekWrkHisDTO;

@Service
public class WeeklyBoardServiceImpl implements WeeklyBoardService {
	@Inject
	private weeklyBoardDAO weeklyDAO;
	
	@Override
	public void insertBoard(WeekWrkHisDTO wrDTO) {
		weeklyDAO.insertBoard(wrDTO);
	}
	@Override
	public List<WeekWrkHisDTO> weeklyList(WeekWrkHisDTO wrDTO) {
		return weeklyDAO.weeklyList(wrDTO);
	}
	@Override
	public void delBoard(WeekWrkHisDTO wrDTO) {
		weeklyDAO.delBoard(wrDTO);
		
	}
}
