package com.kh.mhm.manager.model.vo;

import java.sql.Date;

import com.kh.mhm.member.model.vo.Member;

public class CompanyMember extends Member{

	private String address;
	private String aname; // 권한명
	private Date reqDate; // 요청 날짜
	private Date grantDate; // 권한 부여일

	public CompanyMember() {
		super();
	}
	public CompanyMember(int mno, String mname, String mid, String mpw, String mnick, String mtype, String email,
			String gender, int age, String profilePath, Date joinDate, Date dropDate) {
		super(mno, mname, mid, mpw, mnick, mtype, email, gender, age, profilePath, joinDate, dropDate);
	}
	public CompanyMember(String mname, String mid, String email, String gender, int age, Date joinDate, Date dropDate) {
		super(mname, mid, email, gender, age, joinDate, dropDate);
	}
	public CompanyMember(String mname, String mid, String mpw, String mnick, String mtype, String email, String gender,
			int age, String profilePath) {
		super(mname, mid, mpw, mnick, mtype, email, gender, age, profilePath);
	}
	public CompanyMember(String mid, String mpw) {
		super(mid, mpw);
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "CompanyMember [address=" + address + ", aname=" + aname + ", reqDate=" + reqDate + ", grantDate="
				+ grantDate + "]";
	}
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	public Date getGrantDate() {
		return grantDate;
	}
	public void setGrantDate(Date grantDate) {
		this.grantDate = grantDate;
	}

}
