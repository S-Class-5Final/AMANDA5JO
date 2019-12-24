package com.fianl.AMANDA.report.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.common.Pagination;
import com.fianl.AMANDA.report.model.service.myReportService;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class MyReportController {

   @Autowired
   myReportService myReportService;

   @RequestMapping("myReportInsert.do")
   @ResponseBody
   public ModelAndView myRepor(Report myr, ModelAndView mv, Chat chat,
         @RequestParam("myReportId") String myReportId,
         @RequestParam("myChatId") int myChatId,
         @RequestParam("myReportRadioList") String myReportRadioList,
         @RequestParam("myReportTextContentId") String myReportTextContentId,
         @RequestParam("myUserNum") int myUserNum
		   ) {
		 
	  
	   
		 
	   System.out.println(myReportId);
	   System.out.println(myChatId);
	   System.out.println(myReportRadioList);
	   System.out.println(myReportTextContentId);
      
      
      System.out.println(myr);

      myr.setU_mid(myUserNum);
      myr.setR_user_id(myReportId);
      myr.setR_type(myReportRadioList);
      myr.setR_contents(myReportTextContentId);
      
      chat.setChatId(myChatId);
      
      
      
      
      
      int myReportInsert = myReportService.myReportInsert(myr);
      int myChatUpdate = myReportService.myChatUpdate(myChatId);
      
      if (myReportInsert > 0 && myChatUpdate > 0) {
    	  mv.addObject("myr", myr);
      }
      mv.setViewName("mypage/myChat");
      return mv;
   }
   
   


   // 채팅내역 확인
	/*
	  @RequestMapping("mylist.do") public ModelAndView boardList(ModelAndView mv,
	  String user_id, ChatInfo ChatInfo,
	  
	  @RequestParam(value = "page", required = false) Integer page) {
	  
	  System.out.println(user_id); ChatInfo.setUser_id(user_id);
	  
	  int currentPage = 1; if (page != null) { currentPage = page; }
	  
	  int listCount = myReportService.getmychatList(user_id);
	  System.out.println(listCount);
	  
	  System.out.println("상대 채팅창에 필요한 정보 : " + listCount);
	  System.out.println("몇개 가져오니 :" + listCount); ArrayList<ChatInfo> list = null;
	  PageInfo pi = null;
	  
	  pi = Pagination.getPageInfo(currentPage, listCount);
	  
	  System.out.println("pi : " + pi); if (listCount > 0) { list =
	  myReportService.selectmychatList(user_id, pi); for(int i=0; i
	  <list.size();i++) { if(user_id.equals(list.get(i).getUser_id2())) { String id
	  = list.get(i).getUser_id();
	  list.get(i).setUser_id(list.get(i).getUser_id2());
	  list.get(i).setUser_id2(id);
	  
	  String name= list.get(i).getUsername();
	  list.get(i).setUsername(list.get(i).getUsername2());
	  list.get(i).setUsername2(name);
	  
	  } } }
	  
	  System.out.println("list : " + list); System.out.println("pi : " + pi);
	  
	  if (list != null && list.size() > 0) { // 게시글이 있다면 mv.addObject("list",list);
	  mv.addObject("pi", pi).addObject("list", list).setViewName("mypage/myChat");
	  } else { mv.addObject("pi", pi).setViewName("mypage/myChat"); }
	  
	  return mv;
	  
	  }
	  
	  @RequestMapping(value="currentList.do", method = RequestMethod.POST) public
	  void PagingTableChatList(HttpServletResponse response, int currentPage,
	  String user_id) throws JsonIOException, IOException {
	  response.setContentType("application/json; charset = urf-8"); int listCount =
	  myReportService.getmychatList(user_id); ArrayList<ChatInfo> list = null;
	  PageInfo pi = null;
	  
	  pi = Pagination.getPageInfo(currentPage, listCount);
	  
	  System.out.println("pi : " + pi); if (listCount > 0) { list =
	  myReportService.selectmychatList(user_id, pi);
	  
	  for(ChatInfo ch : list) {
	  ch.setChatroom(URLEncoder.encode(ch.getChatroom(),"utf-8"));
	  ch.setUsername(URLEncoder.encode(ch.getUsername(),"utf-8"));
	  ch.setUsername2(URLEncoder.encode(ch.getUsername2(),"utf-8")); }
	  
	  
	  for(int i=0; i <list.size();i++) {
	  
	  if(user_id.equals(list.get(i).getUser_id2())) { String id =
	  list.get(i).getUser_id(); list.get(i).setUser_id(list.get(i).getUser_id2());
	  list.get(i).setUser_id2(id);
	  
	  
	  list.get(i).setChatroom(list.get(i).getChatroom()); String name=
	  list.get(i).getUsername();
	  list.get(i).setUsername(URLEncoder.encode(list.get(i).getUsername2(),"utf-8")
	  ); list.get(i).setUsername2(name);
	  
	  
	  } } }
	  
	  
	  System.out.println("list : " + list); System.out.println("pi : " + pi);
	  HashMap<String, Object> map = new HashMap<String, Object>(); map.put("list",
	  list); map.put("pi", pi); Gson gson = new Gson(); if(list.size() >0 && list
	  != null) { gson.toJson(map, response.getWriter()); }else {
	  gson.toJson("fail", response.getWriter()); }
	  
	  
	 }
	 
   */
   
   @RequestMapping("mylist.do") public ModelAndView boardList(ModelAndView mv,
			  String user_id, ChatInfo ChatInfo
			  
			  ) {
			
	   ChatInfo.setUser_id(user_id);
	   
	   /*
	   
			  System.out.println(user_id); 
			  ChatInfo.setUser_id(user_id);
			  
			  int currentPage = 1; if (page != null) { currentPage = page; }
			  
			  int listCount = myReportService.getmychatList(user_id);
			  System.out.println(listCount);
			  
			  System.out.println("상대 채팅창에 필요한 정보 : " + listCount);
			  System.out.println("몇개 가져오니 :" + listCount); 
			  PageInfo pi = null;
			  */
			  
			  ArrayList<ChatInfo> list = null;
				  list =myReportService.selectmychatList(user_id); 
			  
			  for(int i=0; i<list.size();i++) { 
				  if(user_id.equals(list.get(i).getUser_id2())) { 
			  String id= list.get(i).getUser_id();
			  list.get(i).setUser_id(list.get(i).getUser_id2());
			  list.get(i).setUser_id2(id);
			  
			  String name= list.get(i).getUsername();
			  list.get(i).setUsername(list.get(i).getUsername2());
			  list.get(i).setUsername2(name);
			  
			  } 
				  }
			  
			 
			  System.out.println(list);
			  if (list != null && list.size() > 0) { // 게시글이 있다면 mv.addObject("list",list);
			  mv.addObject("list", list).setViewName("mypage/myChat");
			  } else { mv.addObject("list", list).setViewName("mypage/myChat"); }
			  
			  return mv;
			  
			  }

}