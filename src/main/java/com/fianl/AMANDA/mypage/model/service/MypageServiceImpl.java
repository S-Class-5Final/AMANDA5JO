package com.fianl.AMANDA.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;
import com.fianl.AMANDA.mypage.model.dao.MypageDao;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao mypageDao;
	
	
	@Override
	public int myupdateMember(Member mym) {
		return mypageDao.myupdateMember(mym);
	}

	@Override
	public int myupdateHobby(Hobby myh) {
		
		return mypageDao.myupdateHobby(myh);
	}
	

	// 마이페이지 리스트
	@Override
	public Member myupdateMemberlist(String user_id) {
		return mypageDao.myupdateMemberlist(user_id);
	}
	
	
	@Override
	public Hobby myupdateHobbylist(String user_id) {
		return mypageDao.myupdateHobbylist(user_id);
	}

	@Override
	public ArrayList<MemberImg> myupdateMemberImglist(String user_id) {
		return mypageDao.myupdateMemberImglist(user_id);
	}

	@Override
	public int myupdateMemberImg(ArrayList<MemberImg> myMemberImgList) {
		System.out.println("Service mymImglist : " + myMemberImgList);
		return mypageDao.myupdateMemberImg(myMemberImgList);
	}

	@Override
	public int myresult(String user_id) {
		return mypageDao.myresult(user_id);
	}



}
