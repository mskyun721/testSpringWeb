package com.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.WeekWrkHisDTO;
import com.test.service.HomeService;
import com.test.service.WeeklyBoardService;

@RestController
public class AjaxController {
	@Inject
	HomeService homeSercive;
	@Inject
	WeeklyBoardService weeklyService;
	
	/*
	 * @RequestMapping("/searchYear") public ResponseEntity<String[][]>
	 * searchYear(CalDTO calDto){ ResponseEntity<String[][]> result = null; Calendar
	 * cal = Calendar.getInstance(); String[][] day =
	 * homeSercive.dayOfWeek(calDto.getYear(), cal.get(Calendar.MONTH)); result =
	 * new ResponseEntity<String[][]>(day ,HttpStatus.OK);
	 * 
	 * return result; }
	 */
	
	@RequestMapping(value="/delUser", method=RequestMethod.GET)
	public void delUser(UserMstInfoDTO umiDTO)	{
		homeSercive.delUser(umiDTO);
	}
	
	@RequestMapping(value="/delCorp", method=RequestMethod.GET)
	public void delCorp(CstMstInfoDTO cmiDTO)	{
		homeSercive.delCorp(cmiDTO);
	}
	
	@RequestMapping(value="/weeklyBoard/showReport", method=RequestMethod.GET)
	public Map<String, Object> showReport(WeekWrkHisDTO wrDTO){
		
		List<WeekWrkHisDTO> weeklyList = weeklyService.weeklyList(wrDTO);
//		String start = weeklyList.get(0).getSTARTWEEK();
//		String end = weeklyList.get(0).getENDWEEK();
//		String user = weeklyList.get(0).getUSERNM();
//		String grade = weeklyList.get(0).getJOBGRADE();
//		String content = weeklyList.get(0).getCONTENT();
//		String ps = weeklyList.get(0).getPS();
//		String remark = weeklyList.get(0).getREMARK();
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("start", start);
//		map.put("end", end);
//		map.put("user", user);
//		map.put("grade", grade);
//		map.put("content", content);
//		map.put("ps", ps);
//		map.put("remark", remark);
		return map;
	}
	
	
	
}
