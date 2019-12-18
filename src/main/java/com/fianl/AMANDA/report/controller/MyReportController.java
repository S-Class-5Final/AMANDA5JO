package com.fianl.AMANDA.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.common.Pagination;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.mypage.model.exception.MypageException;
import com.fianl.AMANDA.report.model.exception.MyReportException;
import com.fianl.AMANDA.report.model.service.myReportService;
import com.fianl.AMANDA.report.model.vo.Chat;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

@Controller
public class MyReportController {
	
	@Autowired
	myReportService myReportService;
	
	@RequestMapping(value="myReportInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public String myRepor(Report myr, HttpSession session, 
			@RequestParam("ReportradioCheck") String ReportradioCheck,
			@RequestParam("myReportId") String myreport_Id,	
			@RequestParam("myreportContent") String myreportContent,
			@RequestParam("myreport_UId") int myreport_UId
			) {
		
		int mtresult2 = myReportService.myReportUpdate(myreport_Id);
		myr.setR_user_id(myreport_Id);
		myr.setR_type(ReportradioCheck);
		myr.setR_contents(myreportContent);
		myr.setU_mid(myreport_UId);
		
		int myresult = myReportService.myReportInsert(myr);
		if(myresult > 0) {
			return "success!!!!!";
		}
		throw new MyReportException("신고하기 실패");
	}

	
	// 채팅내역 확인
		@RequestMapping("blist.do")
		public ModelAndView boardList(ModelAndView mv, String user_id,  ChatInfo myChatInfo,
										@RequestParam(value="page", required=false) Integer page) {
					
			myChatInfo.setUser_id(user_id);
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = myReportService.getmychatListCount(myChatInfo);
			System.out.println(listCount);
			                
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("pi : " + pi);
			ArrayList<ChatInfo> list = myReportService.selectmychatList(pi);
			System.out.println("list : " + list );
		
			
			if(list != null && list.size() > 0) {	// 게시글이 있다면
				mv.addObject("list",list);
				mv.addObject("pi", pi);
				mv.setViewName("mypage/myChat");
			}else {
				throw new MypageException("신고내역 확인 실패");
			}
			return mv;
					
		}
	
}


