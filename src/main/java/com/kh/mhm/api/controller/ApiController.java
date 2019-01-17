package com.kh.mhm.api.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.ListUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.api.JejuApi;
import com.kh.mhm.api.common.ConvLonLatToXY;

@Controller
public class ApiController {

	private int num = 2018;

	@RequestMapping("/event/eventCalendar.go")
	public String eventCalendar() {
		return "event/eventCalendar";
	}
	
	@RequestMapping("/jeju/jejuWeather.do")
	@ResponseBody
	public Object jejuWeather() {
		Map<String, Object> result = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat();
		ConvLonLatToXY conv = new ConvLonLatToXY();
		
		String url = "http://data.jeju.go.kr/rest/JejuLdapsDataService/getForecastPointDataXY";
		Map<String, Object> param = null;
		String resultType = "xml";
		
		sdf.applyPattern("HH");
		int nowHour = Integer.parseInt(sdf.format(new Date()));
		String baseTime = "";
		String baseDate = "";
		
		sdf.applyPattern("yyyMMdd");
		if(nowHour>2&&nowHour<16) {
			baseTime = "2100";
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -1);
			baseDate = sdf.format(cal.getTime());
		} else if(nowHour<3) {
			baseTime = "0900";
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, -1);
			baseDate = sdf.format(cal.getTime());
		} else if(nowHour>15) {
			baseTime = "0900";
			baseDate = sdf.format(new Date());
		}

		Map<String, Object> tmpMap = new HashMap<String, Object>();
		// 제주시 좌표 33.499583, 126.531259
		tmpMap.put("제주", conv.ll_to_ij(33.499583, 126.531259));
		// 서귀포 좌표 33.253889, 126.559662
		tmpMap.put("서귀포", conv.ll_to_ij(33.253889, 126.559662));
		
		for(Object str : tmpMap.keySet().toArray()) {
			int pageSize = 10;
			List<Map<String, Object>> tmp = new ArrayList<Map<String, Object>>();
			for(int i=1;;i++) {
				param = new HashMap<String, Object>();
				param.put("authApiKey", "DYYBJHVJQVVFAWT");
				param.put("baseDate", baseDate);
				param.put("baseTime", baseTime);
				param.put("nx", ((int[])tmpMap.get(str))[0]);
				param.put("ny", ((int[])tmpMap.get(str))[1]);
				param.put("hgtLevel", 1);
				param.put("startPage", i);
				
				List<Map<String, Object>> list = new JejuApi().restAPi(url, param, resultType, "//data/list");
				
				if(list==null || list.size()==0) break;
				tmp = ListUtils.union(tmp, list);
				if(list.size()<pageSize) break;
			}
			result.put((String)str, tmp);
		}
		
		return result;
	}
	
	@RequestMapping("/jeju/jejuContent.do")
	@ResponseBody
	public Map<String, List<Map<String, Object>>> jejuContent() {
		// 공연전시 api
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
			tmp = new JejuApi().restAPi(url, param, resultType, "//items/item");

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
	
	// 팝업창 보내기 임시
	
}
