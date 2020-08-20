package com.test.service;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Service;

import com.test.dao.HomeDAO;
import com.test.dto.CstMstInfoDTO;
import com.test.dto.UserMstInfoDTO;

@Service
public class HomeServiceImpl implements HomeService {
	@Inject
	private HomeDAO homeDAO;
	
	Calendar cal = Calendar.getInstance();
	@Override
	public String[][] dayOfWeek(int year,int month) {
		cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DATE, 1);
        int endDay = cal.getActualMaximum(Calendar.DATE);
        String[][] day = new String[6][7];
		
		int j=0;
		for (int i = 1; i <= endDay; i++) {
			cal.set(Calendar.YEAR, cal.get(Calendar.YEAR));
	        cal.set(Calendar.MONTH, cal.get(Calendar.MONTH));
	        cal.set(Calendar.DATE, i);
	        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	        
			switch (dayOfWeek) {
			case 1:
				day[j][0] = i+"" ;
				break;
			case 2:
				day[j][1] = i+"" ;
				break;
			case 3:
				day[j][2] = i+"" ;
				break;
			case 4:
				day[j][3] = i+"" ;
				break;
			case 5:
				day[j][4] = i+"" ;
				break;
			case 6:
				day[j][5] = i+"" ;
				break;
			case 7:
				day[j][6] = i+"" ;
				j++;
				break;
			}
		}
		return day;
	}
	
	/*	user ----------------------------------- */
	@Override
	public void insertUser(UserMstInfoDTO umiDTO) {
		homeDAO.insertUser(umiDTO);
	}
	@Override
	public List<UserMstInfoDTO> selectUser() {
		List<UserMstInfoDTO> userList;
		userList = homeDAO.selectUser();
		
		return userList;
	}
	@Override
	public void delUser(UserMstInfoDTO umiDTO) {
		homeDAO.delUser(umiDTO);
	}
	@Override
	public UserMstInfoDTO oneUser(UserMstInfoDTO umiDTO) {
		return homeDAO.oneUser(umiDTO);
	}
	/*	user ----------------------------------- */
	
	@Override
	public boolean loginCheck(UserMstInfoDTO umiDTO, HttpSession session) {
		boolean result=false;
		UserMstInfoDTO loginCheck = homeDAO.oneUser(umiDTO);
		if (loginCheck.getUSERNM() != "") {
			session.setAttribute("USERNM", loginCheck.getUSERNM());
			session.setAttribute("JOBGRADE", loginCheck.getJOBGRADE());
			session.setAttribute("USERID", loginCheck.getUSERID());
			result=true;
		}
		return result;
	}
	@Override
	public void insertCst(CstMstInfoDTO cmiDTO) {
		homeDAO.insertCst(cmiDTO);
	}
	@Override
	public List<CstMstInfoDTO> corpList(CstMstInfoDTO cmiDTO) {
		List<CstMstInfoDTO> corpList;
		corpList=homeDAO.corpList(cmiDTO);
		
		return corpList;
	}
	@Override
	public void delCorp(CstMstInfoDTO cmiDTO) {
		homeDAO.delCorp(cmiDTO);
	}
	@Override
	public CstMstInfoDTO selectOneCST(CstMstInfoDTO cmiDTO) {
		return homeDAO.selectOneCST(cmiDTO);
	}
}
