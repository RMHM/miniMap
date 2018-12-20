package com.kh.mhm.myPage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.mhm.myPage.model.vo.Schedule;

public interface MyPageService {

	int insertSchedule(Schedule schedule);
	
	List<Map<String,Object>> selectSchedule();
}
