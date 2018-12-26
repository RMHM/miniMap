package com.kh.mhm.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable {

	private int meId;
	private int spend_mno;
	private int take_mno;
	private String mNick;
	private Date meDate;
	private String meTitle;
	private String meContent;
	private String delFlag;
	private String readFlag;
	private String storeFlag;
	private String sentDelFlag;
	
	public Message() {
		super();
	}

	public Message(int meId, int spend_mno, int take_mno, String mNick, Date meDate,
			String meTitle, String meContent, String delFlag, String readFlag,String storeFlag,String sentDelFlag) {
		super();
		this.meId = meId;
		this.spend_mno = spend_mno;
		this.take_mno = take_mno;
		this.mNick=mNick;
		this.meDate = meDate;
		this.meTitle = meTitle;
		this.meContent = meContent;
		this.delFlag = delFlag;
		this.readFlag=readFlag;
		this.storeFlag=storeFlag;
		this.sentDelFlag=sentDelFlag;
	}

	@Override
	public String toString() {
		return "Message [meId=" + meId + ", spend_mno=" + spend_mno + ", take_mno=" + take_mno + ", mNick="
				+ mNick + ", meDate=" + meDate + ", meTitle=" + meTitle
				+ ", meContent=" + meContent + ", delFlag=" + delFlag + "]";
	}

	public int getMeId() {
		return meId;
	}

	public void setMeId(int meId) {
		this.meId = meId;
	}

	public int getSpend_mno() {
		return spend_mno;
	}

	public void setSpend_mno(int spend_mno) {
		this.spend_mno = spend_mno;
	}

	public int getTake_mno() {
		return take_mno;
	}

	public void setTake_mno(int take_mno) {
		this.take_mno = take_mno;
	}

	public String getmNick() {
		return mNick;
	}
	
	public void setmNick(String mNick) {
		this.mNick=mNick;
	}

	public Date getMeDate() {
		return meDate;
	}

	public void setMeDate(Date meDate) {
		this.meDate = meDate;
	}

	public String getMeTitle() {
		return meTitle;
	}

	public void setMeTitle(String meTitle) {
		this.meTitle = meTitle;
	}

	public String getMeContent() {
		return meContent;
	}

	public void setMeContent(String meContent) {
		this.meContent = meContent;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	public String getReadFlag() {
		return readFlag;
	}
	
	public void setReadFlag(String readFlag) {
		this.readFlag=readFlag;
	}
	
	public String getStoreFlag() {
		return storeFlag;
	}
	
	public void setStoreFlag(String storeFlag) {
		this.storeFlag=storeFlag;
	}
	
	public String getSentDelFlag() {
		return sentDelFlag;
	}
	
	public void setSentDelFlag(String sentDelFlag) {
		this.sentDelFlag=sentDelFlag;
	}
	
}
