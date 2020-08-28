package com.test.service;

import java.time.Year;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.CorpRequestDAO;
import com.test.dto.CstReqHisDTO;

@Service
public class CorpRequestServiceImpl implements CorpRequestService {
	@Inject CorpRequestDAO crDao;
	Calendar cal = Calendar.getInstance();
	
	@Override
	public Map<String, Object> searchDate() {
		Map<String,Object> map = new HashMap<String, Object>();
		String strMonth = "", strDay = "";
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		if (month < 10) {strMonth = "0"+month;}else {strMonth=month+"";}
		if (day<10) {strDay = "0"+day;} else {strDay=day+"";}
		String stdate = year+"-"+strMonth+"-01";
		String ltdate = year+"-"+strMonth+"-"+strDay;
		map.put("stdate", stdate);
		map.put("ltdate", ltdate);
		
		return map;
	}
	@Override
	public void requestInsert(CstReqHisDTO crhDto) {
		crDao.requestInsert(crhDto);
	}
	@Override
	public int countReqDate(CstReqHisDTO crhDto) {
		int count = crDao.countReqDate(crhDto);
		return count;
	}
	@Override
	public List<CstReqHisDTO> requestList(CstReqHisDTO crhDto) {
		List<CstReqHisDTO> reqList = crDao.requestList(crhDto);
		return reqList;
	}
	@Override
	public void requestDel(CstReqHisDTO crhDto) {
		crDao.requestDel(crhDto);
	}
	
	@Override
	public CstReqHisDTO oneRequest(CstReqHisDTO crhDto) {
		CstReqHisDTO requestCrhDto = crDao.oneRequest(crhDto);
		return requestCrhDto;
	}
}
