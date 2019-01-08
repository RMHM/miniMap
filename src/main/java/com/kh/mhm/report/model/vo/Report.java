package com.kh.mhm.report.model.vo;

import java.sql.Date;

public class Report {

	private int rid        ;
	private char target_type;
	private int target_id  ;
	private int rcode      ;
	private char rflag      ;
	private int report_mno ;
	private Date rdate      ;
	private String rdetail    ;
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int rid, char target_type, int target_id, int rcode, char rflag, int report_mno, Date rdate,
			String rdetail) {
		super();
		this.rid = rid;
		this.target_type = target_type;
		this.target_id = target_id;
		this.rcode = rcode;
		this.rflag = rflag;
		this.report_mno = report_mno;
		this.rdate = rdate;
		this.rdetail = rdetail;
	}
	public Report(char target_type, int target_id, int rcode, int report_mno, String rdetail) {
		super();
		this.target_type = target_type;
		this.target_id = target_id;
		this.rcode = rcode;
		this.report_mno = report_mno;
		this.rdetail = rdetail;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public char getTarget_type() {
		return target_type;
	}
	public void setTarget_type(char target_type) {
		this.target_type = target_type;
	}
	public int getTarget_id() {
		return target_id;
	}
	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}
	public int getRcode() {
		return rcode;
	}
	public void setRcode(int rcode) {
		this.rcode = rcode;
	}
	public char getRflag() {
		return rflag;
	}
	public void setRflag(char rflag) {
		this.rflag = rflag;
	}
	public int getReport_mno() {
		return report_mno;
	}
	public void setReport_mno(int report_mno) {
		this.report_mno = report_mno;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRdetail() {
		return rdetail;
	}
	public void setRdetail(String rdetail) {
		this.rdetail = rdetail;
	}
	@Override
	public String toString() {
		return "Report [rid=" + rid + ", target_type=" + target_type + ", target_id=" + target_id + ", rcode=" + rcode
				+ ", rflag=" + rflag + ", report_mno=" + report_mno + ", rdate=" + rdate + ", rdetail=" + rdetail + "]";
	}
	
	
	
	
}
