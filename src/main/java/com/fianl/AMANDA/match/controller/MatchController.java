package com.fianl.AMANDA.match.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fianl.AMANDA.match.model.exception.MatchException;
import com.fianl.AMANDA.match.model.service.MatchServiceImpl;
import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;



@Controller
public class MatchController {
   
   @Autowired
   MatchServiceImpl matchService;
   
   
      
  /*  
  * 회원 리스트
  */
  @RequestMapping("mList.do")
  @ResponseBody
  public void Mlist(HttpServletResponse response, 
                   HttpServletRequest request,
                   @RequestParam("genderSelect") String genderSelect, 
                   @RequestParam("loginUser") String loginUser1) throws JsonIOException, IOException {
     response.setContentType("application/json; charset=utf-8");
  
     HttpSession session = request.getSession();
     
     Member member = (Member)session.getAttribute("loginUser"); 
     Member user = new Member();
     user.setUser_nick(loginUser1);
     user.setGender(member.getGender());

     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("user", user);
     map.put("genderSelect", genderSelect);
     
     //System.out.println(user);
     System.out.println("성별 : " + genderSelect);
     ArrayList<Member> mlist =null;
     ArrayList<MemberImg> plist = null;
    
    switch (genderSelect) {
   case "":
       mlist = matchService.selectMlist(map);
       plist = matchService.selectPlist(map);
       System.out.println("공백 mlist: " +  mlist);
       System.out.println("공백 plist: " + plist);
       break;
   case "F":
       mlist = matchService.selectMFlist(map);
       plist = matchService.selectPFlist(map);
       System.out.println("F버튼 mlist: " +  mlist);
       System.out.println("F버튼 plist: " + plist);
      break;
   case "FY":
      mlist = matchService.selectMFYlist(map);
      plist = matchService.selectPFYlist(map);
       System.out.println("FY mlist: " +  mlist);
       System.out.println("FY plist: " + plist);
      break;
   case "M":
      mlist = matchService.selectMMlist(map);
      plist = matchService.selectPMlist(map);
       System.out.println("M mlist: " +  mlist);
       System.out.println("M plist: " + plist);
      break;
   case "MY":
      mlist = matchService.selectMMYlist(map);
      plist = matchService.selectPMYlist(map);
       System.out.println("MY mlist: " +  mlist);
       System.out.println("MY plist: " + plist);
      break;
      
   }
        
        JSONObject obj = new JSONObject();
        JSONArray testlist = new JSONArray();
        
        JSONArray mlistArray = null;
        JSONArray plistArray = null;
        try {
           mlistArray = new JSONArray();
           for(int i = 0; i < mlist.size(); i++) {
              JSONObject memberObject = new JSONObject();
              memberObject.put("u_mid",mlist.get(i).getU_mid());
              memberObject.put("user_id",mlist.get(i).getUser_id());
              memberObject.put("user_pwd",mlist.get(i).getUser_pwd());
              memberObject.put("user_nick",mlist.get(i).getUser_nick());
              memberObject.put("grade",mlist.get(i).getGrade());
              memberObject.put("gender",mlist.get(i).getGender());
              memberObject.put("phone",mlist.get(i).getPhone());
              memberObject.put("height",mlist.get(i).getHeight());
              memberObject.put("age",mlist.get(i).getAge());
              memberObject.put("address",mlist.get(i).getAddress());
              memberObject.put("user_into",mlist.get(i).getUser_into());
              memberObject.put("gay",mlist.get(i).getGay());
              memberObject.put("r_count",mlist.get(i).getR_count());
              String update = String.valueOf(mlist.get(i).getUpdata_date());
              memberObject.put("updata_date",update);
              memberObject.put("status",mlist.get(i).getStatus());
              memberObject.put("pay_status",mlist.get(i).getPay_status());
              memberObject.put("kakao",mlist.get(i).getKakao());
              mlistArray.add(memberObject);
              plistArray = new JSONArray();
           for(int j = 0; j < plist.size(); j++) {
              JSONObject imgObject =  new JSONObject();
              if(mlist.get(i).getUser_id().equals(plist.get(j).getUser_id())) {
              imgObject.put("user_id",plist.get(j).getUser_id());
              imgObject.put("originalFileName",plist.get(j).getOriginalFileName());
              imgObject.put("renameFileName",plist.get(j).getRenameFileName());
              imgObject.put("img_count",plist.get(j).getImg_count());
              String date = String.valueOf(plist.get(j).getUpdate_date());
              imgObject.put("update_date",date);
              imgObject.put("status",plist.get(j).getStatus());
              plistArray.add(imgObject);
              System.out.println("imgObject : " + imgObject);
              }
              
           }
           
           obj.put("memberlist",memberObject);
           obj.put("imglist", plistArray);
           System.out.println("obj에 들어감  : " +plistArray );
           testlist.add(obj);
           }
           
        }catch(JSONException e) {
           e.printStackTrace();
        }
        System.out.println(testlist);

     if(testlist != null && testlist.size() > 0) {
           new Gson().toJson(testlist, response.getWriter());
     }else {
           throw new MatchException("조회 실패");
     }
  }
   
   /*
    * 좋아요 내역 삽입
    */
   @RequestMapping("mLike.do")
   public String matchLike(@RequestParam("sender") String sender,
                        @RequestParam("receiver") String receiver,
                        @RequestParam("u_mid") int u_mid,
                        Match ml) {
      System.out.println("sender : " + sender + "\n" + "receiver : " + receiver);
      
      ml.setLikeSender(sender); // Session값임.
      ml.setLikeReceiver(receiver);
      ml.setU_mid(u_mid);
      
      System.out.println(ml);
      
      int likeResult = matchService.likeInsert(ml);
    
      System.out.println("잘됬나?" + likeResult);
      
      if(likeResult > 0) {
         return "success";
      }else {
         throw new MatchException("좋아요 등록 실패");
      }
   }
   
   /*
    * 싫어요 내역 삽입
    */
   @RequestMapping("mHate.do")
   public String matchHate(@RequestParam("sender") String sender,
                        @RequestParam("receiver") String receiver,
                        @RequestParam("userNo") int userNo,    
                        Hate h) {
      System.out.println("sender : " + sender + "\n" + "receiver : " + receiver);
      
      h.setH_Sender(sender); // Session값임.
      h.setH_Receiver(receiver);
      h.setUserNo(userNo);
     
      System.out.println("실험해보자~~" + h);
      
      int HateResult = matchService.HateInsert(h);
      
      System.out.println("잘됬나2?" + HateResult);
      
      if(HateResult > 0) {
         return "success";
      }else {
         throw new MatchException("좋아요 등록 실패");
      }
   }

   
   
   
   
}