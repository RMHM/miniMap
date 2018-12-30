package com.kh.mhm.test.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.ListUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.api.JejuApi;

@Controller
public class TestController {

	private int num = 2018;

	@RequestMapping("/test/testMap.do")
	public String map() {
		return "test/testMap";
	}

	@RequestMapping("/test/testApi.do")
	public String aip() {
		return "test/testApi";
	}

	@RequestMapping("/jeju/jejuContent.do")
	@ResponseBody
	public Map<String, List<Map<String, Object>>> jejuContent() {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, List<Map<String, Object>>> resultMap = new HashMap<String, List<Map<String, Object>>>();

		String url = "http://www.jeju.go.kr/rest/JejuExhibitionService/getJejucultureExhibitionList";
		Map<String, Object> param = null;
		String resultType = "xml";

		int tYear = Calendar.getInstance().get(Calendar.YEAR);
		// int tMonth = Calendar.getInstance().get(Calendar.MONTH);

		int page = 212 + (tYear - num) * 3;
		int pageSize = 30;

		long st = new Date().getTime();
		// 반복문 돌면서 정보 저장
		while (true) {
			List<Map<String, Object>> tmp = null;
			param = new HashMap<String, Object>();
			param.put("page", page);
			param.put("pageSize", pageSize);
			tmp = new JejuApi().restAPi(url, param, resultType);

			if (tmp == null || tmp.size()==0) break;
			int dataYear = Integer.parseInt(tmp.get(0).get("start").toString().substring(0, 4));
			// int dataMonth =
			// Integer.parseInt(tmp.get(0).get("start").toString().substring(5, 7));

			if (tYear - dataYear > 1)
				page += 5;
			else {
				resultList = ListUtils.union(resultList, tmp);
				page++;
			}
			if (tmp == null || tmp.size() < 20) break;
		}

		// 임시 리스트 생성
		List<Map<String, Object>> tmpList1 = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> tmpList2 = new ArrayList<Map<String, Object>>();

		for (int i = 1; i < resultList.size(); i++) {

			if (diffDate((String) resultList.get(i).get("end"), "today") < 8) {
				if (resultList.get(i).get("categoryName").equals("공연")) {
					tmpList1.add(resultList.get(i));
				} else if (resultList.get(i).get("categoryName").equals("전시")) {
					tmpList2.add(resultList.get(i));
				}
			}
		}
		resultMap.put("공연", tmpList1);
		resultMap.put("전시", tmpList2);
		long ed = new Date().getTime();
		System.out.println("수행 시간 : " + (ed - st));
		if (ed - st > 5000)
			num--;
		return resultMap;
	}

	// 날짜 차이구하기
	public long diffDate(String stDate, String edDate) {

		SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
		String today = String.valueOf(Calendar.getInstance().get(Calendar.YEAR)) + "-"
				+ String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1) + "-"
				+ String.valueOf(Calendar.getInstance().get(Calendar.DATE));
		
		long gap = 0L;
		long gapToDiff = 0L;

		try {
			Date start = sdt.parse(stDate);
			Date end = sdt.parse((edDate.toLowerCase().equals("today")) ? today : edDate);
			
			gap = end.getTime() - start.getTime();
			gapToDiff = gap / (1000 * 60 * 60 * 24);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return gapToDiff;
	}
	
}
