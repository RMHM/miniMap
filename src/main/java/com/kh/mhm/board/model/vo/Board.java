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


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getbCode() {
		return bCode;
	}


	public void setbCode(int bCode) {
		this.bCode = bCode;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	public Date getbDate() {
		return bDate;
	}


	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


	public String getrFlag() {
		return rFlag;
	}


	public void setrFlag(String rFlag) {
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


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	@Override
	public String toString() {
		return "Board [bId=" + bId + ", mNo=" + mNo + ", bNo=" + bNo + ", bCode=" + bCode + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bDate=" + bDate + ", likes=" + likes + ", rFlag=" + rFlag + ", delFlag="
				+ delFlag + ", hasFile=" + hasFile + ", isNotice=" + isNotice + ", bCount=" + bCount + "]";
	}




}
