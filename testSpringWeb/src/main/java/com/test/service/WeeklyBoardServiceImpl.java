package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.weeklyBoardDAO;
import com.test.dto.CalDTO;
import com.test.dto.WeeklyReportDTO;

@Service
public class WeeklyBoardServiceImpl implements WeeklyBoardService {
	@Inject
	private weeklyBoardDAO weeklyDAO;
	
	@Override
	public void insertBoard(WeeklyReportDTO wrDTO) {
		weeklyDAO.insertBoard(wrDTO);
	}
	@Override
	public List<WeeklyReportDTO> weeklyList(WeeklyReportDTO weeklyDTO) {
		return weeklyDAO.weeklyList(weeklyDTO);
	}
}
