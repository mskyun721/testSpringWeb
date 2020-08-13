package com.test.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;

public interface HomeService {
	public String[][] dayOfWeek(int year,int month);
	public void insertUser(UserMstInfoDTO umiDTO);
	public List<UserMstInfoDTO> selectUser();
	public void delUser(UserMstInfoDTO umiDTO);
	public boolean loginCheck(UserMstInfoDTO umiDTO, HttpSession session);
	public void insertCst(CstMstInfoDTO cmiDTO);
}
