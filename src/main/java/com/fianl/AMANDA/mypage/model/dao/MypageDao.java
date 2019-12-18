package com.fianl.AMANDA.mypage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

@Repository("mypageDao")
public class MypageDao {

	@Autowired
	private SqlSessionTemplate sqlSession; 

	public int myupdateMember(Member mym) {
		return sqlSession.update("MypageMapper.myupdateMember", mym);
	}

	public int myupdateHobby(Hobby myh) {
		return sqlSession.update("MypageMapper.myupdateHobby", myh);
	}
	
	
	public int myupdateMemberImg(ArrayList<MemberImg> myMemberImgList) {
		System.out.println("mymImglist Dao : " + myMemberImgList);
		int result =0;
		for(MemberImg abc: myMemberImgList) {
			result += sqlSession.insert("MypageMapper.myupdateMemberImg", abc);
			
		}
		return result;
	}
	
	public Member myupdateMemberlist(String user_id) {
		System.out.println("memeberdao user_id" + user_id);
		return sqlSession.selectOne("MypageMapper.myupdateMemberlist", user_id);
	}

	public Hobby myupdateHobbylist(String user_id) {
		System.out.println("hobbydao user_id" + user_id);
		return sqlSession.selectOne("MypageMapper.myupdateHobbylist", user_id);
	}

	public ArrayList<MemberImg> myupdateMemberImglist(String user_id) {
		return (ArrayList)sqlSession.selectList("MypageMapper.myupdateMemberImglist", user_id);
	}

	public int myresult(String user_id) {
		return sqlSession.update("MypageMapper.myresult", user_id);
	}


	
}
