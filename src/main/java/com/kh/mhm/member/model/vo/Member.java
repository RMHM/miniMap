package com.kh.mhm.member.model.vo;

public class Member implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int mno;
	private String mid;
	private String mpw;
	private String mnick;
	private String mtype;
	private String email;
	private String gender;
	private int age;
	private String profilePath;
	private String joinDate;
	private String dropDate;
	
	public Member() {
		super();
	}

	public Member(int mno, String mid, String mpw, String mnick, String mtype, String email, String gender, int age,
			String profilePath, String joinDate, String dropDate) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.mnick = mnick;
		this.mtype = mtype;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.profilePath = profilePath;
		this.joinDate = joinDate;
		this.dropDate = dropDate;
	}
	
	public Member(String mid, String mpw) {
		this.mid = mid;
		this.mpw = mpw;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getDropDate() {
		return dropDate;
	}

	public void setDropDate(String dropDate) {
		this.dropDate = dropDate;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw + ", mnick=" + mnick + ", mtype=" + mtype
				+ ", email=" + email + ", gender=" + gender + ", age=" + age + ", profilePath=" + profilePath
				+ ", joinDate=" + joinDate + ", dropDate=" + dropDate + "]";
	}
	
}
