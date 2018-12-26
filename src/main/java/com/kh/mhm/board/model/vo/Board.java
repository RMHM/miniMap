package com.kh.mhm.board.model.vo;

import java.sql.Date;

public class Board {

	private int bId;
	private int mNo;
	private int bNo;
	private int bCode;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int likes;
	private String rFlag;
	private String delFlag;
	private String hasFile;
	private String isNotice;
	private int bCount;


	public Board() {
		super();
	}


	public Board(int bId, int mNo, int bNo, int bCode, String bTitle, String bContent, Date bDate, int likes,
			String rFlag, String delFlag, String hasFile, String isNotice, int bCount) {
		super();
		this.bId = bId;
		this.mNo = mNo;
		this.bNo = bNo;
		this.bCode = bCode;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.likes = likes;
		this.rFlag = rFlag;
		this.delFlag = delFlag;
		this.hasFile = hasFile;
		this.isNotice = isNotice;
		this.bCount = bCount;
	}


	public int getBId() {
		return bId;
	}


	public void setBId(int bId) {
		this.bId = bId;
	}


	public int getMNo() {
		return mNo;
	}


	public void setMNo(int mNo) {
		this.mNo = mNo;
	}


	public int getBNo() {
		return bNo;
	}


	public void setBNo(int bNo) {
		this.bNo = bNo;
	}


	public int getBCode() {
		return bCode;
	}


	public void setBCode(int bCode) {
		this.bCode = bCode;
	}


	public String getBTitle() {
		return bTitle;
	}


	public void setBTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getBContent() {
		return bContent;
	}


	public void setBContent(String bContent) {
		this.bContent = bContent;
	}


	public Date getBDate() {
		return bDate;
	}


	public void setBDate(Date bDate) {
		this.bDate = bDate;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


	public String getRFlag() {
		return rFlag;
	}


	public void setRFlag(String rFlag) {
		this.rFlag = rFlag;
	}


	public String getDelFlag() {
		return delFlag;
	}


	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}


	public String getHasFile() {
		return hasFile;
	}


	public void setHasFile(String hasFile) {
		this.hasFile = hasFile;
	}


	public String getIsNotice() {
		return isNotice;
	}


	public void setIsNotice(String isNotice) {
		this.isNotice = isNotice;
	}


	public int getBCount() {
		return bCount;
	}


	public void setBCount(int bCount) {
		this.bCount = bCount;
	}


	@Override
	public String toString() {
		return "Board [bId=" + bId + ", mNo=" + mNo + ", bNo=" + bNo + ", bCode=" + bCode + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bDate=" + bDate + ", likes=" + likes + ", rFlag=" + rFlag + ", delFlag="
				+ delFlag + ", hasFile=" + hasFile + ", isNotice=" + isNotice + ", bCount=" + bCount + "]";
	}




}
