package com.fianl.AMANDA.report.model.service;

import java.util.ArrayList;
import java.util.List;

import com.fianl.AMANDA.chat.model.vo.Chat;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

public interface myReportService {

	public int myReportInsert(Report myr);

	public ArrayList<ChatInfo> selectmychatList(String user_id);

	public int myReportUpdate(String myreport_Id);

	int myChatUpdate(int myChatId);

}
