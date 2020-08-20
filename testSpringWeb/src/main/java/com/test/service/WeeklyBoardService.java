package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.dto.CalDTO;
import com.test.dto.WeekWrkHisDTO;

public interface WeeklyBoardService {

	void insertBoard(WeekWrkHisDTO wrDTO);

	List<WeekWrkHisDTO> weeklyList(WeekWrkHisDTO weeklyDTO);

	void delBoard(WeekWrkHisDTO wrDTO);

	Map<String, Object> weeklyCal(CalDTO calDto);

}
