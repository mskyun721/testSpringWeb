package com.test.dao;

import java.util.List;

import com.test.dto.CalDTO;
import com.test.dto.WeeklyReportDTO;

public interface weeklyBoardDAO {

	void insertBoard(WeeklyReportDTO wrDTO);

	List<WeeklyReportDTO> weeklyList(WeeklyReportDTO weeklyDTO);

}
