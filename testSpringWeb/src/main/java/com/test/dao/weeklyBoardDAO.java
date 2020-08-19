package com.test.dao;

import java.util.List;

import com.test.dto.CalDTO;
import com.test.dto.WeekWrkHisDTO;

public interface weeklyBoardDAO {

	void insertBoard(WeekWrkHisDTO wrDTO);

	List<WeekWrkHisDTO> weeklyList(WeekWrkHisDTO weeklyDTO);

	void delBoard(WeekWrkHisDTO wrDTO);

}
