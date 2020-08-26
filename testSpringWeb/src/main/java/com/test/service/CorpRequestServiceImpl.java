package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.CorpRequestDAO;
import com.test.dto.CstReqHisDTO;

@Service
public class CorpRequestServiceImpl implements CorpRequestService {
	@Inject CorpRequestDAO crDao;
	
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
	public List<CstReqHisDTO> requestList() {
		List<CstReqHisDTO> reqList = crDao.requestList();
		return reqList;
	}
	@Override
	public CstReqHisDTO oneRequest(CstReqHisDTO crhDto) {
		CstReqHisDTO requestCrhDto = crDao.oneRequest(crhDto);
		return requestCrhDto;
	}
}
