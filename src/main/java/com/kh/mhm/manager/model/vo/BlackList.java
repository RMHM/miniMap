package com.kh.mhm.manager.model.vo;

import java.sql.Date;

import com.kh.mhm.member.model.vo.Member;

public class BlackList extends Member{
	private Date endDate;
	private String reason;
	
	public BlackList() {
		super();
		
	}
	public BlackList(int mno, String mname, String mid, String mpw, String mnick, String mtype, String email,
			String gender, int age, String profilePath, Date joinDate, Date dropDate) {
		super(mno, mname, mid, mpw, mnick, mtype, email, gender, age, profilePath, joinDate, dropDate);
		
	}
	public BlackList(String mname, String mid, String email, String gender, int age, Date joinDate, Date dropDate) {
		super(mname, mid, email, gender, age, joinDate, dropDate);
		
	}
	public BlackList(String mname, String mid, String mpw, String mnick, String mtype, String email, String gender,
			int age, String profilePath) {
		super(mname, mid, mpw, mnick, mtype, email, gender, age, profilePath);
		
	}
	public BlackList(String mid, String mpw) {
		super(mid, mpw);
		
	}
	@Override
	public String toString() {
		return "BlackList [endDate=" + endDate + ", reason=" + reason + "]";
	}
	
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
