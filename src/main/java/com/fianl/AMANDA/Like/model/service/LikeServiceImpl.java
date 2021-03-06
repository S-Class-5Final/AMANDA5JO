package com.fianl.AMANDA.Like.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.Like.model.dao.LikeDao;
import com.fianl.AMANDA.Like.model.vo.Like;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;


@Service("lService")
public class LikeServiceImpl implements LikeService {
	@Autowired
	LikeDao lDao;

	@Override
	public ArrayList<Member> selectSender(ArrayList<MemberImg> result, String user_id) {
		return lDao.selectSender(result, user_id);
	}

	@Override
	public ArrayList<Member> selectReceiver(ArrayList<MemberImg> result, String user_id) {
		return lDao.selectReceiver(result, user_id);
	}

	@Override
	public ArrayList<MemberImg> selectSenderImg(Member m) {
		return lDao.selectSenderImg(m);
	}

	@Override
	public ArrayList<MemberImg> selectReceiverImg(Member m) {
		return lDao.selectReceiverImg(m);
	}

	@Override
	public int insertlikego(Like l) {
		return lDao.insertlikego(l);
	}

	@Override
	public int updatelikeback(Like k) {
		return lDao.updatelikeback(k);
	}

	@Override
	public int selectLike(Like l) {
		return lDao.selectLike(l);
	}

	@Override
	public ArrayList<Member> selectMatchList(ArrayList<MemberImg> result, String user_id) {
		return lDao.selectMatchList(result, user_id);
	}

	@Override
	public ArrayList<MemberImg> selectMatchImg(Member m) {
		return lDao.selectMatchImg(m);
	}

	@Override
	public int selectLikeAlram(Like lk) {
		return lDao.selectLikeAlram(lk);
	}

	@Override
	public int updateLike(Like lk) {
		return lDao.updateLike(lk);
	}

	 

}
