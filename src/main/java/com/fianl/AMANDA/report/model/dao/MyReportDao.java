package com.fianl.AMANDA.report.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

/*
	public int getmychatListCount(ChatInfo ChatInfo) {
		System.out.println("ChatInfo" + ChatInfo);
		return sqlSession.selectOne("reportMapper.getmychatListCount", ChatInfo);
	}
*/

	public ArrayList<ChatInfo> selectmychatList(String user_id, PageInfo pi) {
		
		
		  int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit(); 
		  RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); //RowBounds은 건너뛰는거
		return (ArrayList)sqlSession.selectList("reportMapper.selectmychatList", user_id, rowBounds);
	}


	public int myReportUpdate(String myreport_Id) {
		return sqlSession.update("reportMapper.myReportUpdate", myreport_Id);
	}


	
	 public int getmychatList(String user_id) { 
		 return sqlSession.selectOne("reportMapper.getmychatList", user_id); }
	 

/*
	public List<ChatInfo> listAll(String user_id, String keyword, int start, int end) {
		 Map<String,Object> map = new HashMap<>();
         map.put("user_id", user_id);
         map.put("keyword", keyword);
         map.put("start", start); 
         map.put("end", end);
         return sqlSession.selectList("reportMapper.mylistAll", map);
	}

	*/
	
	
	
	
	
	
	
	
	
}
