package com.fianl.AMANDA.mypage.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.common.Pagination;
import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;
import com.fianl.AMANDA.mypage.model.exception.MypageException;
import com.fianl.AMANDA.mypage.model.service.MypageService;

@Controller
public class MypageController {

	/*
	 * @Autowired private myMemberService myService;
	 */
	@Autowired
	private MypageService mypageService;

	@Autowired
	private BCryptPasswordEncoder mybcryptPasswordEncoder;

	@RequestMapping("myupdatememberlist.do")
	public String noticeDetail(Model model, String user_id, Member mym, MemberImg mymImg, Hobby myh) {
		mym = mypageService.myupdateMemberlist(user_id);
		myh = mypageService.myupdateHobbylist(user_id);
		ArrayList<MemberImg> mymImgList = mypageService.myupdateMemberImglist(user_id);
		
		/*
		 * System.out.println(mym); System.out.println(myh);
		 */
		System.out.println(mymImgList);
		if (mym != null && myh != null && mymImgList != null) {
			model.addAttribute("myMember", mym);
			model.addAttribute("myHobby", myh);
			model.addAttribute("mymImgList", mymImgList);
		} else {
			throw new MypageException("정보수정 상세보기 실패!!");
		}
		return "mypage/mypageview";

	}
/*
	@RequestMapping("myupdate.do")
	@ResponseBody
	public String myMemberUpdate(Member mym, MemberImg mymImg, ModelAndView mv, Model model, Hobby myh,
			HttpServletRequest myrequest, @RequestParam("phone1") String myp1, @RequestParam("phone2") String myp2,
			@RequestParam("phone3") String myp3, @RequestParam(value =  "imgorginname", required = false) ArrayList<String> imgorignname,
			@RequestParam(value = "mythumbnailImg", required = false) ArrayList<MultipartFile> myMultipartFile) {
		String myphone = myp1 + "-" + myp2 + "-" + myp3;
		String myencPwd = mybcryptPasswordEncoder.encode(mym.getUser_pwd());
		mym.setPhone(myphone);
		mym.setUser_pwd(myencPwd);
		ArrayList<MemberImg> myMemberImgList = new ArrayList<MemberImg>();

		System.out.println("img의 객체 명 : " + myMemberImgList);
		MemberImg updateImg = null;

		  int addcount = -1; 
		  
		  for(int i = 0 ; i <myMultipartFile.size();i++) {
			  addcount++;
			  updateImg = new MemberImg();
			  String myrenameFileName = mysaveFile(myMultipartFile.get(i) , myrequest, addcount,imgorignname.get(i));
			  System.out.println(imgorignname.get(i));
			  System.out.println("변경값:" + myrenameFileName);
			  
			  if(myrenameFileName != null) {
				  
				  updateImg.setOriginalFileName(imgorignname.get(i));
				  updateImg.setUser_id(mymImg.getUser_id());
				  updateImg.setRenameFileName(myrenameFileName);
				  updateImg.setImg_count(addcount);
			  
			  
			  
			  }

			  myMemberImgList.add(updateImg); 
		  }
		  System.out.println(myMemberImgList);
		  
		  int myMemberImgResult = mypageService.myupdateMemberImg(myMemberImgList);
		  System.out.println("myMemberImgResult : " + myMemberImgResult);
		  
		  int myhobbyResult = mypageService.myupdateHobby(myh); 
		  int myMemberResult = mypageService.myupdateMember(mym);
		  
		  
		  if(myMemberResult>0 && myhobbyResult > 0 && myMemberImgResult>0 ) {
			  	model.addAttribute("myMember", mym);
				model.addAttribute("myHobby", myh);
				model.addAttribute("mymImgList", myMemberImgList);
		  
		  }else 
		  { 
			  throw new MypageException("정보수정을 실패하셨습니다."); 
			  }
	
		  return "home";
		

	}

	public String mysaveFile(MultipartFile file, HttpServletRequest myrequest, int i, String orginname) {

		String myroot = myrequest.getSession().getServletContext().getRealPath("resources");

		String mysavePath = myroot + "\\userface";

		File myfolder = new File(mysavePath);

		if (!myfolder.exists()) {
			myfolder.mkdirs();
		}

		SimpleDateFormat mysdf = new SimpleDateFormat("yyyyMMddHHmmss" + i);
		String originFileName = orginname;
		String renameFileName = mysdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String myfilePath = myfolder + "\\" + renameFileName;

		try {
			file.transferTo(new File(myfilePath));

			System.out.println("multipartFile : " + file);
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;
	}

	*/

