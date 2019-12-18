package com.fianl.AMANDA.report.model.vo;

import java.sql.Date;

import oracle.sql.NUMBER;

public class Report {
	private int rkey; //  시퀸스 신고번호;
	private int u_mid; // 시퀸스 회원번호;
	private String r_user_id; // 신고당한 유저 아이디 
	private String r_type;  //1.부적절한 사진 2. 스팸으로 의심 3.부적절한 메세지 4.기타 (y,n) 
	private String r_contents; // 신고내용
	private Date r_date; // 신고당한 마지막 날짜
	private String status; // 신고에 대한 관리자 확인 여부
	public Report() {
	}

	
	
	public Report(int rkey, int u_mid, String r_user_id, String r_type, String r_contents, Date r_date, String status) {
		super();
		this.rkey = rkey;
		this.u_mid = u_mid;
		this.r_user_id = r_user_id;
		this.r_type = r_type;
		this.r_contents = r_contents;
		this.r_date = r_date;
		this.status = status;
	}
	public int getRkey() {
		return rkey;
	}
	public void setRkey(int rkey) {
		this.rkey = rkey;
	}
	public int getU_mid() {
		return u_mid;
	}
	public void setU_mid(int u_mid) {
		this.u_mid = u_mid;
	}
	public String getR_user_id() {
		return r_user_id;
	}
	public void setR_user_id(String r_user_id) {
		this.r_user_id = r_user_id;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Report [rkey=" + rkey + ", u_mid=" + u_mid + ", r_user_id=" + r_user_id + ", r_type=" + r_type
				+ ", r_contents=" + r_contents + ", r_date=" + r_date + ", status=" + status + "]";
	}
	
	
	
}

