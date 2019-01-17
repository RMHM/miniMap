package com.kh.mhm.timeLine.model.vo;

import java.io.Serializable;

public class TimeLineSmpl implements Serializable {
	
	private String tType;
	private int mNo;
	private String tContent;
	private String hashTag;

	public TimeLineSmpl() {
		super();
	}

	public TimeLineSmpl(String tType, int mNo, String tContent, String hashTag) {
		super();
		this.tType=tType;
		this.mNo = mNo;
		this.tContent = tContent;
		this.hashTag = hashTag;
	}

	public String gettType() {
		return tType;
	}

	public void settType(String tType) {
		this.tType = tType;
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
		return "TimeLineSmpl [tType=" + tType + ", mNo=" + mNo + ", tContent=" + tContent + ", hashTag=" + hashTag
				+ "]";
	}
	
	
	
}
