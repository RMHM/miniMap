package com.kh.mhm.timeLine.model.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PreTimeLine {
	
	private String profile_path;
	private String mNick;
	private String tDate;
	private String tContent;
	private String hashTag;
	
	public PreTimeLine() {
		super();
	}

	public PreTimeLine(String profile_path, String mNick, Timestamp tDate, String tContent, String hashTag) {
		super();
		this.profile_path = profile_path;
		this.mNick = mNick;
		this.tDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(tDate);
		this.tContent = tContent;
		this.hashTag = hashTag;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String gettDate() {
		return tDate;
	}

	public void settDate(Timestamp tDate) {
		this.tDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(tDate);
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
		return "PreTimeLine [profile_path=" + profile_path + ", mNick=" + mNick + ", tDate=" + tDate + ", tContent="
				+ tContent + ", hashTag=" + hashTag + "]";
	}
	
}
