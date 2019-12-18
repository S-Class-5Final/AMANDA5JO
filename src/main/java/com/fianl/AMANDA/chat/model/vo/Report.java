package com.fianl.AMANDA.chat.model.vo;

import java.sql.Date;

public class Report {
	private int rKey;
	private int u_Mid;
	private String r_user_Id;
	private String r_Type;
	private String r_Contents;
	private Date date;
	private String status;
	
	public Report() {
	}
	public Report(int rKey, int u_Mid, String r_user_Id, String r_Type, String r_Contents, Date date, String status) {
		this.rKey = rKey;
		this.u_Mid = u_Mid;
		this.r_user_Id = r_user_Id;
		this.r_Type = r_Type;
		this.r_Contents = r_Contents;
		this.date = date;
		this.status = status;
	}
	public int getrKey() {
		return rKey;
	}
	public void setrKey(int rKey) {
		this.rKey = rKey;
	}
	public int getU_Mid() {
		return u_Mid;
	}
	public void setU_Mid(int u_Mid) {
		this.u_Mid = u_Mid;
	}
	public String getR_user_Id() {
		return r_user_Id;
	}
	public void setR_user_Id(String r_user_Id) {
		this.r_user_Id = r_user_Id;
	}
	public String getR_Type() {
		return r_Type;
	}
	public void setR_Type(String r_Type) {
		this.r_Type = r_Type;
	}
	public String getR_Contents() {
		return r_Contents;
	}
	public void setR_Contents(String r_Contents) {
		this.r_Contents = r_Contents;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Report [rKey=" + rKey + ", u_Mid=" + u_Mid + ", r_user_Id=" + r_user_Id + ", r_Type=" + r_Type
				+ ", r_Contents=" + r_Contents + ", date=" + date + ", status=" + status + "]";
	}
	
	
	
}
