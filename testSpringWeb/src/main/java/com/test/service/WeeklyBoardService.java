package com.test.service;

import java.util.List;

import com.test.dto.WeeklyReportDTO;

public interface WeeklyBoardService {

	void insertBoard(WeeklyReportDTO wrDTO);

	List<WeeklyReportDTO> weeklyList(WeeklyReportDTO weeklyDTO);

}
