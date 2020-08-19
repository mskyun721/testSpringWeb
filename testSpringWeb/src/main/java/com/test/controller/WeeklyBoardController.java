package com.test.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dto.CalDTO;
import com.test.dto.WeekWrkHisDTO;
import com.test.service.WeeklyBoardService;

@Controller
@RequestMapping("/weeklyBoard/*")
public class WeeklyBoardController {
	Calendar cal = Calendar.getInstance();
	@Inject
	private WeeklyBoardService weeklyService;
	
	@RequestMapping("weeklyBoard")
	public String weeklyBoard(CalDTO calDto, Model model,HttpSession session) {
		int year;
		int month;
		if (calDto.getYear() == 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
		}else {
			year = calDto.getYear();
			month = calDto.getMonth();
		}
		
		int day = cal.get(Calendar.DATE);
		int dateMonth = cal.get(Calendar.MONTH)+1;
		String date = cal.get(Calendar.YEAR)+"-"+dateMonth+"-"+day;
		String weekly = year+"-"+month;
		if (dateMonth<10) {
			date = cal.get(Calendar.YEAR)+"-0"+dateMonth+"-"+day;
			weekly = year+"-0"+month;
		}
		if (day<10) {
			date = cal.get(Calendar.YEAR)+"-"+dateMonth+"-0"+day;
		}
		
		
//		WeekWrkHisDTO weeklyDTO = new WeekWrkHisDTO();
//		weeklyDTO.setSTWEEKDAY(weekly);
//		List<WeekWrkHisDTO> weeklyList = weeklyService.weeklyList(weeklyDTO);
		model.addAttribute("month", month);
		model.addAttribute("year",year);
		model.addAttribute("date", date);
//		model.addAttribute("weeklyList",weeklyList);
		
		
		return "weeklyBoard/weeklyBoard";
	}
	
	@RequestMapping(value="insertBoard", method=RequestMethod.POST)
	public String insertBoard(WeekWrkHisDTO wrDTO) {
		String path="";
		weeklyService.insertBoard(wrDTO);
		
		path="redirect:weeklyBoard";
		return path;
	}
	
	@RequestMapping(value="delBoard", method=RequestMethod.GET)
	public String delBoard(WeekWrkHisDTO wrDTO) {
		String path="";
		weeklyService.delBoard(wrDTO);
		
		path="redirect:weeklyBoard";
		return path;
	}
	
	@RequestMapping("weeklyBoardList")
	public String weeklyBoardList(Locale locale, Model model) {
		
		return "weeklyBoard/weeklyBoardList";
	}
	
}
