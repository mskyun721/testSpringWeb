package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.dto.CstReqHisDTO;

public interface CorpRequestService {

	void requestInsert(CstReqHisDTO crhDto);

	int countReqDate(CstReqHisDTO crhDto);

	List<CstReqHisDTO> requestList(CstReqHisDTO crhDto);

	CstReqHisDTO oneRequest(CstReqHisDTO crhDto);

	Map<String, Object> searchDate();

	void requestDel(CstReqHisDTO crhDto);

}
