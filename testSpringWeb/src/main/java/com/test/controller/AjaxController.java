package com.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.test.dto.CalDTO;
import com.test.dto.CstMstInfoDTO;
import com.test.dto.CstReqHisDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.WeekWrkHisDTO;
import com.test.service.CorpRequestService;
import com.test.service.HomeService;
import com.test.service.WeeklyBoardService;

@RestController
public class AjaxController {
	@Inject
	HomeService homeSercive;
	@Inject
	WeeklyBoardService weeklyService;
	@Inject
	CorpRequestService crService;
	
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
		String yearWeek = wrDTO.getYEARWEEK().substring(0, 2);
		wrDTO.setYEARWEEK(yearWeek);
		
		List<WeekWrkHisDTO> weeklyList = weeklyService.weeklyList(wrDTO);
		String yearweek = weeklyList.get(0).getYEARWEEK();
		String userNm = weeklyList.get(0).getUSERNM();
		String userId = weeklyList.get(0).getUSERID();
		String stweek = weeklyList.get(0).getSTWEEKDAY();
		String ltweek = weeklyList.get(0).getLTWEEKDAY();
		String grade = weeklyList.get(0).getJOBGRADE();
		String cont = weeklyList.get(0).getWEEKWORKCONT();
		String ps = weeklyList.get(0).getWEEKPS();
		String remark = weeklyList.get(0).getREMARK();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("yearweek", yearweek);
		map.put("userNm", userNm);
		map.put("userId", userId);
		map.put("stweek", stweek);
		map.put("ltweek", ltweek);
		map.put("grade", grade);
		map.put("cont", cont);
		map.put("ps", ps);
		map.put("remark", remark);
		return map;
	}
	
	@RequestMapping(value="/weeklyBoard/yearOfWeek", method=RequestMethod.GET)
	public Map<String,Object> yearOfWeek(@RequestParam("stdate")String stdate){
		Map<String, Object> map = new HashMap<String, Object>();
		String[] stdateSplit = stdate.split("-");
		CalDTO calDto = new CalDTO();
		int year = Integer.parseInt(stdateSplit[0]);
		int month = Integer.parseInt(stdateSplit[1]);
		int day = Integer.parseInt(stdateSplit[2]);
		calDto.setYear(year);
		calDto.setMonth(month);
		calDto.setDay(day);
		Map<String, Object> calMap = weeklyService.weeklyCal(calDto);
		map.put("week", calMap.get("week"));
		map.put("friday",calMap.get("friday"));
		return map;
	}
	
	@RequestMapping(value="/weeklyBoard/delWeekwrkhis", method=RequestMethod.GET)
	public void delWeekwrkhis(WeekWrkHisDTO wrDTO){
		weeklyService.delBoard(wrDTO);
	}
	
	@RequestMapping(value="/corpRequest/requestDateSearch", method=RequestMethod.GET)
	public  List<CstReqHisDTO> delWeekwrkhis(CstReqHisDTO crhDto){
		Map<String, Object> map = new HashMap<String, Object>();
		List<CstReqHisDTO> reqList = crService.requestList(crhDto);
		
		return reqList;
	}
	
	
	
}
