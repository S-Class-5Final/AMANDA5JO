package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.match.model.dao.MatchDao;
import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;



@Service("matchService")
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	MatchDao matchDao;

//	@Override
//	public ArrayList<Member> selectMlist(Member m) {
//		return matchDao.selectMlist(m);
//	}
	@Override
	public ArrayList<Member> selectMlist(HashMap<String, Object> map) {
		return matchDao.selectMlist(map);
	}
	
	@Override
	public ArrayList<MemberImg> selectPlist(HashMap<String, Object> map) {
		return matchDao.selectPlist(map);
	}
	@Override
	public int likeInsert(Match ml) {
		return matchDao.likeInsert(ml);
	}
	@Override
	public int HateInsert(Hate h) {
		return matchDao.HateInsert(h);
	}

	@Override
	public ArrayList<Member> selectMFlist(HashMap<String, Object> map) {
		return matchDao.selectMFlist(map);
	}

	@Override
	public ArrayList<Member> selectMFYlist(HashMap<String, Object> map) {
		return matchDao.selectMFYlist(map);
	}

	@Override
	public ArrayList<Member> selectMMlist(HashMap<String, Object> map) {
		return matchDao.selectMMlist(map);
	}

	@Override
	public ArrayList<Member> selectMMYlist(HashMap<String, Object> map) {
		return matchDao.selectMMYlist(map);
	}

	@Override
	public ArrayList<MemberImg> selectPFlist(HashMap<String, Object> map) {
		return matchDao.selectPFlist(map);
	}

	@Override
	public ArrayList<MemberImg> selectPFYlist(HashMap<String, Object> map) {
		return matchDao.selectPFYlist(map);
	}

	@Override
	public ArrayList<MemberImg> selectPMlist(HashMap<String, Object> map) {
		return matchDao.selectPMlist(map);
	}

	@Override
	public ArrayList<MemberImg> selectPMYlist(HashMap<String, Object> map) {
		return matchDao.selectPMYlist(map);
	}


	
	
}
