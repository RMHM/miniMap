package com.kh.mhm.myPage.model.vo;

import java.sql.Date;

public class Authority {
	private int aId			;//	고유번호
	private int mNo			;//	회원번호
	private String mName		;//	회원이름
	private String mNick		;// 닉네임
	private Date request_date	;//	요청날짜
	private String address		;//	주소
	private String aContent		;//	내용
	private int aCode			;//	권한분류코드
	private String aName		;// 권한명
	private char aTake			;//	한부여여부
	private Date grant_date		;//	권한부여날짜
	private char delflag		;//	삭제 여부
	private String img_file 	;
	private String site_url		;
	private String aname	;
	public Authority() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Authority(int aId, int mNo, String mName, String mNick, Date request_date, String address, String aContent,
			int aCode, char aTake, Date grant_date, char delflag, String img_file, String site_url, String aname) {
		super();
		this.aId = aId;
		this.mNo = mNo;
		this.mName = mName;
		this.mNick = mNick;
		this.request_date = request_date;
		this.address = address;
		this.aContent = aContent;
		this.aCode = aCode;
		this.aTake = aTake;
		this.grant_date = grant_date;
		this.delflag = delflag;
		this.img_file = img_file;
		this.site_url = site_url;
		this.aname = aname;
	}


	public Authority(int mNo, String mName, Date request_date, String address, String aContent, int aCode, char aTake,
			Date grant_date, char delflag, String img_file, String site_url, String aname) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.request_date = request_date;
		this.address = address;
		this.aContent = aContent;
		this.aCode = aCode;
		this.aTake = aTake;
		this.grant_date = grant_date;
		this.delflag = delflag;
		this.img_file = img_file;
		this.site_url = site_url;
		this.aname = aname;
	}


	public Authority(int mNo, String mName, Date request_date, String address, String aContent, int aCode, char aTake,
			Date grant_date, char delflag) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.request_date = request_date;
		this.address = address;
		this.aContent = aContent;
		this.aCode = aCode;
		this.aTake = aTake;
		this.grant_date = grant_date;
		this.delflag = delflag;
	}
	public Authority(int mNo, String mName, String address, String aContent, int aCode) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.address = address;
		this.aContent = aContent;
		this.aCode = aCode;
	}
	
	public Authority(int mNo, String mName, Date request_date, String address, String aContent, int aCode,
			String img_file, String site_url) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.request_date = request_date;
		this.address = address;
		this.aContent = aContent;
		this.aCode = aCode;
		this.img_file = img_file;
		this.site_url = site_url;
	}


	public Authority(int aId, String mName, Date request_date, char delflag) {
		super();
		this.aId = aId;
		this.mName = mName;
		this.request_date = request_date;
		this.delflag = delflag;
	}
	public int getAId() {
		return aId;
	}
	public void setAId(int aId) {
		this.aId = aId;
	}
	public int getMNo() {
		return mNo;
	}
	public void setMNo(int mNo) {
		this.mNo = mNo;
	}
	public String getMName() {
		return mName;
	}
	public void setMName(String mName) {
		this.mName = mName;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAContent() {
		return aContent;
	}
	public void setAContent(String aContent) {
		this.aContent = aContent;
	}
	public int getACode() {
		return aCode;
	}
	public void setACode(int aCode) {
		this.aCode = aCode;
	}
	public char getATake() {
		return aTake;
	}
	public void setATake(char aTake) {
		this.aTake = aTake;
	}
	public Date getGrant_date() {
		return grant_date;
	}
  
	public void setGrant_date(Date grant_date) {
		this.grant_date = grant_date;
	}
	public char getDelflag() {
		return delflag;
	}
	public void setDelflag(char delflag) {
		this.delflag = delflag;
	}

  public String getImg_file() {
		return img_file;
	}

	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}

	public String getSite_url() {
		return site_url;
	}
  
	public void setSite_url(String site_url) {
		this.site_url = site_url;
	}

	public String getMNick() {
		return mNick;
	}
	public void setMNick(String mNick) {
		this.mNick = mNick;
	}
  
  public String getAName() {
		return aName;
	}
	public void setAName(String aName) {
		this.aName = aName;
	}
  
  @Override
	public String toString() {
		return "Authority [aId=" + aId + ", mNo=" + mNo + ", mName=" + mName + ", mNick=" + mNick + ", request_date="
				+ request_date + ", address=" + address + ", aContent=" + aContent + ", aCode=" + aCode + ", aTake="
				+ aTake + ", grant_date=" + grant_date + ", delflag=" + delflag + ", img_file=" + img_file
				+ ", site_url=" + site_url + ", aname=" + aname + "]";
	}
}
