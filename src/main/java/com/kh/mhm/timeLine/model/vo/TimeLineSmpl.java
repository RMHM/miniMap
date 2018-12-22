package com.kh.mhm.timeLine.model.vo;

public class TimeLineSmpl {

	private int mNo;
	private String tContent;


	public TimeLineSmpl() {
		super();
	}


	public TimeLineSmpl(int mNo, String tContent) {
		super();
		this.mNo = mNo;
		this.tContent = tContent;
	}


	@Override
	public String toString() {
		return "TimeLineSmpl [mNo=" + mNo + ", tContent=" + tContent + "]";
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String gettContent() {
		return tContent;
	}


	public void settContent(String tContent) {
		this.tContent = tContent;
	}

}
