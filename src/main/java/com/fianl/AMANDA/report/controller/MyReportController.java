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

import com.fianl.AMANDA.common.Pagination;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.report.model.exception.MyReportException;
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

	@RequestMapping(value = "myReportInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String myRepor(Report myr,  @RequestParam("ReportradioCheck") String ReportradioCheck, Member mym,
			@RequestParam("myReportId") String myreport_Id, @RequestParam("myreportContent") String myreportContent
			) {

		myr.setU_mid(mym.getU_mid());
		myr.setR_user_id(myreport_Id);
		myr.setR_type(ReportradioCheck);
		myr.setR_contents(myreportContent);
		

		int myresult = myReportService.myReportInsert(myr);
		if (myresult > 0) {
			return "success!!!!!";
		}
		throw new MyReportException("신고하기 실패");
	}
	

	// 채팅내역 확인
	@RequestMapping("mylist.do")
	public ModelAndView boardList(ModelAndView mv, String user_id, ChatInfo ChatInfo,
			@RequestParam(value = "page", required = false) Integer page) {

		System.out.println(user_id);
		ChatInfo.setUser_id(user_id);

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = myReportService.getmychatList(user_id);
		System.out.println(listCount);

		System.out.println("상대 채팅창에 필요한 정보 : " + listCount);
		System.out.println("몇개 가져오니 :" + listCount);
		ArrayList<ChatInfo> list = null;
		PageInfo pi = null;

		pi = Pagination.getPageInfo(currentPage, listCount);

		System.out.println("pi : " + pi);
		if (listCount > 0) {
			list = myReportService.selectmychatList(user_id, pi);
			for(int i=0; i <list.size();i++) {
				if(user_id.equals(list.get(i).getUser_id2())) {
					String id = list.get(i).getUser_id();
					list.get(i).setUser_id(list.get(i).getUser_id2());
					list.get(i).setUser_id2(id);
					
					String name= list.get(i).getUsername();
					list.get(i).setUsername(list.get(i).getUsername2());
					list.get(i).setUsername2(name);
					
				}
			}
		}
		
		System.out.println("list : " + list);
		System.out.println("pi : " + pi);

		if (list != null && list.size() > 0) { // 게시글이 있다면 mv.addObject("list",list);
			mv.addObject("pi", pi).addObject("list", list).setViewName("mypage/myChat");
		} else {
			mv.addObject("pi", pi).setViewName("mypage/myChat");
		}

		return mv;

	}
	
	@RequestMapping(value="currentList.do", method = RequestMethod.POST)
	public void PagingTableChatList(HttpServletResponse response, int currentPage, String user_id) throws JsonIOException, IOException {
		response.setContentType("application/json; charset = urf-8");
		int listCount = myReportService.getmychatList(user_id);
		ArrayList<ChatInfo> list = null;
		PageInfo pi = null;

		pi = Pagination.getPageInfo(currentPage, listCount);

		System.out.println("pi : " + pi);
		if (listCount > 0) {
			list = myReportService.selectmychatList(user_id, pi);
			for(int i=0; i <list.size();i++) {
				
				if(user_id.equals(list.get(i).getUser_id2())) {
					String id = list.get(i).getUser_id();
					list.get(i).setUser_id(list.get(i).getUser_id2());
					list.get(i).setUser_id2(id);
					
					
					list.get(i).setChatroom(URLEncoder.encode(list.get(i).getChatroom(),"utf-8"));
					String name= list.get(i).getUsername();
					list.get(i).setUsername(URLEncoder.encode(list.get(i).getUsername2(),"utf-8"));
					list.get(i).setUsername2(name);
					
					
				}
			}
		}
	
		
		System.out.println("list : " + list);
		System.out.println("pi : " + pi);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		Gson gson = new Gson();
		if(list.size() >0 && list != null) {
			gson.toJson(map, response.getWriter());
		}else {
			gson.toJson("fail", response.getWriter());
		}
		

	}
	
	/*
	 * @RequestMapping("abc.do") public ModelAndView
	 * myboardList(@RequestParam(value="user_id") String user_id,
	 * 
	 * @RequestParam(defaultValue="1") int curPage,
	 * 
	 * @RequestParam(defaultValue="") String keyword) {
	 * 
	 * 
	 * 
	 * 
	 * System.out.println("user_id : " + user_id);
	 * 
	 * int count = 100;
	 * 
	 * Pager pager = new Pager(count, curPage); int start = pager.getPageBegin();
	 * int end = pager.getPageEnd();
	 * 
	 * List<ChatInfo> list = myReportService.listAll(user_id, keyword, start, end);
	 * System.out.println("list : " + list); ModelAndView mav = new ModelAndView();
	 * Map<String,Object> map = new HashMap<>(); //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에
	 * modelandview로 값을 넣고 페이지를 지정
	 * 
	 * if(list != null && list.size() > 0) { map.put("list", list); //map에 list(게시글
	 * 목록)을 list라는 이름의 변수로 자료를 저장함. map.put("pager", pager); map.put("user_id",
	 * user_id); map.put("count", count); map.put("keyword", keyword);
	 * mav.addObject("map", map).setViewName("mypage/test5"); //modelandview에 map를
	 * 저장 //자료를 넘길 뷰의 이름
	 * 
	 * } else { throw new MypageException("채팅내역 확인 실패"); }
	 * 
	 * return mav; //게시판 페이지로 이동 }
	 * 
	 * 
	 */

}
