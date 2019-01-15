package com.kh.mhm.likes.model.vo;

import java.sql.Date;

public class Likes {
	
	private int lid;
	private int target_bid;
	private int like_mno;
	private Date ldate;
	
	private Likes() {
		super();
	}

	public Likes(int lid, int target_bid, int like_mno, Date ldate) {
		super();
		this.lid = lid;
		this.target_bid = target_bid;
		this.like_mno = like_mno;
		this.ldate = ldate;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getTarget_bid() {
		return target_bid;
	}

	public void setTarget_bid(int target_bid) {
		this.target_bid = target_bid;
	}

	public int getLike_mno() {
		return like_mno;
	}

	public void setLike_mno(int like_mno) {
		this.like_mno = like_mno;
	}

	public Date getLdate() {
		return ldate;
	}

	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}

	@Override
	public String toString() {
		return "Likes [lid=" + lid + ", target_bid=" + target_bid + ", like_mno=" + like_mno + ", ldate=" + ldate + "]";
	}
	
	
	

}
