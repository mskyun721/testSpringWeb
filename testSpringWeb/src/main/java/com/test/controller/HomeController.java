package com.test.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dao.HomeService;
import com.test.dto.CalDTO;

import sun.java2d.pipe.SpanShapeRenderer.Simple;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, CalDTO calDto) {
		Calendar cal = Calendar.getInstance();
		int year;
		int month;
		if (calDto.getYear() == 0) {
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);
		}else {
			year = calDto.getYear();
			month = calDto.getMonth()-1;
		}
		
		String[][] day = homeService.dayOfWeek(year,month);
		model.addAttribute("day", day);
		model.addAttribute("year",year);
		model.addAttribute("month",month+1);
		
		return "index";
	}
	
	/*
	 * @RequestMapping("searchCal") public String searchCal(Model model) { int year
	 * = calDto.getYear(); int month = calDto.getMonth()-1; String[][] day =
	 * homeService.dayOfWeek(year,month); model.addAttribute("day", day);
	 * 
	 * return "index"; }
	 */
	
	@RequestMapping(value = "/scheduleForm", method = RequestMethod.GET)
	public String scheduleForm(CalDTO calDto, Model model) {
		SimpleDateFormat foramt = new SimpleDateFormat("yyyy-MM-dd");
		int year = calDto.getYear();
		int month = calDto.getMonth();
		int day = calDto.getDay();
		String date = year+"-"+month+"-"+day;
		if (month<10) {
			date = year+"-0"+month+"-"+day;
		}
		if (day<10) {
			date = year+"-0"+month+"-0"+day;
		}
		model.addAttribute("date", date);
		
		return "scheduleForm";
	}
	
	
}
