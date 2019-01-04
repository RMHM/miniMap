package com.kh.mhm.api;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup; 
import org.jsoup.nodes.Document; 
import org.jsoup.nodes.Element; 
import org.jsoup.select.Elements;


public class Temperatures {

	public ArrayList temperature(int num) throws IOException {
	
		ArrayList l = new ArrayList();
		ArrayList result = new ArrayList();
		
		
			Document doc = Jsoup.connect("http://www.weather.go.kr/weather/climate/average_30years.jsp?yy_st=2011&stn=184&norm=D&obs=0&mm="+num).get();
			Elements title = doc.select(".table_develop tbody tr");			
		
			Map month = new HashMap();
			for(Element e : title){
				/*System.out.println(e);
				
				System.out.println(e.select("td:eq(0)"));
			
				System.out.println(e);
				System.out.println("-----");*/
				Map map = new HashMap();
				map.put("day", e.select("td:eq(0)").text());
				map.put("high", e.select("td:eq(2)").text());
				map.put("low", e.select("td:eq(3)").text());
				l.add(map);
			}
		/*	month.put(i, l);
			result.add(month);
	*/
		
		
		return l;
	}

}