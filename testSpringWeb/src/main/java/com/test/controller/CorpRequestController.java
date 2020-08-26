package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.CstReqHisDTO;
import com.test.service.CorpRequestService;
import com.test.service.HomeService;

@Controller
@RequestMapping("/corpRequest/*")
public class CorpRequestController {
	@Inject CorpRequestService crService;
	@Inject HomeService homeService;
	Calendar cal = Calendar.getInstance();

	@RequestMapping("corpRequest")
	public String corpRequest(Model model) {
		List<CstReqHisDTO> reqList = crService.requestList();
		model.addAttribute("reqList",reqList);
		return "corpRequest/corpRequest";
	}
	
	@RequestMapping("corpRequestList")
	public String corpRequestList() {
		return "corpRequest/corpRequestList";
	}
	
	@RequestMapping("RequestForm")
	public String RequestForm(Model model, CstReqHisDTO crhDto) {
		String strMonth = null, strDay = null;
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		if (month < 10) {strMonth = "0"+month;}else {strMonth=month+"";}
		if (day<10) {strDay = "0"+day;} else {strDay=day+"";}
		if (crhDto != null) {
			CstReqHisDTO requestCrhDto = crService.oneRequest(crhDto);
			model.addAttribute("requestCrhDto", requestCrhDto);
		}
		
		model.addAttribute("date", year+"-"+strMonth+"-"+strDay);
		
		return "corpRequest/RequestForm";
	}
	
	@RequestMapping(value="requestInsert", method=RequestMethod.GET)
	public String requestInsert(CstReqHisDTO crhDto, HttpServletResponse response) {
		String strCount="";
		int count = crService.countReqDate(crhDto)+1;
		if (count<10) {strCount="00"+count;}
		else if (count<100) {strCount="0"+count;}
		else {strCount=count+"";}
		if (crhDto.getREQNO() == "") {
			String reqno = crhDto.getREQDATE().substring(2, 4)+crhDto.getREQDATE().substring(5, 7)+
					crhDto.getREQDATE().substring(8, 10)+"-"+strCount;
			crhDto.setREQNO(reqno);
		}
		crService.requestInsert(crhDto);
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
		return "corpRequest/RequestForm";
	}
	
	@RequestMapping(value="CstcdSearch", method=RequestMethod.GET)
	public String CstcdSearch(Model model,CstMstInfoDTO cmiDTO) {
		List<CstMstInfoDTO> corpList;
		corpList = homeService.corpList(cmiDTO);
		model.addAttribute("corpList",corpList);
		return "corpRequest/CstcdSearch";
	}
}
