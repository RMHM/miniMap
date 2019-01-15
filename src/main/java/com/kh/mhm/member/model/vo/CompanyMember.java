package com.kh.mhm.member.model.vo;

import java.sql.Date;

import com.kh.mhm.member.model.vo.Member;

public class CompanyMember extends Member{
	
	/*private String address; // 주소
	private String aname; // 권한명*/
	private int grantCount; // 권한 부여수
	private Date reqDate; // 요청 날짜
	private String atake;   // 권한 부여 여부
	private char delflag; // 삭제 여부
	
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
	/*public String getAddress() {
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
	}*/

	/*@Override
	public String toString() {
		return "CompanyMember [address=" + address + ", aname=" + aname + ", reqDate=" + reqDate + ", grantCount="
				+ grantDate + ", atake=" + atake + ", delflag= " + delflag + super.toString() + "]";
	}*/
	
	@Override
	public String toString() {
		return "CompanyMember [grantCount=" + grantCount + ", reqDate=" + reqDate + ", atake=" + atake + ", delflag="
				+ delflag + "]";
	}
	
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	public int getGrantCount() {
		return grantCount;
	}
	public void setGrantCount(int grantCount) {
		this.grantCount = grantCount;
	}
	public String getAtake() {
		return atake;
	}
	public void setAtake(String atake) {
		this.atake = atake;
	}
	public char getDelflag() {
		return delflag;
	}
	public void setDelflag(char delflag) {
		this.delflag = delflag;
	}

}
