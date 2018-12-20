package com.kh.mhm.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable {

	private int meId;
	private int spend_mno;
	private int take_mno;
	private Date meDate;
	private String meTitle;
	private String meContent;
	private String delFlag;
	
	public Message() {
		super();
	}
	
	public Message(int meId, int spend_mno, int take_mno, Date meDate, String meTitle, String meContent,
			String delFlag) {
		super();
		this.meId = meId;
		this.spend_mno = spend_mno;
		this.take_mno = take_mno;
		this.meDate = meDate;
		this.meTitle = meTitle;
		this.meContent = meContent;
		this.delFlag = delFlag;
	}
	
	@Override
	public String toString() {
		return "Message [meId=" + meId + ", spend_mno=" + spend_mno + ", take_mno=" + take_mno + ", meDate=" + meDate
				+ ", meTitle=" + meTitle + ", meContent=" + meContent + ", delFlag=" + delFlag + "]";
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
	
}
