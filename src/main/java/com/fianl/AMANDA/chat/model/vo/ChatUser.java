package com.fianl.AMANDA.chat.model.vo;

public class ChatUser {
	private String userId;
	private int chatId;
	private int uMid;
	private String userNick;
	private String renameFileName;
	private int conSum;
	
	public ChatUser() {}

	public ChatUser(String userId, int chatId, int uMid, String userNick, String renameFileName, int conSum) {
		this.userId = userId;
		this.chatId = chatId;
		this.uMid = uMid;
		this.userNick = userNick;
		this.renameFileName = renameFileName;
		this.conSum = conSum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public int getuMid() {
		return uMid;
	}

	public void setuMid(int uMid) {
		this.uMid = uMid;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getConSum() {
		return conSum;
	}

	public void setConSum(int conSum) {
		this.conSum = conSum;
	}

	@Override
	public String toString() {
		return "ChatUser [userId=" + userId + ", chatId=" + chatId + ", uMid=" + uMid + ", userNick=" + userNick
				+ ", renameFileName=" + renameFileName + ", conSum=" + conSum + "]";
	}
	
}
