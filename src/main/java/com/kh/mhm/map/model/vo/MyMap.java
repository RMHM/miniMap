package com.kh.mhm.map.model.vo;
import java.sql.Date;
import java.util.Arrays;

public class MyMap {

   String [] mapLat; // 위도
   String [] mapLng; // 경도

   String []memberId;
   String []text;
   String []sort;
   
   
   public MyMap(String[] mapLat, String[] mapLng, String[] memberId, String[] text, String[] sort) {
      super();
      this.mapLat = mapLat;
      this.mapLng = mapLng;
      this.memberId = memberId;
      this.text = text;
      this.sort = sort;
   }


public String[] getMapLat() {
	return mapLat;
}


public void setMapLat(String[] mapLat) {
	this.mapLat = mapLat;
}


public String[] getMapLng() {
	return mapLng;
}


public void setMapLng(String[] mapLng) {
	this.mapLng = mapLng;
}


public String[] getMemberId() {
	return memberId;
}


public void setMemberId(String[] memberId) {
	this.memberId = memberId;
}


public String[] getText() {
	return text;
}


public void setText(String[] text) {
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
	return "MyMap [mapLat=" + Arrays.toString(mapLat) + ", mapLng=" + Arrays.toString(mapLng) + ", memberId="
			+ Arrays.toString(memberId) + ", text=" + Arrays.toString(text) + ", sort=" + Arrays.toString(sort) + "]";
}


public MyMap() {
	super();
	// TODO Auto-generated constructor stub
}
   
   
   
   
   

}