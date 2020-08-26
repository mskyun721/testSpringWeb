package com.test.service;

import java.util.List;

import com.test.dto.CstReqHisDTO;

public interface CorpRequestService {

	void requestInsert(CstReqHisDTO crhDto);

	int countReqDate(CstReqHisDTO crhDto);

	List<CstReqHisDTO> requestList();

	CstReqHisDTO oneRequest(CstReqHisDTO crhDto);

}
