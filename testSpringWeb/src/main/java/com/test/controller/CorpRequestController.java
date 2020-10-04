package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@Inject
	CorpRequestService crService;
	@Inject
	HomeService homeService;
	Calendar cal = Calendar.getInstance();

	@RequestMapping(value="corpRequest", method= {RequestMethod.GET,RequestMethod.POST})
	public String corpRequest(Model model,CstReqHisDTO crhDto,HttpSession session) {
		String path="";
		if(session.getAttribute("USERID")==null) {
			path="redirect:/";
		}else {
			Map<String,Object> dateMap = crService.searchDate();
			if (crhDto.getSTDATE()==null) {crhDto.setSTDATE(dateMap.get("stdate").toString());}
			if (crhDto.getLTDATE()==null) {crhDto.setLTDATE(dateMap.get("ltdate").toString());}
			
			List<CstReqHisDTO> reqList = crService.requestList(crhDto);
			model.addAttribute("STDATE",crhDto.getSTDATE());
			model.addAttribute("LTDATE",crhDto.getLTDATE());
			model.addAttribute("reqList",reqList);
			model.addAttribute("CSTNM",crhDto.getCSTNM());
			model.addAttribute("APPROVAL",crhDto.getAPPROVAL());
			model.addAttribute("COMPLET",crhDto.getCOMPLET());
			path="corpRequest/corpRequest";
		}
		return path;
	}
	
	@RequestMapping("RequestForm")
	public String RequestForm(Model model, CstReqHisDTO crhDto) {
		Map<String,Object> dateMap = crService.searchDate();
		if (crhDto != null) {
			CstReqHisDTO requestCrhDto = crService.oneRequest(crhDto);
			model.addAttribute("requestCrhDto", requestCrhDto);
		}
		
		
		model.addAttribute("date", dateMap.get("ltdate"));
		
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
