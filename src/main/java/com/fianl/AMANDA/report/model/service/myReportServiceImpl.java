package com.fianl.AMANDA.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.report.model.dao.MyReportDao;
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

	// 채팅 내역 리스트
	 @Override public ArrayList<ChatInfo> selectmychatList(String user_id) { 
		 return myReportDao.selectmychatList(user_id); }
	
	
	@Override
	public int myReportUpdate(String myreport_Id) {
		return myReportDao.myReportUpdate(myreport_Id);
	}

	@Override
	public int myChatUpdate(int myChatId) {
		return myReportDao.myChatUpdate(myChatId);
	}
	
}
