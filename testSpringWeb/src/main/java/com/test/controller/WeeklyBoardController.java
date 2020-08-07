package com.test.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/weeklyBoard/*")
public class WeeklyBoardController {

	@RequestMapping("weeklyBoard")
	public String weeklyBoard(Locale locale, Model model) {
		
		return "weeklyBoard/weeklyBoard";
	}
	
	@RequestMapping("weeklyBoardList")
	public String weeklyBoardList(Locale locale, Model model) {
		
		return "weeklyBoard/weeklyBoardList";
	}
	
}
