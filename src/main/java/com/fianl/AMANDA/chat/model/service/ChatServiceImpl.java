package com.fianl.AMANDA.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.chat.model.dao.ChatDao;
import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.chat.model.vo.ChatInfo;
import com.fianl.AMANDA.chat.model.vo.ChatRoom;
import com.fianl.AMANDA.chat.model.vo.ChatUser;
import com.fianl.AMANDA.chat.model.vo.MemberImg;
import com.fianl.AMANDA.chat.model.vo.Report;



@Service("chService")
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao chDao;
	
	@Override
	public ArrayList<ChatRoom> allChatContent(int chatId) {

		return chDao.allChatContent(chatId);
	}

	@Override
	public int createChat(Chat chat) {
		
		return chDao.createChat(chat);
	}
	
	@Override
	public int insertChatRoom(ChatRoom room) {
		
		return chDao.insertChatRoom(room);
	}

	@Override
	public int updateChatRoom(int crId) {
		
		return chDao.updateChatRoom(crId);
	}

	@Override
	public int updateChat(int chatId) {
		
		return chDao.updateChat(chatId);
	}

	@Override
	public int updateConfirm(int crId) {
		
		return chDao.updateConfirm(crId);
	}

	@Override
	public ChatInfo selectChat(String chatRoom) {
		
		return chDao.selectChat(chatRoom);
	}

	@Override
	public ArrayList<ChatInfo> selectAllChat(String userName) {
		
		return chDao.selectAllChat(userName);
	}

	@Override
	public int insertImgChat(ArrayList<ChatRoom> chatRoom) {
		
		return chDao.insertImgChat(chatRoom);
	}

	@Override
	public ArrayList<ChatRoom> lastInsertChat(String chatName, int insertCount) {

		return chDao.lastInsertChat(chatName, insertCount);
	}

	@Override
	public int insertReport(Report re) {
		return chDao.insertReport(re);
	}

	@Override
	public ArrayList<ChatUser> findMainImg(ArrayList<ChatUser> cu) {
		
		return chDao.findMainImg(cu);
	}

	@Override
	public ArrayList<MemberImg> findAllImg(ChatInfo chat) {
		return chDao.findAllImg(chat);
	}


}
