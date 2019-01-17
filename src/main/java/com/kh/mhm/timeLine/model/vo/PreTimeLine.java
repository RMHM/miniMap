package com.kh.mhm.timeLine.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PreTimeLine implements Serializable {
	
	private int tId;
	private String tSort;
	private String profile_path;
	private String mNick;
	private String tDate;
	private String tContent;
	private String hashTag;
	
	public PreTimeLine() {
		super();
	}

	public PreTimeLine(int tId, String tSort, String profile_path, String mNick, Timestamp tDate, String tContent, String hashTag) {
		super();
		this.tId=tId;
		this.tSort=tSort;
		this.profile_path = profile_path;
		this.mNick = mNick;
		this.tDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(tDate);
		this.tContent = tContent;
		this.hashTag = hashTag;
	}
	
	

	public int getTId() {
		return tId;
	}

	public void setTId(int tId) {
		this.tId = tId;
	}
	
	

	public String getTSort() {
		return tSort;
	}

	public void setTSort(String tSort) {
		this.tSort = tSort;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getMNick() {
		return mNick;
	}

	public void setMNick(String mNick) {
		this.mNick = mNick;
	}

	public String getTDate() {
		return tDate;
	}

	public void setTDate(Timestamp tDate) {
		this.tDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(tDate);
	}

	public String getTContent() {
		return tContent;
	}

	public void setTContent(String tContent) {
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
				+ tContent + ", hashTag=" + hashTag + "tId="+tId+"]";
	}
	
}
