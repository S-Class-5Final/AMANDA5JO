package com.fianl.AMANDA.chat.model.vo;

import java.sql.Date;

public class ChatRoom {
	private int crId;			// 채팅 시퀀스
	private int chatId;			// 채팅방 번호 시퀀스
	private String chatUser;	//
	private String c_Content;	// 채팅 내용 (이미지일시 chatId_날짜 형식으로 저장)
	private Date chatDate;		// 채팅 날짜
	private String chatTime;		// 채팅 시간
	private int confirm;		// 채팅 확인 유무
	private String status;		// 삭제 유무
	private String img_status;	// 사진 채팅 유무
	
	public ChatRoom() {}

	public ChatRoom(int crId, int chatId, String chatUser, String c_Content, Date chatDate, String chatTime,
			int confirm, String status, String img_status) {
		this.crId = crId;
		this.chatId = chatId;
		this.chatUser = chatUser;
		this.c_Content = c_Content;
		this.chatDate = chatDate;
		this.chatTime = chatTime;
		this.confirm = confirm;
		this.status = status;
		this.img_status = img_status;
	}

	public int getCrId() {
		return crId;
	}

	public void setCrId(int crId) {
		this.crId = crId;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getChatUser() {
		return chatUser;
	}

	public void setChatUser(String chatUser) {
		this.chatUser = chatUser;
	}

	public String getC_Content() {
		return c_Content;
	}

	public void setC_Content(String c_Content) {
		this.c_Content = c_Content;
	}

	public Date getChatDate() {
		return chatDate;
	}

	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	public int getConfirm() {
		return confirm;
	}

	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImg_status() {
		return img_status;
	}

	public void setImg_status(String img_status) {
		this.img_status = img_status;
	}

	@Override
	public String toString() {
		return "ChatRoom [crId=" + crId + ", chatId=" + chatId + ", chatUser=" + chatUser + ", c_Content=" + c_Content
				+ ", chatDate=" + chatDate + ", chatTime=" + chatTime + ", confirm=" + confirm + ", status=" + status
				+ ", img_status=" + img_status + "]";
	}
	
}
