package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


public interface MatchService {

	/*
	 * 회원리스트
	 */
	//ArrayList<Member> selectMlist(Member m);
	// 공백일때
	ArrayList<Member> selectMlist(HashMap<String, Object> map);
	ArrayList<MemberImg> selectPlist(HashMap<String, Object> map);
	
	//여자 버튼 눌렀을때
	ArrayList<Member> selectMFlist(HashMap<String, Object> map);
	ArrayList<MemberImg> selectPFlist(HashMap<String, Object> map);
	//레즈비언
	ArrayList<Member> selectMFYlist(HashMap<String, Object> map);
	ArrayList<MemberImg> selectPFYlist(HashMap<String, Object> map);
	//남자 버튼 눌렀을때
	ArrayList<Member> selectMMlist(HashMap<String, Object> map);
	ArrayList<MemberImg> selectPMlist(HashMap<String, Object> map);
	//게이
	ArrayList<Member> selectMMYlist(HashMap<String, Object> map);
	ArrayList<MemberImg> selectPMYlist(HashMap<String, Object> map);

	
	/*
	 * 좋아요 매칭 
	 */
	public int  likeInsert(Match ml);
	
	/*
	 * 
	 */
	public int HateInsert(Hate h);


	

	

}
