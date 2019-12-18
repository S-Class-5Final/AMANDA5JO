package com.fianl.AMANDA.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.report.model.dao.MyReportDao;
import com.fianl.AMANDA.report.model.vo.Chat;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

@Service("myReportService")
public class myReportServiceImpl implements myReportService {
	
	@Autowired
	MyReportDao myReportDao;

	@Override
	public int myReportInsert(Report myr) {
		return myReportDao.myReportInsert(myr);
	}
	
	
	// 채팅 카운트 리스트
	@Override
	public int getmychatListCount(ChatInfo myChatInfo) {
		return myReportDao.getmychatListCount(myChatInfo);
	}

	// 채팅 내역 리스트
	@Override
	public ArrayList<ChatInfo> selectmychatList(PageInfo pi) {
		return myReportDao.selectmychatList(pi);
	}


	@Override
	public int myReportUpdate(String myreport_Id) {
		return myReportDao.myReportUpdate(myreport_Id);
	}

}
