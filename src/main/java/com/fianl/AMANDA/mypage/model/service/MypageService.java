package com.fianl.AMANDA.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

public interface MypageService {

	 int myupdateMember(Member mym);
		
	 int myupdateHobby(Hobby myh);

	Member myupdateMemberlist(String user_id);

	Hobby myupdateHobbylist(String user_id);

	ArrayList<MemberImg> myupdateMemberImglist(String user_id);

	int myupdateMemberImg(ArrayList<MemberImg> myMemberImgList);

	int myresult(String user_id);

	
	

}
