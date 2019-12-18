package com.fianl.AMANDA.chat.model.service;

import java.util.ArrayList;

import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.chat.model.vo.ChatInfo;
import com.fianl.AMANDA.chat.model.vo.ChatRoom;
import com.fianl.AMANDA.chat.model.vo.ChatUser;
import com.fianl.AMANDA.chat.model.vo.MemberImg;
import com.fianl.AMANDA.chat.model.vo.Report;


public interface ChatService {
	
	public int createChat(Chat chat);	// 채팅방 생성

	public ChatInfo selectChat(String chatRoom);	// 채팅방 찾기
	
	public ArrayList<ChatInfo> selectAllChat(String userName);	// 모든 채팅방 찾기
	
	public ArrayList<ChatRoom> allChatContent(int chatId);	// 채팅 전체 내용 출력
	
	public int insertChatRoom(ChatRoom room);	// 채팅 내용 입력
	
	public int updateChatRoom(int crId);	// 채팅 삭제
	
	public int updateChat(int chatId);		// 채팅방 차단
	
	public int updateConfirm(int crId);		// 채팅 확인 시
	
	public int insertImgChat(ArrayList<ChatRoom> chatRoom);	// 이미지 저장
	
	public ArrayList<ChatRoom> lastInsertChat(String chatName, int insertCount); // DB에 insert한 값 가져오기
	
	public int insertReport(Report re);	// 신고
	
	public ArrayList<ChatUser> findMainImg(ArrayList<ChatUser> cu);
	
	public ArrayList<MemberImg> findAllImg(ChatInfo chat);
	
}
