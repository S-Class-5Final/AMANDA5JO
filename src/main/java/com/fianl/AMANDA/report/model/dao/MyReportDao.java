package com.fianl.AMANDA.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.report.model.vo.Chat;
import com.fianl.AMANDA.report.model.vo.ChatInfo;
import com.fianl.AMANDA.report.model.vo.PageInfo;
import com.fianl.AMANDA.report.model.vo.Report;

@Repository("myReportDao")
public class MyReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int myReportInsert(Report myr) {
		return sqlSession.insert("reportMapper.myReportInsert", myr);
	}


	public int getmychatListCount(ChatInfo myChatInfo) {
		return sqlSession.selectOne("reportMapper.getmychatListCount", myChatInfo);
	}


	public ArrayList<ChatInfo> selectmychatList(PageInfo pi) {
		int myoffset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(myoffset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reportMapper.selectmychatList", null, rowBounds);
	}


	public int myReportUpdate(String myreport_Id) {
		return sqlSession.update("reportMapper.myReportUpdate", myreport_Id);
	}

}
