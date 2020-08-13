package com.test.controller;

import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.support.DaoSupport;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dao.HomeDAO;
import com.test.dto.CalDTO;
import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, CalDTO calDto,HttpSession session) {
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
		String USERID = (String) session.getAttribute("USERID");
		
		String[][] day = homeService.dayOfWeek(year,month);
		model.addAttribute("day", day);
		model.addAttribute("year",year);
		model.addAttribute("month",month+1);
		model.addAttribute("USERID",USERID);
		
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
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUserGet(Model model) {
		List<UserMstInfoDTO> userList;
		userList=homeService.selectUser();
		model.addAttribute("userList",userList);
		
		return "addUser";
	}
	
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String addUserPost(UserMstInfoDTO umiDTO,Model model) {
		homeService.insertUser(umiDTO);
		return "redirect:addUser";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model,UserMstInfoDTO umiDTO) {
		
		return "login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(Model model,UserMstInfoDTO umiDTO,HttpSession session) {
		boolean result =  homeService.loginCheck(umiDTO,session);
		if (result) {
			return "redirect:/";
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value="/corpManage", method=RequestMethod.GET)
	public String corpManage()	
	{
		return "corpManage";
	}
	
	@RequestMapping(value="/corpManageForm", method=RequestMethod.GET)
	public String corpManageForm()	
	{
		return "corpManageForm";
	}
	
	@RequestMapping(value="/insertCst", method=RequestMethod.POST)
	public String insertCst(CstMstInfoDTO cmiDTO)	
	{
		homeService.insertCst(cmiDTO);
		System.out.println(cmiDTO.getCSTNM());
		return "corpManageForm";
	}
	
	
	
	
}
