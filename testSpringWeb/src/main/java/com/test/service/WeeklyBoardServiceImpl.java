package com.test.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.weeklyBoardDAO;
import com.test.dto.CalDTO;
import com.test.dto.WeekWrkHisDTO;

@Service
public class WeeklyBoardServiceImpl implements WeeklyBoardService {
	@Inject
	private weeklyBoardDAO weeklyDAO;
	Calendar cal = Calendar.getInstance();
	
	@Override
	public Map<String, Object> weeklyCal(CalDTO calDto) {
		Map<String, Object> calMap = new HashMap<String, Object>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		int year, month,day;
		
		if (calDto.getYear() == 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
		}else {
			year = calDto.getYear();
			month = calDto.getMonth();
		}
		if (calDto.getDay() == 0) {
			day = cal.get(Calendar.DATE);
		}else {
			day = calDto.getDay();
		}
		
		String yearMonth;
		if (month<10) {
			yearMonth = year+"-0"+month;
		}else {
			yearMonth = year+"-"+month;
		}
		
		calMap.put("yearMonth", yearMonth);
		
		cal.set(year, month-1, day);
		int week = cal.get(Calendar.WEEK_OF_YEAR);
		
		calMap.put("year", year);
		calMap.put("month", month);
		calMap.put("week", week);
		
		cal.set(Calendar.YEAR,year);
		cal.set(Calendar.WEEK_OF_YEAR,week);
		cal.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
		String monday = format.format(cal.getTime());
		
		cal.set(Calendar.DAY_OF_WEEK,Calendar.FRIDAY);
		String friday = format.format(cal.getTime());
		
		calMap.put("monday", monday);
		calMap.put("friday", friday);
		
		return calMap;
	}
	
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
