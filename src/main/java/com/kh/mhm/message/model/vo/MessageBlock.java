package com.kh.mhm.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MessageBlock implements Serializable {
	
	private int mNo;
	private String block_mNick;
	private Date block_date;
	private String block_note;
	
	public MessageBlock() {
		super();
	}

	public MessageBlock(int mNo, String block_mNick, Date block_date, String block_note) {
		super();
		this.mNo = mNo;
		this.block_mNick = block_mNick;
		this.block_date = block_date;
		this.block_note = block_note;
	}

	@Override
	public String toString() {
		return "MessageBlock [mNo=" + mNo + ", block_mNick=" + block_mNick + ", block_date=" + block_date
				+ ", block_note=" + block_note + "]";
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getBlock_mNick() {
		return block_mNick;
	}

	public void setBlock_mNick(String block_mNick) {
		this.block_mNick = block_mNick;
	}

	public Date getBlock_date() {
		return block_date;
	}

	public void setBlock_date(Date block_date) {
		this.block_date = block_date;
	}

	public String getBlock_note() {
		return block_note;
	}

	public void setBlock_note(String block_note) {
		this.block_note = block_note;
	}
	
	
}
