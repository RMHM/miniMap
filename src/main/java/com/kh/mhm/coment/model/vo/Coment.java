package com.kh.mhm.coment.model.vo;

import java.sql.Date;

public class Coment {
	
	private int cid;
	private	int bid;
	private int	mno;
	private String ccontent;
	private Date cdate;
	private int clevel;
	private int cref;
	private String rflag;
	private String delFlag;
	private String mnick;
	private String bname;
	



	public Coment() {}

	

	public Coment(int cid, int bid, int mno, String ccontent, Date cdate, int clevel, int cref, String rflag,
			String delFlag, String mnick) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.mno = mno;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.clevel = clevel;
		this.cref = cref;
		this.rflag = rflag;
		this.delFlag = delFlag;
		this.mnick = mnick;
	}



	public Coment(int cid, int bid, int mno, String ccontent, Date cdate, int clevel, int cref, String rflag,
			String delFlag, String mnick, String bname) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.mno = mno;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.clevel = clevel;
		this.cref = cref;
		this.rflag = rflag;
		this.delFlag = delFlag;
		this.mnick = mnick;
		this.bname = bname;
	}



	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}

	public int getCref() {
		return cref;
	}

	public void setCref(int cref) {
		this.cref = cref;
	}

	public String getRflag() {
		return rflag;
	}

	public void setRflag(String rflag) {
		this.rflag = rflag;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	public String getMnick() {
		return mnick;
	}



	public void setMnick(String mnick) {
		this.mnick = mnick;
	}



	public String getBname() {
		return bname;
	}



	public void setBname(String bname) {
		this.bname = bname;
	}



	@Override
	public String toString() {
		return "Coment [cid=" + cid + ", bid=" + bid + ", mno=" + mno + ", ccontent=" + ccontent + ", cdate=" + cdate
				+ ", clevel=" + clevel + ", cref=" + cref + ", rflag=" + rflag + ", delFlag=" + delFlag + ", mnick="
				+ mnick + ", bname=" + bname + "]";
	}



	

	
	
	
}
