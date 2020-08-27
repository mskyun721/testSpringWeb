package com.test.dao;

import java.util.List;

import com.test.dto.CstReqHisDTO;

public interface CorpRequestDAO {

	void requestInsert(CstReqHisDTO crhDto);

	int countReqDate(CstReqHisDTO crhDto);

	List<CstReqHisDTO> requestList(CstReqHisDTO crhDto);

	CstReqHisDTO oneRequest(CstReqHisDTO crhDto);

}
