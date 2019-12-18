package com.fianl.AMANDA.chat.model.vo;


public class ChatInfo {
	private int chatId;			// 채팅방 시퀀스
	private String chatRoom;	// 채팅방 이름 ( 빠른 회원번호,느린 회원번호 )
	private String user_Id;		// 회원번호 1 빠른 번호의 아이디
	private String user_Id2;	// 회원번호 2 느린 번호의 아이디
	private String userName;	// u_mId의 이름
	private String userName2;	// u_mId2의 이름
	private String status;
	
	public ChatInfo() {
	
	}

	public ChatInfo(int chatId, String chatRoom, String user_Id, String user_Id2, String userName, String userName2,
			String status) {
		this.chatId = chatId;
		this.chatRoom = chatRoom;
		this.user_Id = user_Id;
		this.user_Id2 = user_Id2;
		this.userName = userName;
		this.userName2 = userName2;
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

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getUser_Id2() {
		return user_Id2;
	}

	public void setUser_Id2(String user_Id2) {
		this.user_Id2 = user_Id2;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName2() {
		return userName2;
	}

	public void setUserName2(String userName2) {
		this.userName2 = userName2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ChatInfo [chatId=" + chatId + ", chatRoom=" + chatRoom + ", user_Id=" + user_Id + ", user_Id2="
				+ user_Id2 + ", userName=" + userName + ", userName2=" + userName2 + ", status=" + status + "]";
	}
}
