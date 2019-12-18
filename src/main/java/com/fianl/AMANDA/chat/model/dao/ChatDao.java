package com.fianl.AMANDA.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.chat.model.vo.ChatInfo;
import com.fianl.AMANDA.chat.model.vo.ChatRoom;
import com.fianl.AMANDA.chat.model.vo.ChatUser;
import com.fianl.AMANDA.chat.model.vo.MemberImg;
import com.fianl.AMANDA.chat.model.vo.Report;

@Repository("cDao")
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ChatRoom> allChatContent(int chatId) {
		
		return (ArrayList)sqlSession.selectList("ChatMapper.allChatContent", chatId);
	}

	public int createChat(Chat chat) {
		
		return sqlSession.insert("ChatMapper.createChat", chat);
	}

	public int insertChatRoom(ChatRoom room) {
		
		return sqlSession.insert("ChatMapper.insertChatRoom", room);
	}

	public int updateChatRoom(int crId) {
		
		return sqlSession.update("ChatMapper.updateChatRoom",crId);
	}

	public int updateChat(int chatId) {
		
		return sqlSession.update("ChatMapper.updateChat",chatId);
	}

	public int updateConfirm(int crId) {
		
		return sqlSession.update("ChatMapper.updateConfirm",crId);
	}

	public ChatInfo selectChat(String chatRoom) {
		
		return sqlSession.selectOne("ChatMapper.selectChat", chatRoom);
	}

	public ArrayList<ChatInfo> selectAllChat(String userName) {
		return (ArrayList)sqlSession.selectList("ChatMapper.selectAllChat", userName);
	}

	public int insertImgChat(ArrayList<ChatRoom> chatRoom) {
		int result = 0;
		for(ChatRoom c : chatRoom) {
			result += sqlSession.insert("ChatMapper.insertImgChat", c);
		}
		return result;
	}

	public ArrayList<ChatRoom> lastInsertChat(String chatName, int insertCount) {
		RowBounds rowBounds = new RowBounds(0, insertCount);
		return (ArrayList)sqlSession.selectList("ChatMapper.lastInsertChat", chatName, rowBounds);
	}

	public int insertReport(Report re) {
		return sqlSession.insert("ChatMapper.insertReport",re);
	}

	public ArrayList<ChatUser> findMainImg(ArrayList<ChatUser> cu) {
		
		
		return (ArrayList)sqlSession.selectList("ChatMapper.findMainImg", cu);
	}

	public ArrayList<MemberImg> findAllImg(ChatInfo chat) {
		return (ArrayList)sqlSession.selectList("ChatMapper.findAllImg", chat);
	}
	
	
}
