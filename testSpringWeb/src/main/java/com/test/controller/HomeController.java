package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	Calendar cal = Calendar.getInstance();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, CalDTO calDto,HttpSession session){
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
	public String scheduleForm(CalDTO calDto, Model model){
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
	public String loginCheck(Model model,UserMstInfoDTO umiDTO,HttpSession session,HttpServletResponse response){
		boolean result =  homeService.loginCheck(umiDTO,session);
		if (result) {
			return "redirect:/";
		}else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디, 패스워드를 확인하세요.')");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "login";
		}
	}
	
	@RequestMapping(value="/corpManage", method=RequestMethod.GET)
	public String corpManage(Model model,CstMstInfoDTO cmiDTO){
		List<CstMstInfoDTO> corpList;
		corpList = homeService.corpList(cmiDTO);
		model.addAttribute("corpList",corpList);
		
		return "corpManage";
	}
	
	@RequestMapping(value="/corpManageForm", method=RequestMethod.GET)
	public String corpManageForm(Model model,CstMstInfoDTO cmiDTO){
		if (cmiDTO.getCSTCD() != "") {
			CstMstInfoDTO OneCST = homeService.selectOneCST(cmiDTO);
			model.addAttribute("OneCST",OneCST);
		}
		return "corpManageForm";
	}
	
	@RequestMapping(value="/insertCst", method=RequestMethod.POST)
	public String insertCst(CstMstInfoDTO cmiDTO,HttpServletResponse response){
		homeService.insertCst(cmiDTO);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.opener.location.reload();");
			out.println("window.close();");
			out.println("</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "corpManageForm";
	}
	
	
	
	
}
