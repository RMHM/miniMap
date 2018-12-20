package com.kh.mhm.timeLine.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class TimeLine implements Serializable {
	
	private int tId;
	private int mNo;
	private Timestamp tDate;
	private String tContent;
	private String delFlag;
	
	public TimeLine() {
		super();
	}

	public TimeLine(int tId, int mNo, Timestamp tDate, String tContent, String delFlag) {
		super();
		this.tId = tId;
		this.mNo = mNo;
		this.tDate = tDate;
		this.tContent = tContent;
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "TimeLine [tId=" + tId + ", mNo=" + mNo + ", tDate=" + tDate + ", tContent=" + tContent + ", delFlag="
				+ delFlag + "]";
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public Timestamp gettDate() {
		return tDate;
	}

	public void settDate(Timestamp tDate) {
		this.tDate = tDate;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
}
