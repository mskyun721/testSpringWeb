package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.dto.CstReqHisDTO;

@Repository
public class CorpRequestDAOImpl implements CorpRequestDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.test.mappers.corpRequstMapper";
	
	@Override
	public void requestInsert(CstReqHisDTO crhDto) {
		sqlSession.insert(Namespace+".requestInsert", crhDto);
	}
	@Override
	public int countReqDate(CstReqHisDTO crhDto) {
		return sqlSession.selectOne(Namespace+".countReqDate", crhDto);
	}
	@Override
	public List<CstReqHisDTO> requestList() {
		return sqlSession.selectList(Namespace+".requestList");
	}
	@Override
	public CstReqHisDTO oneRequest(CstReqHisDTO crhDto) {
		return sqlSession.selectOne(Namespace+".oneRequest",crhDto);
	}
}
