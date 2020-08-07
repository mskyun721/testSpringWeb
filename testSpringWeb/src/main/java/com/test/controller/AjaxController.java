package com.test.controller;

import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.dao.HomeService;
import com.test.dto.CalDTO;

@RestController
public class AjaxController {
	@Inject
	HomeService homeSercive;
	
	
	@RequestMapping("/searchYear")
	public ResponseEntity<String[][]> searchYear(CalDTO calDto){
		ResponseEntity<String[][]> result = null;
		Calendar cal = Calendar.getInstance();
		String[][] day = homeSercive.dayOfWeek(calDto.getYear(), cal.get(Calendar.MONTH));
		result = new ResponseEntity<String[][]>(day ,HttpStatus.OK);
		
		return result;
	}
}
