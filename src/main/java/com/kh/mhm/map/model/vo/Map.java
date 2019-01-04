package com.kh.mhm.map.model.vo;
import java.sql.Date;
import java.util.Arrays;

public class Map {

	double mapLat; // 위도
	double mapLng; // 경도

	String memberId;
	String text;
	String[] sort;

	public Map() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 글안쓰고 마커만 지정했을때
	public Map(double mapLat, double mapLng, String memberId) {
		super();
		this.mapLat = mapLat;
		this.mapLng = mapLng;
		this.memberId = memberId;
	}

	// 글만 추가했을때.
	public Map(double mapLat, double mapLng, String memberId, String text) {
		this.mapLat = mapLat;
		this.mapLng = mapLng;
		this.memberId = memberId;
		this.text = text;
	}

	// 글이랑 카테고리 다썼을때
	public Map(double mapLat, double mapLng, String memberId, String text, String[] sort) {
		super();
		this.mapLat = mapLat;
		this.mapLng = mapLng;
		this.memberId = memberId;
		this.text = text;
		this.sort = sort;
	}

	public double getMapLat() {
		return mapLat;
	}

	public void setMapLat(double mapLat) {
		this.mapLat = mapLat;
	}

	public double getMapLng() {
		return mapLng;
	}

	public void setMapLng(double mapLng) {
		this.mapLng = mapLng;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String[] getSort() {
		return sort;
	}

	public void setSort(String[] sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Map [mapLat=" + mapLat + ", mapLng=" + mapLng + ", memberId=" + memberId + ", text=" + text + ", sort="
				+ Arrays.toString(sort) + "]";
	}

}
