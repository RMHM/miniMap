package com.kh.mhm.map.model.vo;
import java.sql.Date;
import java.util.Arrays;

public class Map {

	String [] mapLat; // 위도
	String [] mapLng; // 경도

	String []memberId;
	String []text;
	String []sort;
	
	
	public Map(String[] mapLat, String[] mapLng, String[] memberId, String[] text, String[] sort) {
		super();
		this.mapLat = mapLat;
		this.mapLng = mapLng;
		this.memberId = memberId;
		this.text = text;
		this.sort = sort;
	}
	
	
	
	

}
