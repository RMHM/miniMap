package com.kh.mhm.board.model.vo;

public class Fileref {

	private int fId;
	private int bId;
	private String fType;
	private String origin_Name;
	private String change_Name;
	private String delFlag;


	public Fileref() {
		super();
	}
	public Fileref(int fId, int bId, String fType, String origin_Name, String change_Name, String delFlag) {
		super();
		this.fId = fId;
		this.bId = bId;
		this.fType = fType;
		this.origin_Name = origin_Name;
		this.change_Name = change_Name;
		this.delFlag = delFlag;
	}

	public int getfId() {
		return fId;
	}


	public void setfId(int fId) {
		this.fId = fId;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public String getfType() {
		return fType;
	}


	public void setfType(String fType) {
		this.fType = fType;
	}


	public String getOrigin_Name() {
		return origin_Name;
	}


	public void setOrigin_Name(String origin_Name) {
		this.origin_Name = origin_Name;
	}


	public String getChange_Name() {
		return change_Name;
	}


	public void setChange_Name(String change_Name) {
		this.change_Name = change_Name;
	}


	public String getDelFlag() {
		return delFlag;
	}


	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}


	@Override
	public String toString() {
		return "fileref [fId=" + fId + ", bId=" + bId + ", fType=" + fType + ", origin_Name=" + origin_Name
				+ ", change_Name=" + change_Name + ", delFlag=" + delFlag + "]";
	}



}
