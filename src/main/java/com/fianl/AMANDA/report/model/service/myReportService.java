package com.fianl.AMANDA.report.model.service;

import java.util.ArrayList;
import java.util.List;

import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

public interface myReportService {

	public int myReportInsert(Report myr);

	/* public int getmychatListCount(String user_id); */

	 public ArrayList<ChatInfo> selectmychatList(String user_id, PageInfo pi); 

	 public int myReportUpdate(String myreport_Id);

	 public int getmychatList(String user_id); 

/* public List<ChatInfo> listAll(String user_id, String keyword, int start, int end); */


}
