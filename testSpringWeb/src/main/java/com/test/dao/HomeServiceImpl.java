package com.test.dao;

import java.util.Calendar;

import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
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
}
