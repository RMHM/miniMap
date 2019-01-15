package com.kh.mhm.timeLine.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class TimeLine extends TimeLineSmpl implements Serializable {

	private int tId;
	private Timestamp tDate;
	private String delFlag;

	public TimeLine() {
		super();
	}

	public TimeLine(int tId,Timestamp tDate, String delFlag) {
		super();
		this.tId=tId;
		this.tDate = tDate;
		this.delFlag = delFlag;
	}
	
	

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public Timestamp gettDate() {
		return tDate;
	}

	public void settDate(Timestamp tDate) {
		this.tDate = tDate;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "TimeLine [tDate=" + tDate + ", delFlag=" + delFlag + "]";
	}
}
