package com.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.WeeklyReportDTO;
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
	public Map<String, Object> showReport(WeeklyReportDTO weeklyDTO){
		System.out.println(weeklyDTO.getENDWEEK());
		
		List<WeeklyReportDTO> weeklyList = weeklyService.weeklyList(weeklyDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("weeklyList", weeklyList);
		return map;
	}
	
	
	
	
}
