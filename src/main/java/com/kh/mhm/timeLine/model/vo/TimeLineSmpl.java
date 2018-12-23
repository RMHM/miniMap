package com.kh.mhm.timeLine.model.vo;

public class TimeLineSmpl {

	private int mNo;
	private String tContent;
	private String hashTag;

	public TimeLineSmpl() {
		super();
	}

	public TimeLineSmpl(int mNo, String tContent, String hashTag) {
		super();
		this.mNo = mNo;
		this.tContent = tContent;
		this.hashTag = hashTag;
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

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	
	@Override
	public String toString() {
		return "TimeLineSmpl [mNo=" + mNo + ", tContent=" + tContent + ", hashTag=" + hashTag + "]";
	}
	
}
