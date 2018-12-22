package com.kh.mhm.myPage.model.vo;

import java.sql.Date;

public class Schedule {

	private int sId        ;
	private int mNo        ;
	private Date start_Date ;
	private Date end_Date   ;
	private String sTitle     ;
	private String sContent   ;
	private String sColor     ;
	private char delflag    ;
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Schedule(int sId, int mNo, Date start_Date, Date end_Date, String sTitle, String sContent, String sColor,
			char delflag) {
		super();
		this.sId = sId;
		this.mNo = mNo;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sColor = sColor;
		this.delflag = delflag;
	}
	public Schedule(int mNo, Date start_Date, Date end_Date, String sTitle, String sContent, String sColor) {
		super();
		this.mNo = mNo;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sColor = sColor;
	}
	public Schedule(int mNo, String sTitle, String sContent, String sColor) {
		super();
		this.mNo = mNo;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sColor = sColor;
	}



	public int getSId() {
		return sId;
	}
	public void setSId(int sId) {
		this.sId = sId;
	}
	public int getMNo() {
		return mNo;
	}
	public void setMNo(int mNo) {
		this.mNo = mNo;
	}
	public Date getStart_Date() {
		return start_Date;
	}
	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}
	public Date getEnd_Date() {
		return end_Date;
	}
	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}
	public String getSTitle() {
		return sTitle;
	}
	public void setSTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getSContent() {
		return sContent;
	}
	public void setSContent(String sContent) {
		this.sContent = sContent;
	}
	public String getSColor() {
		return sColor;
	}
	public void setSColor(String sColor) {
		this.sColor = sColor;
	}
	public char getDelflag() {
		return delflag;
	}
	public void setDelflag(char delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "sId=" + sId + ", mNo=" + mNo + ", start_Date=" + start_Date + ", end_Date=" + end_Date
				+ ", sTitle=" + sTitle + ", sContent=" + sContent + ", sColor=" + sColor + ", delflag=" + delflag ;
	}



}
