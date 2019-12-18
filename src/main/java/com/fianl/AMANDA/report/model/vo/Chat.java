package com.fianl.AMANDA.report.model.vo;

import java.sql.Date;

public class Chat {
	private int chatid;
	private String chatroom;
	private Date createdate;
	private Date modifydate;
	private int u_mid;
	private int u_mid2;
	private String status;
	public Chat() {
	}
	public Chat(int chatid, String chatroom, Date createdate, Date modifydate, int u_mid, int u_mid2, String status) {
		super();
		this.chatid = chatid;
		this.chatroom = chatroom;
		this.createdate = createdate;
		this.modifydate = modifydate;
		this.u_mid = u_mid;
		this.u_mid2 = u_mid2;
		this.status = status;
	}
	public int getChatid() {
		return chatid;
	}
	public void setChatid(int chatid) {
		this.chatid = chatid;
	}
	public String getChatroom() {
		return chatroom;
	}
	public void setChatroom(String chatroom) {
		this.chatroom = chatroom;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	public int getU_mid() {
		return u_mid;
	}
	public void setU_mid(int u_mid) {
		this.u_mid = u_mid;
	}
	public int getU_mid2() {
		return u_mid2;
	}
	public void setU_mid2(int u_mid2) {
		this.u_mid2 = u_mid2;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "chat [chatid=" + chatid + ", chatroom=" + chatroom + ", createdate=" + createdate + ", modifydate="
				+ modifydate + ", u_mid=" + u_mid + ", u_mid2=" + u_mid2 + ", status=" + status + "]";
	}
	
	
}
