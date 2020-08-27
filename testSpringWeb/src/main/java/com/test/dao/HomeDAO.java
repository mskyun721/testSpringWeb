package com.test.dao;

import java.util.List;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;
import com.test.dto.UserScheduleDTO;

public interface HomeDAO {
//	user-----------------------------------------
	public void insertUser(UserMstInfoDTO umiDTO);

	public List<UserMstInfoDTO> selectUser();

	public void delUser(UserMstInfoDTO umiDTO);
	
	public UserMstInfoDTO oneUser(UserMstInfoDTO umiDTO);
//	user-----------------------------------------

	public void insertCst(CstMstInfoDTO cmiDTO);

	public List<CstMstInfoDTO> corpList(CstMstInfoDTO cmiDTO);

	public void delCorp(CstMstInfoDTO cmiDTO);

	public CstMstInfoDTO selectOneCST(CstMstInfoDTO cmiDTO);

	public UserMstInfoDTO login(UserMstInfoDTO umiDTO);

	public void insertSchedule(UserScheduleDTO usDTO);

	public List<UserScheduleDTO> schList(UserScheduleDTO usDto);

	
}
