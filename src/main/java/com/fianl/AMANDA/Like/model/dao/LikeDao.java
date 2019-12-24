package com.fianl.AMANDA.Like.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.Like.model.vo.Like;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

@Repository("lDao")
public class LikeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectSender(ArrayList<MemberImg> result, String userId) {
		ArrayList<Member> member = new ArrayList<Member>();
		for(MemberImg m : result) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userId", m.getUser_id());
			map.put("myId", userId);
			member.add(sqlSession.selectOne("likeMapper.selectSender", map));
		}
		return member;
	}

	public ArrayList<Member> selectReceiver(ArrayList<MemberImg> result, String user_id) {
		ArrayList<Member> member = new ArrayList<Member>();
		for(MemberImg m : result) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userId", m.getUser_id());
			map.put("myId", user_id);
			member.add(sqlSession.selectOne("likeMapper.selectReceiver", map));
		}
		return member;
	}

	public ArrayList<MemberImg> selectSenderImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectSenderImg", m);
	}

	public ArrayList<MemberImg> selectReceiverImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectReceiverImg", m);
	}

	public int insertlikego(Like l) {
		return sqlSession.insert("likeMapper.insertLike", l);
	}

	public int updatelikeback(Like k) {
		return sqlSession.update("likeMapper.updateLike", k);
	}

	public int selectLike(Like l) {
		return sqlSession.selectOne("likeMapper.selectLike", l);
	}

	public ArrayList<Member> selectMatchList(ArrayList<MemberImg> result, String user_id) {
		ArrayList<Member> member = new ArrayList<Member>();
		for(MemberImg m : result) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userId", m.getUser_id());
			map.put("myId", user_id);
			member.add(sqlSession.selectOne("likeMapper.selectMatchList", map));
		}
		return member;
	}

	public ArrayList<MemberImg> selectMatchImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectMatchImg", m);
	}

	public int selectLikeAlram(Like lk) {
		return sqlSession.selectOne("likeMapper.selectLikeAlram", lk);
	}

	public int updateLike(Like lk) {
		return sqlSession.update("likeMapper.LikeReDi", lk);
	}

	 
}
