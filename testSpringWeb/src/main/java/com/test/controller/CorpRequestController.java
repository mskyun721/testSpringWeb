package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/corpRequest/*")
public class CorpRequestController {

	@RequestMapping("corpRequest")
	public String corpRequest() {
		return "corpRequest/corpRequest";
	}
	
	@RequestMapping("corpRequestList")
	public String corpRequestList() {
		return "corpRequest/corpRequestList";
	}
	
	@RequestMapping("RequestForm")
	public String RequestForm() {
		return "corpRequest/RequestForm";
	}
}
