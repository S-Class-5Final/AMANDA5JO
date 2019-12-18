package com.fianl.AMANDA.chat.model.vo;

import java.sql.Date;

public class Chat {
	private int chatId;			// 채팅방 시퀀스
	private String chatRoom;	// 채팅방 이름 ( 빠른 회원번호,느린 회원번호 )
	private Date createDate;	// 채팅방 생성일
	private Date modifyDate;	// 채팅방 차단 날짜
	private int u_mId;	// 회원번호 1 빠른 번호
	private int u_mId2;	// 회원번호 2 느린 번호
	private String status;	// 채팅방 활성화시 Y 차단시 N
	
	public Chat() {}

	public Chat(int chatId, String chatRoom, Date createDate, Date modifyDate, int u_mId, int u_mId2, String status) {
		this.chatId = chatId;
		this.chatRoom = chatRoom;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.u_mId = u_mId;
		this.u_mId2 = u_mId2;
		this.status = status;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(String chatRoom) {
		this.chatRoom = chatRoom;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getU_mId() {
		return u_mId;
	}

	public void setU_mId(int u_mId) {
		this.u_mId = u_mId;
	}

	public int getU_mId2() {
		return u_mId2;
	}

	public void setU_mId2(int u_mId2) {
		this.u_mId2 = u_mId2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", chatRoom=" + chatRoom + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", u_mId=" + u_mId + ", u_mId2=" + u_mId2 + ", status=" + status + "]";
	}
	
}
