package com.fianl.AMANDA.chat.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.chat.model.exception.ChatException;
import com.fianl.AMANDA.chat.model.service.ChatService;
import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.chat.model.vo.ChatInfo;
import com.fianl.AMANDA.chat.model.vo.ChatRoom;
import com.fianl.AMANDA.chat.model.vo.ChatUser;
import com.fianl.AMANDA.chat.model.vo.MemberImg;
import com.fianl.AMANDA.chat.model.vo.Report;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class ChatController {

	@Autowired
	ChatService chService;

	// 채팅방 찾기
	@SuppressWarnings("null")
	@RequestMapping(value = "chChat.do")
	public ModelAndView connectChatView(ModelAndView mv, @RequestParam("user1") Integer u_mId,
			@RequestParam("user2") Integer u_mId2) {
		String chatRoom;
		// 번호가 빠른순이 앞에 존재해야 하기 때문에
		if (u_mId > u_mId2) {
			chatRoom = u_mId2 + "," + u_mId;
		} else {
			chatRoom = u_mId + "," + u_mId2;
		}
		ChatInfo chat = chService.selectChat(chatRoom);
		ArrayList<MemberImg> chatImg;
		if (chat != null) {
			chatImg = chService.findAllImg(chat);
			mv.addObject("chat", chat).addObject("userImg", chatImg).setViewName("chat/chatView");
			
		}else if(chat.getStatus().equals("N")){
			mv.addObject("fail", "fail").setViewName("chat/chatView");
		}else {
			// 채팅방 정보가 없을 시 생성하고 전송
			chat = createChat(chatRoom, u_mId, u_mId2);
			chatImg = chService.findAllImg(chat);
			mv.addObject("chat", chat).addObject("userImg", chatImg).setViewName("chat/chatView");
		}
		return mv;
	}

	// 자신의 모든 채팅방 찾기
	@RequestMapping(value = "chAllChat.do")
	public void AllChatSearch(HttpServletResponse response, String userName) throws JsonIOException, IOException {

		ArrayList<ChatInfo> allChat = chService.selectAllChat(userName);

		Gson gson = new Gson();
		if (allChat.size() != 0 && allChat != null) {
			gson.toJson(allChat, response.getWriter());
		} else {
			gson.toJson("noChat", response.getWriter());
		}
	}

	// 채팅방 db값 생성
	public ChatInfo createChat(String chatRoom, int u_mId, int u_mId2) {
		Chat chat = new Chat();
		chat.setChatRoom(chatRoom);
		chat.setU_mId(u_mId);
		chat.setU_mId2(u_mId2);
		int result = chService.createChat(chat);

		if (result > 0) {
			return chService.selectChat(chatRoom);
		} else {
			throw new ChatException("채팅방 DB값 생성 실패!!");
		}
	}

	// 채팅 내용 삽입
	@RequestMapping(value = "chInsertChat.do")
	public void insertChatConent(HttpServletResponse response, ChatRoom chatRoom) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		int result = chService.insertChatRoom(chatRoom);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		ArrayList<ChatRoom> chat = chService.lastInsertChat(chatRoom.getChatUser(), 1);
		
		if (result > 0) {
			gson.toJson(chat, response.getWriter());
		} else {
			gson.toJson("fail", response.getWriter());
		}
	}

	@RequestMapping(value = "chAllContent.do")
	public void allChatContent(HttpServletResponse response, int chatId) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<ChatRoom> chatroom = chService.allChatContent(chatId);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		if (chatroom.size() > 0) {
			gson.toJson(chatroom, response.getWriter());
		} else {
			gson.toJson("fail", response.getWriter());
		}

	}

	@RequestMapping(value = "chImgInsert.do")
	public void chatImgInsert(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false) ArrayList<MultipartFile> files, ChatRoom chatRoom)
			throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		ArrayList<ChatRoom> chat = new ArrayList<ChatRoom>();
		
		System.out.println(files);
		// 파일 저장
		int addIndex = 0;
		for(MultipartFile mf : files) {
			addIndex++;
			ChatRoom c = new ChatRoom();
			c.setChatUser(chatRoom.getChatUser());
			c.setChatId(chatRoom.getChatId());
			c.setImg_status(chatRoom.getImg_status());
			String renameFile = saveFile(mf, request, chatRoom.getChatUser(), addIndex);
			if(renameFile != null && renameFile != "") {
				c.setC_Content(renameFile);
				chat.add(c);
			}else {
				gson.toJson("fail", response.getWriter());
			}
		}
		ArrayList<ChatRoom> chatContent = new ArrayList<ChatRoom>();
		// DB에 채팅값 저장
		if(chat.size() >0) {
			int result = chService.insertImgChat(chat);
			if(result>0) {
				chatContent = chService.lastInsertChat(chatRoom.getChatUser(), result);				
			}
		}
		if(chatContent.size() > 0) {
			gson.toJson(chatContent, response.getWriter());
		}else {
			gson.toJson("fail", response.getWriter());
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request, String user, int i) { // 파일이 저장될 경로를 설정하는 메소드

		// 웹 서버의 contextPath(webapp)을 불러 와서 그 아래 resources 경로를 String으로 뽑자 
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\chatImg";

		File folder = new File(savePath);

		// nuploadFiles가 없으면 생성해라. 
		if(!folder.exists()) { folder.mkdirs(); }

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + user+"_"+i+"_"+ renameFileName;
		try {
			file.transferTo(new File(filePath)); // 이 때 파일이 저장된다. // 이게 실행되서 파일이 경로에 저장될려면 pom.xml에서 파일 업로드관련 라이브러리 두개를
													// 추가하고 // root-context.xml에서 파일 크기 지정을 해줘야지만 파일이 저장된다!!!!!!!!!!!
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return user+"_"+i+"_"+renameFileName;
	}
	
	@RequestMapping("declarUser.do")
	public void declarUser(HttpServletResponse response, Report re, int chatId) throws JsonIOException, IOException {
		System.out.println(re);
		
		int result = chService.insertReport(re);
		Gson gson = new Gson();
		if(result >0) {
			result = chService.updateChat(chatId);
			if(result >0) {
				gson.toJson("success", response.getWriter());
			}else {
				gson.toJson("fail", response.getWriter());
			}
		}else {
			gson.toJson("fail", response.getWriter());
		}
	}
	
	@RequestMapping("chfindChat.do")
	public void findChat(HttpServletResponse response, String userName) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<ChatInfo> chatList = chService.selectAllChat(userName);
		ArrayList<ChatUser> cu = new ArrayList<ChatUser>();

		if(chatList != null && chatList.size() > 0) {
			for(ChatInfo c : chatList) {
				ChatUser user = new ChatUser();
				if(c.getUserName().equals(userName)) {
					user.setUserNick(c.getUserName());
					user.setChatId(c.getChatId());
				}else {
					user.setUserNick(c.getUserName2());
					user.setChatId(c.getChatId());
				}
				cu.add(user);
			}
		}
		
		cu = chService.findMainImg(cu);
		/*
		 * HashMap<String, ArrayList> map = new HashMap<String, ArrayList>();
		 * map.put("chatRoom", chatList); map.put("user", cu);
		 */
		
		Gson gson = new Gson();
		gson.toJson(cu, response.getWriter());
		
	}
}
