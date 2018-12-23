package com.kh.mhm.board.model.vo;

public class BoardType extends Board {

	private int bCode;
	private String bName;


	public BoardType() {
		super();
	}


	public BoardType(int bCode, String bName) {
		super();
		this.bCode = bCode;
		this.bName = bName;
	}


	public int getbCode() {
		return bCode;
	}


	public void setbCode(int bCode) {
		this.bCode = bCode;
	}


	public String getbName() {
		return bName;
	}


	public void setbName(String bName) {
		this.bName = bName;
	}


	@Override
	public String toString() {
		return "BoardType [bCode=" + bCode + ", bName=" + bName + "]";
	}



}
