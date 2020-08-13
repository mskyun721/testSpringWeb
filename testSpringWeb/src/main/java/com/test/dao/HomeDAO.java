package com.test.dao;

import java.util.List;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;

public interface HomeDAO {
	public void insertUser(UserMstInfoDTO umiDTO);

	public List<UserMstInfoDTO> selectUser();

	public void delUser(UserMstInfoDTO umiDTO);

	public int loginCheck(UserMstInfoDTO umiDTO);

	public void insertCst(CstMstInfoDTO cmiDTO);
}
