package com.fianl.AMANDA.report.model.service;

import java.util.ArrayList;

import com.fianl.AMANDA.report.model.vo.Chat;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

public interface myReportService {

public int myReportInsert(Report myr);

public int getmychatListCount(ChatInfo myChatInfo);

public ArrayList<ChatInfo> selectmychatList(PageInfo pi);

public int myReportUpdate(String myreport_Id);

}