	@RequestMapping("myupdate.do")
	@ResponseBody
	public ModelAndView myMemberUpdate(Member mym, MemberImg mymImg, ModelAndView mv, Hobby myh, String user_id,
			HttpServletRequest myrequest, @RequestParam("phone1") String myp1, @RequestParam("phone2") String myp2,
			@RequestParam("phone3") String myp3, @RequestParam(value =  "imgorginname", required = false) ArrayList<String> imgorignname,
			@RequestParam(value = "mythumbnailImg", required = false) ArrayList<MultipartFile> myMultipartFile) {
		
		int myresult = mypageService.myresult(user_id);
		System.out.println("myresult : "+ myresult);
		String myphone = myp1 + "-" + myp2 + "-" + myp3;
		String myencPwd = mybcryptPasswordEncoder.encode(mym.getUser_pwd());
		mym.setPhone(myphone);
		mym.setUser_pwd(myencPwd);
		ArrayList<MemberImg> myMemberImgList = new ArrayList<MemberImg>();
		System.out.println("img의 객체 명 : " + myMemberImgList);
		MemberImg updateImg = null;
		
		
		  int addcount = -1; 
		  
		  for(int i = 0 ; i <myMultipartFile.size();i++) {
			  addcount++;
			  updateImg = new MemberImg();
			  String myrenameFileName = mysaveFile(myMultipartFile.get(i) , myrequest, addcount,imgorignname.get(i));
			  System.out.println(imgorignname.get(i));
			  System.out.println("변경값:" + myrenameFileName);
			  
			  if(myrenameFileName != null) {
				  
				  updateImg.setOriginalFileName(imgorignname.get(i));
				  updateImg.setUser_id(mymImg.getUser_id());
				  updateImg.setRenameFileName(myrenameFileName);
				  updateImg.setImg_count(addcount);
			  
			  
			  
			  }

			  myMemberImgList.add(updateImg); 
		  }
		  
		  System.out.println(myMemberImgList);
		  
		  
		  int myMemberImgResult = mypageService.myupdateMemberImg(myMemberImgList);
		  System.out.println("myMemberImgResult : " + myMemberImgResult);
		  
		  int myhobbyResult = mypageService.myupdateHobby(myh); 
		  int myMemberResult = mypageService.myupdateMember(mym);
		  
		  
		  if((myMemberResult>0) && (myhobbyResult > 0) && (myMemberImgResult>0) ) {
			  mv.addObject("myMember", mym).
			  addObject("myHobby", myh).
			  addObject("mymImgList", myMemberImgList).
			  setViewName("common/matchingMenu"); 
			  return mv;
		  
		  }else { 
			  throw new MypageException("정보수정을 실패하셨습니다."); 
			  }
	
			

	}

	public String mysaveFile(MultipartFile file, HttpServletRequest myrequest, int i, String orginname) {

		String myroot = myrequest.getSession().getServletContext().getRealPath("resources");

		String mysavePath = myroot + "\\userface";

		File myfolder = new File(mysavePath);

		if (!myfolder.exists()) {
			myfolder.mkdirs();
		}

		SimpleDateFormat mysdf = new SimpleDateFormat("yyyyMMddHHmmss" + i);
		String originFileName = orginname;
		String renameFileName = mysdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String myfilePath = myfolder + "\\" + renameFileName;

		try {
			file.transferTo(new File(myfilePath));

			System.out.println("multipartFile : " + file);
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;
	}
	
	
	
	
	/*
	 * public void mydeleteFile(String myfileName, HttpServletRequest myrequest) {
	 * String myroot =
	 * myrequest.getSession().getServletContext().getRealPath("resources"); String
	 * mysavePath = myroot + "\\userface";
	 * 
	 * File myFile = new File(mysavePath + "\\" + myfileName); if (myFile.exists())
	 * myFile.delete();
	 * 
	 * }
	 */


}
