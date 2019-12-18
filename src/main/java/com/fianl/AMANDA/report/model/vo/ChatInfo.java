package com.fianl.AMANDA.report.model.vo;

public class ChatInfo {
	private int chatid;
	private String chatroom;
	private String user_id;
	private String user_id2;
	private String username;
	private String username2;
	private String status;
	public ChatInfo() {
	}
	public ChatInfo(int chatid, String chatroom, String user_id, String user_id2, String username, String username2,
			String status) {
		super();
		this.chatid = chatid;
		this.chatroom = chatroom;
		this.user_id = user_id;
		this.user_id2 = user_id2;
		this.username = username;
		this.username2 = username2;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_id2() {
		return user_id2;
	}
	public void setUser_id2(String user_id2) {
		this.user_id2 = user_id2;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername2() {
		return username2;
	}
	public void setUsername2(String username2) {
		this.username2 = username2;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ChatInfo [chatid=" + chatid + ", chatroom=" + chatroom + ", user_id=" + user_id + ", user_id2="
				+ user_id2 + ", username=" + username + ", username2=" + username2 + ", status=" + status + "]";
	}
	

}
