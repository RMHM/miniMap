package com.kh.mhm.message.model.vo;

import java.io.Serializable;

public class MessageSmpl implements Serializable {
	
	private int mNo;
	private String mNick;
	private String meTitle;
	private String meContent;
	
	public MessageSmpl() {
		super();
	}

	public MessageSmpl(int mNo, String mNick, String meTitle, String meContent) {
		super();
		this.mNo = mNo;
		this.mNick = mNick;
		this.meTitle = meTitle;
		this.meContent = meContent;
	}

	@Override
	public String toString() {
		return "MessageSmpl [mNo=" + mNo + ", mNick=" + mNick + ", meTitle=" + meTitle + ", meContent=" + meContent
				+ "]";
	}
	
	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getMeTitle() {
		return meTitle;
	}

	public void setMeTitle(String meTitle) {
		this.meTitle = meTitle;
	}

	public String getMeContent() {
		return meContent;
	}

	public void setMeContent(String meContent) {
		this.meContent = meContent;
	}
	
}
