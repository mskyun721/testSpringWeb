package com.test.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dto.CalDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.WeekWrkHisDTO;
import com.test.service.HomeService;
import com.test.service.WeeklyBoardService;

import sun.security.ec.ECDSAOperations.Seed;

@Controller
@RequestMapping("/weeklyBoard/*")
public class WeeklyBoardController {
	Calendar cal = Calendar.getInstance();
	@Inject
	private WeeklyBoardService weeklyService;
	@Inject
	private HomeService homeService;
	
	@RequestMapping("weeklyBoard")
	public String weeklyBoard(CalDTO calDto, Model model,HttpSession session) {
		Map<String, Object> calMap = weeklyService.weeklyCal(calDto);
		WeekWrkHisDTO weeklyDTO = new WeekWrkHisDTO();
		weeklyDTO.setVIEWTYPE(session.getAttribute("VIEWTYPE").toString());
		weeklyDTO.setUSERID(session.getAttribute("USERID").toString());
		weeklyDTO.setSTWEEKDAY(calMap.get("yearMonth").toString());
		List<WeekWrkHisDTO> weeklyList = weeklyService.weeklyList(weeklyDTO);
		model.addAttribute("month", calMap.get("month"));
		model.addAttribute("year",calMap.get("year"));
		model.addAttribute("monday", calMap.get("monday"));
		model.addAttribute("friday", calMap.get("friday"));
		model.addAttribute("week", calMap.get("week"));
		model.addAttribute("weeklyList",weeklyList);
		
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
