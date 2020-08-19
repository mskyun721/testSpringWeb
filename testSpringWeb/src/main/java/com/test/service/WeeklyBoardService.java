package com.test.service;

import java.util.List;

import com.test.dto.WeekWrkHisDTO;

public interface WeeklyBoardService {

	void insertBoard(WeekWrkHisDTO wrDTO);

	List<WeekWrkHisDTO> weeklyList(WeekWrkHisDTO weeklyDTO);

	void delBoard(WeekWrkHisDTO wrDTO);

}
