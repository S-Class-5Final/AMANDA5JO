<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<title></title>
    <link type="text/css" href="resources/css/common.css" rel="stylesheet">
    <link type="text/css" href="resources/css/font.css" rel="stylesheet">
    <link type="text/css" href="resources/css/slick.css" rel="stylesheet">
    <link type="text/css" href="resources/css/style.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="resources/js/slick.js"></script>
    <script type="text/javascript" src="resources/js/jquery.bpop.js"></script>
    <script type="text/javascript" src="resources/js/delivery_hero.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
    <!-- 이메일 js -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
    .slick-slider .slick-track, .slick-slider .slick-list {height:100%; outline:none; width: 145%; background: black;}
.tImg {
   margin-left: 400px;
   margin-top: 300px;
   width: 400px;
   height: 400px;
   padding: auto;
}

#service {
   background: #e793f0;
}

#interview {
   background: blue;
}
::-webkit-scrollbar {
	display: none;
}
/* 모달 css */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
   overflow-y: hidden; /* 스크롤바 없애기 */
   overflow-x: hidden;
}

/* Modal Content/Box */
.modal-content {
   background-color: rgb(255, 255, 255);
   margin: 15% auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 50%; /* Could be more or less, depending on screen size */
   border-radius: 15px;
}
/* The Close Button */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

.textbox {
   text-align: center;
}

#mainhr {
   border: 4px solid blue;
}

#infoView {
   display: none;
}

#infoView1 {
   display: none;
}

#infoView2 {
   display: none;
}

#infoView3 {
   display: none;
}

#pwdCheckView {
   display: none;
}

/* 메인호버기능 */
/*
* core styles
*/

.sm-link{
    --uismLinkDisplay: var(--smLinkDisplay, inline-flex);   
    --uismLinkTextColor: var(--smLinkTextColor);
    --uismLinkTextColorHover: var(--smLinkTextColorHover);  
    display: var(--uismLinkDisplay);
    color: var(--uismLinkTextColor);
    position: relative;
    overflow: hidden;
}

a.sm-link{
    text-decoration: none;
}

.sm-link__label{
  display: block;
}

/* sm-link_padding-all */ 

.sm-link_padding-all{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
}

.sm-link_padding-all::before, 
.sm-link_padding-all::after{
  width: 100%;
  height: var(--uismLinkLineWeight);
  left: 0;
}

.sm-link_padding-all::before{
  top: 0;
}

.sm-link_padding-all::after{
  bottom: 0;
}

.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  width: var(--uismLinkLineWeight);
  height: 100%;
  top: 0;
}

.sm-link_padding-all .sm-link__label::before{
  left: 0;
}

.sm-link_padding-all .sm-link__label::after{
  right: 0;
}

.sm-link_padding-all::before,
.sm-link_padding-all::after,
.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
 	content: "";     
    background-color: var(--uismLinkLineColor);
  	position: absolute; 
    opacity: 0;
    
    will-change: transform, opacity;
    transition-property: transform, opacity;
}

.sm-link_padding-all:hover::before,
.sm-link_padding-all:hover::after,
.sm-link_padding-all:hover .sm-link__label::before,
.sm-link_padding-all:hover .sm-link__label::after{
    opacity: 1;
}

/* sm-link_padding-bottom */ 

.sm-link_padding-bottom{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    
    padding-bottom: var(--uismLinkLineWeight);  
    position: relative;
}

.sm-link_padding-bottom::after{
  content: "";
  width: 100%;
  height: var(--uismLinkLineWeight);
  background-color: var(--uismLinkLineColor);
  position: absolute;
  left: 0;
  bottom: 0;
}

/* sm-link_bg */ 

.sm-link_bg {
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    --uismLinkTextColorHover: var(--smLinkTextColorHover, #fff);    
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
    transition: color .3s ease-out;
}

.sm-link_bg::before, 
.sm-link_bg::after{
  content: "";
    background-color: var(--uismLinkLineColor); 
  opacity: 0;
  position: absolute;
    
    transition: transform .2s ease-out, opacity .2s ease-out .03s;
}

.sm-link_bg .sm-link__label{
  position: relative;
  z-index: 2;
}

.sm-link_bg:hover::before, 
.sm-link_bg:hover::after{
  opacity: 1;
    transition-duration: .35s, .35s;
    transition-delay: 0s, 0s;
}

.sm-link_bg:hover{
    color: var(--uismLinkTextColorHover);
}

/* sm-link_text */ 

.sm-link_text::before{
  content: attr(data-sm-link-text);
    color: var(--uismLinkTextColorHover);
  position: absolute;
}

.sm-link_text::before, 
.sm-link_text .sm-link__label{
  transition-property: transform;
    transition-timing-function: cubic-bezier(.86, .6, .08, 1.01); 
    transition-duration: .3s;
}

.sm-link_text:hover::before,
.sm-link_text:hover .sm-link__label{
    transition-duration: .4s;
}

/* effect 1 */
.sm-link1::before {
   transform: translate3d(-105%, 0, 0);
}

.sm-link1::after {
   transform: translate3d(105%, 0, 0);
}

.sm-link1 .sm-link__label::before {
   transform: translate3d(0%, -100%, 0);
}

.sm-link1 .sm-link__label::after {
   transform: translate3d(0%, 100%, 0);
}

.sm-link1::before, .sm-link1::after, .sm-link1 .sm-link__label::before,
   .sm-link1 .sm-link__label::after {
   transition-timing-function: ease-out;
   transition-duration: .5s, .15s;
   transition-delay: 0s, .15s;
}

.sm-link1:hover::before, .sm-link1:hover::after, .sm-link1:hover .sm-link__label::before,
   .sm-link1:hover .sm-link__label::after {
   transform: translate3d(0, 0, 0);
   opacity: 1;
   transition-duration: .s;
   transition-delay: 0s;
}

.sm-link { 
	--smLinkPadding: 10px 15px;
 	--smLinkLineWeight: 10px; 
   	--smLinkLineColor: #ffffff; 
   	--smLinkTextColor: #243aab; 
  	--smLinkTextColorHover: #1b255a;
}

.sm-link_bg { -
   -smLinkTextColorHover: #ffffff;
}
/* 텍스트 박스 */
.logintable {
   margin: auto;
}

/* 사진 */
.img_wrap img {
   width: 100%;
   height: 100%;
}

/* 로그인버튼 */
.loginbtn {
   margin: auto;
   background: #FF6464;
   color: #fff;
   border: none;
   position: relative;
   width: 300px;
   height: 45px;
   font-size: 1.6em;
   padding: 0 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
   border-radius: 6.5px;
}

.loginbtn:hover {
   background: #fff;
   color: #FF6464;
}

.loginbtn:before, .loginbtn:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #FF6464;
   transition: 400ms ease all;
}

.loginbtn:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.loginbtn:hover:before, .loginbtn:hover:after {
   width: 100%;
   transition: 800ms ease all;
}

/* 회원가입 및 버튼 css */
.joinform, .joinform::after {
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   -o-transition: all 0.3s;
   transition: all 0.3s;
}

.joinform {
   margin: auto;
   background: none;
   border-radius: 5px;
   color: black;
   display: block;
   font-weight: bold;
   position: relative;
   text-transform: uppercase;
}

.joinform::before, .joinform::after {
   background: #fff;
   content: '';
   position: absolute;
   z-index: -1;
}

.joinform:hover {
   background: #FF6464;
   color: #fff;
   border: 3px solid #FF6464;
}

.joinform::after {
   height: 0;
   left: 50%;
   top: 50%;
   width: 0;
}

.joinform:hover:after {
   height: 100%;
   left: 0;
   top: 0;
   width: 100%;
}

/* 텍스트박스 */
.textboxra {
   border-radius: 6.5px;
}

/* 홈페이지 첫번째 table */
.infoViewtable, .infoView2table{
   margin: auto;
}
/* 유효성 검사 글씨체 */
#checkIdtext, #checkPwdtext, #checkNicktext, #phonetext {
   font-size: 8px;
}

#Imglist #first, #second, #third {
   float: left;

}
#first, #second{
       margin-right: 2px;
}

/* 다음 버튼 */
.nextbtnstyle {
   margin: auto;
   background: #FF6464;
   color: #fff;
   border: none;
   position: relative;
   width: 100px;
   height: 45px;
   font-size: 14px;
   padding: 0 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
   border-radius: 6.5px;
}

.nextbtnstyle:hover {
   background: #fff;
   color: #FF6464;
}

.nextbtnstyle:before, .nextbtnstyle:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #FF6464;
   transition: 400ms ease all;
}

.nextbtnstyle:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

.nextbtnstyle:hover:before, .nextbtnstyle:hover:after {
   width: 100%;
   transition: 800ms ease all;
}
::-webkit-scrollbar {
   display: none;
}
.hobbystyle{
margin-right: 40px;
margin-bottom : 10px;
color : white;
background: #A6A6A6;
display: inline-block;
font-weight: bold;
border-radius: 7px;
font-size:  22px;
}
.hobbystyle:hover{
color : white;
background: #ff3399;
cursor: pointer;
}

.hobbybox{
margin-top: 5px;
text-align: center;
}

/* introBtns */
.introBtns{
	width: 50px;
    height: 50px;
    border: 1px solid black;
    border-radius: 30px;
    background: none;
    margin-top: 40px;
    transition: 0.3s;
}
.introBtns:hover {
	 background: black; 
	/* animation-duration: 2s; */
	/* animation-delay: 1s; */
}
.slick-slider{
	margin-bottom: 15%;
}
#introLogo{
	width: 40px;
    height: 40px;
    margin-left: 15%;
    margin-top: 30%;
    margin-bottom: 30%;
}
#introFooter{
	box-shadow: 0px 10px 20px grey;
}

#introFooter:hover{
	-webkit-transform: translateY(-7px);
     box-shadow: 0px 30px 20px grey;
     transition: 0.5s;
}

#pt1 :hover{
	color: pink;
}
#pt2 :hover{
	color: pink;
}
#pt3 :hover{
	color: pink;
}
</style>
</head>
<body>
<div class="wrap" id="wrap">
<div class="nav">
    <ul>
        <li class="active nav1"><a href="#visual" class="scroll"></a></li>
        <li class="nav2"><a href="#service" class="scroll"></a></li>
        <li class="nav3"><a href="#interview" class="scroll"></a></li>
        <li class="nav4"><a href="#notice" class="scroll"></a></li>
    </ul>
</div>

<div class="main container">
   <div class="section visual" id="visual">
      <div class="video_wrap">
         <video id="video" autoplay loop muted>
            <source src="resources/video/AMANDA.mp4" type="video/mp4">
         </video>
      </div>
      
      <div class="content">
         <div class="timg sm-link__label sm-link sm-link_padding-all sm-link1">         
            <span class="sm-link__label">
            <img src="resources/images/mainImg.png" id = "myimg">
            </span>
         </div>
         
   <!-- 모달창 연습 -->
         <div id="myModal" class="modal">
      <!-- Modal content -->
            <div class="modal-content" style="margin-top: 10%;">
               <div class="closebten">
                  <span class="close">&times;</span><br><br><br>
               </div>
               <div id="loginview">
               <form action="mlogin.do" method="post" id="loginviewform">
               <table class="logintable" >
                  <tr>
                  <td height="70px" >
                  <div class="textbox" id="divId">
                     <input type="text" id ="loginId" class ="textboxra" name="loginId" data-rule-required="true" size="46px" placeholder="ex) OOOO@naver.com">
                  </div>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  <div class="textbox" id="divPassword">
                     <input type="password" id="loginPwd" class ="textboxra" name="loginPwd" data-rule-required="true" size="60px" placeholder="비밀번호를 입력하세요">
                  </div> 
                  <br>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  <div class="textbox">
                  <button type="button" class="loginbtn" onclick="loginCheck()">Login</button>
                  </div>
                  <br>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  <div class="textbox">
                  <a id="kakao-login-btn"></a>
                  </div>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  <br>
                  <button type = "button" id="insertmemberview" class="joinform" >아이디가 없으신가요?</button>
                  <button type = "button" id="pwdCheck" class="joinform">비밀번호가 기억이 나지 않으세요?</button>
                  </td>
                  </tr>
               </table>
               </form>
               </div>
               <div id ="pwdCheckView">
               <form action="mSerchPwd.do" method = "post" id="SerchPwdForm">
                   <div class="textbox">
                  <input type="text" id = "serchId" name="serchId" size="60px" placeholder="ex) OOOO@naver.com"> &nbsp;
                  <input type="hidden" id="findPwd" name="findPwd">
                  <button type="button" id="serchPwd" onclick="serchPwdbtn()">찾기</button>
               
                  </div>
               </form>
               </div>
               
               <div id= "infoView">
               <form action="minsert.do" method="post" id="memberjoinForm" enctype="multipart/form-data" onsubmit = "toEnabled()">
                  <div id="infoView1">
                  <table class="infoViewtable">
                     <tr>
                        <td>
                  <div id="checkId">
                  아이디(ID) : <input type= "text" name = "user_id" id="user_id" oninput = "checkId()" class="textboxra"> @
                  <select id="email" name="email" style="width: 200" class="textboxra">
                     <option value="naver.com">naver.com</option>
                     <option value="hanmail.net">hanmail.net</option>
                     <option value="gmail.com">gmail.com</option>
                      <option value="nate.com">nate.com</option> 
                     <option value="1">직접입력</option>
                  </select> &nbsp;&nbsp;
                  <input type="text" name="user_email" id = "user_email" class="textboxra" disabled class="textboxra"> <br>
                  <div id="checkIdtext">아이디를 입력 해주세요</div>
                  <input type= "hidden" name="kakao" id = "kakao"> 
                  </div>
                        </td>
                     </tr>
                  <tr>
                     <td>
                  <div id="checkPwd">
                  패스워드(PWD) : <input type = "password" name="user_pwd" id="user_pwd" class="textboxra">&nbsp;&nbsp;
                  패스워드 확인(PWD) : <input type = "password" name = "user_pwdC" id="user_pwdC" class="textboxra"><br>
                  <div id ="checkPwdtext">비밀번호를 입력하세요 </div>
                  </div>
                     </td>
                  </tr>
                  <tr>
                     <td>
                  <div id="checkNick">
                  별명(Name) : <input type = "text" name="user_nick" id="user_nick" class="textboxra"><br>
                  <div id= "checkNicktext">닉네임을 입력하세요 </div>
                  </div>
                     </td>
                  </tr>
                  <tr>
                     <td>
                  성별 : 남 <input type="radio" name = "gender" class = "gender" value = "M" checked="checked"> &nbsp; 
                  여  <input type = "radio" name = "gender" class = "gender" value="F"><br>
                     </td>
                  </tr>
                  <tr>
                     <td>
                  번호  : 
                  <select id="phone1" name="phone1" style="width: 200" class="textboxra">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="019">019</option>
                  </select> -
                  <input type="text" name= "phone2" id="phone2" class="textboxra" placeholder="000 or 0000"> - 
                  <input type="text" name = "phone3" id="phone3" class="textboxra" placeholder="0000" ><br>
                  <div id ="phonetext">예시 ) 010-000-0000 혹은  010-0000-0000</div>
                     </td>
                  </tr>
                  <tr>
                     <td>
                  <div class= "textbox" id="nextbtn">
                  <br>
                  <button type="button" id="nextpage1" class="nextbtnstyle">다음</button>
                     </div>
                     </td>
                  </tr>
                     </table>
                  </div>
               
               <div id = "infoView2">
               <table class="infoView2table">   
                  <tr>
                     <td>
               키 : <input type="number" name="height" id= "height" placeholder = "ex) 180, 165">&nbsp;
               나이 : <input type ="number" name="age" id = "age" placeholder = "ex) 20 ,21">&nbsp;
               사는곳 : <input type="text" name="address" id = "address">
                     </td>
                  </tr>
               <tr>
                  <td>
                  동성 여부 : 예 : <input type="radio" name = "gay" class = "gay" value = "Y"> &nbsp; 
                  아니오 : <input type = "radio" name = "gay" class = "gay" value="N" checked="checked"><br>
                  </td>
               </tr>
               <tr>
                  <td>
                    자기소개 한마디 : <input type= "text" name="user_into" size="60px" placeholder="어필해보세요!"><br>
                  </td>
               </tr>
               
               <tr>
               		<td align="center">
               		<div class="hobbybox">
               		<div class="hobbystyle" id="moviediv" onclick = "hobbybtn(this,1)">&nbsp;영화 보기&nbsp;</div>
               		<div class="hobbystyle" id="singdiv" onclick = "hobbybtn(this,2)">&nbsp;노래부르기&nbsp;</div>
               		<div class="hobbystyle" id="gamediv" onclick = "hobbybtn(this,3)">&nbsp;게임하기&nbsp;</div>
               		<br>
               		<div class="hobbystyle" id="jmtdiv" onclick = "hobbybtn(this,4)">&nbsp;JMT(맛집)&nbsp;</div>
               		<div class="hobbystyle" id="petdiv" onclick = "hobbybtn(this,5)">&nbsp;애완동물&nbsp;</div>
               		<div class="hobbystyle" id="cafediv" onclick = "hobbybtn(this,6)">&nbsp;카페&nbsp;</div>
               		<br>
               		<div class="hobbystyle" id="workingdiv" onclick = "hobbybtn(this,7)">&nbsp;당신과 산책&nbsp;</div>
               		<div class="hobbystyle" id="potodiv" onclick = "hobbybtn(this,8)">&nbsp;사진찍기&nbsp;</div>
               		<div class="hobbystyle" id="traveldiv" onclick = "hobbybtn(this,9)">&nbsp;여행다녀오기&nbsp;</div>
               		</div>
               		</td>
               </tr>
               <tr>
                  <td>
                  <!-- 체크박스 체크 -->
                  <div id = "hobby" type="hidden">
                     <input type="checkbox" id="movie" name = "movie" value = "Y">영화 &nbsp;
                     <input type="checkbox" id="sing" name = "sing" value = "Y">노래 &nbsp;
                     <input type="checkbox" id="game" name= "game" value = "Y">게임 &nbsp;
                     <input type="checkbox" id="jmt" name= "jmt" value = "Y">JMT &nbsp;
                     <input type="checkbox" id="pet" name = "pet" value = "Y">애완동물 &nbsp;
                     <input type="checkbox" id="cafe" name = "cafe" value = "Y">카페&nbsp;
                     <input type="checkbox" id="working" name = "working" value = "Y">산책&nbsp;
                     <input type="checkbox" id="poto" name= "poto" value = "Y">사진&nbsp;
                     <input type="checkbox" id="travel" name="travel" value = "Y">여행
                  </div>
                  </td>
               </tr>
               <tr>
                  <td>
                  <div class= "textbox">
                  <button type="button" id = "inforbtn" class="nextbtnstyle">이전</button>&nbsp;&nbsp;
                  <button type="button" id = "lastpage" class="nextbtnstyle">다음</button>
                  </div>
                  
                  </td>
               </tr>
                  </table>
               </div>
               
               <div id = "infoView3">
               <table class= "infoView3table">
               <tr>
               	<td align="center">
               		<h5 style="font-weight: 900">사진등록 시 유의사항</h5>
               		<p style="color:#ff6464">
               			1. 사람 사진만 등록하세요<br>
               			2. 과도한 포토샵은 인식 불가능 합니다<br>
               			3. 눈, 코, 입이 또렷하게 보이는 사진을 등록해주세요<br>
               			4. 사진 도용은 제재를 당할 수 있습니다<br>
               		</p>
               	<td>
               </tr>
               <tr>
                  <td>
                  <div id="Imglist"> 
                     <div id="first">
                        <img id = "firstImg" src="resources/images/image.png" onerror="this.src='resources/images/image.png'" width="300" height="300">
                     </div>
                     &nbsp;
                     <div id = "second">
                        <img id= "secondImg" src="resources/images/image.png" width ="300" height = "300">
                     </div>
                     &nbsp;
                     <div id = "third">
                        <img id= "thirdImg" src="resources/images/image.png" width ="300" height = "300">
                     </div>
                  </div>
                  </td>
               </tr>
               <tr>
                  <td>
               <div class= "textbox">
               <br>
               <button type="button" id="nextpage" class="nextbtnstyle">이전</button>
               <button type="button" id="minsertbtn" onclick="abc()" class="nextbtnstyle">가입</button><br>
               </div>
               </td>
               </tr>
               </table>         
                  <form id = "file_imgfrom" method="post" enctype="multipart/form-data" action ="">
                  <div id = "fileArea" type ="hidden">
                     <input type = "file" id="thumbnailImg1" multuple="multuple" name="thumbnailImg1" onchange="LoadImg(this,1)">
                     <input type = "file" id="thumbnailImg2" multuple="multuple" name="thumbnailImg2" onchange="LoadImg(this,2)">
                     <input type = "file" id="thumbnailImg3" multuple="multuple" name="thumbnailImg3" onchange="LoadImg(this,3)">
                  </div>
                  </form>

                  </div>
               </form>
            </div>
         </div>
      </div>
                  <script>
//카카오
$(function(){
   Kakao.init('2258d057a7a976d9f07e9e4ad2af57fe');
    // 카카오 로그인 버튼을 생성합니다.

    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      lang : 'kr',
      size : 'large',
      success: function(authObj) {
         Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                   var kakaoid = res['id'];
                   var nick = res['properties']['nickname'];
                  var kakaoEmail = res['kakao_account']['email'];
                  // console.log(JSon.stringify(res.profile));
                  console.log(kakaoid);
                  console.log(nick);
                  console.log(kakaoEmail);
                   console.log(JSON.stringify(res.id));
                   //console.log(JSON.stringify(res.profile));
                       //console.log(JSON.stringify(res.account_email));            
                    $.ajax({
                        url:"kakaoLogin.do",
                        type:"post",
                        data:{
                           kakaoId:kakaoid,
                           kakaoEmail:kakaoEmail
                           },
                        success:function(data){
                     switch (data) {
                      case '0':
                        alert("고객님의 카카오톡 E-mail을 누군가가 사용중입니다. 새로 이메일을 만들어 주세요");
                        insertmemberview.onclick();
                        $("#kakao").val(kakaoid);
                        break; 
                     case '1':
                        alert("로그인 완료");
                        location.href="home.do";
                        break;
                     case '2':
                        alert("회원가입 시작 합니다.");
                        insertmemberview.onclick();
                        var kakaoemail = kakaoEmail.split('@');
                        $("#user_id").val(kakaoemail[0]);
                        var size = $("#email option").length;
                         for( i=0 ; i <size;i++){
                           if(kakaoemail[1] ==$("#email option:eq("+i+")").val())
                              {
                              $("#email option:eq("+i+")").attr("selected","selected");
                              $("#user_email").val(kakaoemail[1]);
                                 $("#checkId").css('background','rgb(0,255,0,0.4)');
                                 $("#checkIdtext").html('가입 가능한 아이디 입니다.');
                                 $("#checkIdtext").css("color","rgb(0,255,255)");
                              idUsable = true;
                              $("#user_pwd").focus();
                              }
                           else{
                              $("#email option:eq(4)").attr("selected","selected");
                                 $("#user_email").val(""); // 값 초기화
                              $("#user_email").val(kakaoemail[1]);
                                 $("#checkId").css('background','rgb(0,255,0,0.4)');
                                 $("#checkIdtext").html('가입 가능한 아이디 입니다.');
                                 $("#checkIdtext").css("color","rgb(0,255,255)");
                                 $("#user_pwd").focus();
                              idUsable = true;
                           }
                        } 
                        $("#kakao").val(kakaoid);                           
                        
                        break;
                     case '3':
                        alert("카카오 ID를 만드신 내역이 나옵니다. ID를 찾아주세요");
                        break;
                     }
                        },
                        error:function(data){
                           console.log("서버 통신 안됨");
                        }
                     }); 
         
                }
         
                })
      },
      fail: function(err) {
      alert("죄송합니다 오류가 있네요 ㅠ");
      }
    });
    
    
    
});
 //얼굴 인식 테스트 코드 
 function test10(){ 
   var formData = new FormData();
   formData.append("imgtest",$("#imgtest")[0].files[0]);
   
   $.ajax({
      url: "imgCheckTest.do",
      data : formData,
      processData:false,
      contentType:false,
      type:'POST',
      dataType:'JSON',
      success: function(data){
         var jsonObj = JSON.parse(data);
         var faceCount = jsonObj.info.faceCount;
         /* var landmark = jsonObj.faces[0].landmark; */
         if(faceCount == '0' ){
            alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
         }else{
            if(jsonObj.faces[0].landmark == null){
               alert("눈 코 입이 제대로 보이질 않아요 ");
            }else{
               alert("사람임");
            }   
         
      }
      },
      error:function(request, status, errorData){
         alert("error code: " + request.status + "\n"
               +"message: " + request.responseText
               +"error: " + errorData);
      }
   });

 } 
 

function kakaologout(){
   Kakao.Auth.logout();
   alert("로그아웃");
}


			//같은 이미지 인지 비교 하기
			var imgcheck1;
			var imgcheck2;
			var imgcheck3;
			
            // Get the modal
              var modal = document.getElementById('myModal');
            
              var myimg = document.getElementById("myimg");
              // Get the <span> element that closes the modal
              var span = document.getElementsByClassName("close")[0];                                          
              // When the user clicks on the button, open the modal 
              
              // 로그인 화면 
              var loginview = document.getElementById('loginview');
               // 회원가입 화면
              var infoView = document.getElementById('infoView');
            
              // 회원가입 버튼 눌렀을시
              var insertmemberview = document.getElementById("insertmemberview");
              // 비밀번호 찾기 
              var pwdCheckView = document.getElementById("pwdCheckView");
              
              // 취미란
              var nextpage1 = document.getElementById("nextpage1");
              var nextpage = document.getElementById("nextpage");
              
              //회원가입처음 view
              var infoView1 = document.getElementById('infoView1');
              
              // 회원가입취미 view
              var infoView2 = document.getElementById('infoView2');
              
              // 회원가입 취미 view(이전)
              var inforbtn = document.getElementById('inforbtn');
          
              
              // 사진 넣는 곳 보내는 버튼
              var lastpage = document.getElementById('lastpage');
              //유효성 체크 var
              var idUsable = false;
              var pwdUsable = false;
              var nickUsable = false;
              var phoneUsable = false;
              var heightUsable = false;
              var ageUsable = false;
              var addressUsable = false;
              var imgtitle = false;
              var imgsub = false;
              var imgsp = false;
              var imgcount = 0;
              var Hobbycount = 0;
              
              //로그인 버튼
              myimg.onclick = function() {
                  modal.style.display = "block";
                 loginview.style.display = "block";
                 infoView.style.display = "none";
                 pwdCheckView.style.display = "none";
              }
              //회원가입 시작 버튼
              insertmemberview.onclick = function(){
                 loginview.style.display = "none";
                 infoView.style.display = "block";
                 infoView1.style.display = "block";
                 infoView2.style.display = "none";
                 infoView3.style.display = "none";
                 pwdCheckView.style.display = "none";
              }
              //회원가입 첫페이지 유효성 검사 및 두번째 페이지로 넘어가는 버튼
              nextpage1.onclick=function(){
                 if(idUsable ==true && pwdUsable ==true && nickUsable ==true && phoneUsable ==true){
                 infoView1.style.display = "none";
                 infoView2.style.display = "block";
                 infoView3.style.display = "none";
                 }else{
                    if (idUsable == false) {
                     alert('아이디를 확인해 주세요');
                     insertmemberview.onclick();
                     return false;
                  }

                  if (pwdUsable == false) {
                     alert('비밀번호를 확인 해주세요');
                     insertmemberview.onclick();
                     return false;
                  }

                  if (nickUsable == false) {
                     alert('닉네임을 확인해주세요');
                     insertmemberview.onclick();
                     return false;
                  }

                  if (phoneUsable == false) {
                     alert("휴대폰 확인");
                     insertmemberview.onclick();
                     return false;
                  }
                 }
              } 
              //회원가입 2번째 화면에서 첫번째로 이동하는 이전 버튼
              inforbtn.onclick=function(){
                 infoView1.style.display = "block";
                 infoView2.style.display = "none";
                 infoView3.style.display = "none";
              }
              //회원가입 2번째 페이지에서 3번째 페이지로 이동 하는 버튼 및 유효성 검사
              lastpage.onclick=function(){
                 if(phoneUsable ==true && heightUsable == true && ageUsable==true && addressUsable==true &&
                       Hobbycount>=3)
                 {
                 infoView1.style.display = "none";
                 infoView2.style.display = "none";
                 infoView3.style.display = "block";
                 }else{


                  if (ageUsab == false) {
                     alert("나이가 안써있어요!");
                     return false;
                     nextpage1.onclick();
                  }

                  if (heightUsable == false) {
                     alert('키가 없어요 ㅠ');
                     nextpage1.onclick();
                     return false;
                  }

                  if (addressUsable == false) {
                     alert('사는곳이 공백이네요');
                     nextpage1.onclick();
                     return false;
                  }
                  
                    if (Hobbycount < 2) {
                     alert("흥미는  3개 이상 눌러주시길 바랍니다.");
                     nextpage1.onclick();
                     return false;
                  }
                 }
              }
              //회원가입 마지막 페이지에서 2번째 페이지로 이동하는 버튼 
              nextpage.onclick=function(){
                 infoView1.style.display = "none";
                 infoView2.style.display = "block";
                 infoView3.style.display = "none";
                 pwdCheckView.style.display = "none";
              }
              //비밀번호 찾기
              pwdCheck.onclick=function(){
                 loginview.style.display = "none";
                 pwdCheckView.style.display = "block";
              }
              
              // When the user clicks on <span> (x), close the modal
              span.onclick = function() {
                  modal.style.display = "none";
                  idUsable = false;
                  pwdUsable = false;
                  nickUsable = false;
                  phoneUsable = false;
                  heightUsable = false;
                  ageUsable = false;
                  addressUsable = false;
                  imgtitle = false;
                  imgsub = false;
                  imgsp = false;
                  imgcount = 0;
                  Hobbycount = 0;
                  $("#checkIdtext").css("color","rgb(0,0,0)");
                  $("#checkIdtext").html('아이디를 입력 해주세요');
                  
        	   	$("#checkPwdtext").css("color","rgb(0,0,0)");
       			$("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
       			
              	  $("#checkNicktext").css("color","rgb(0,0,0)");
          	      $("#checkNicktext").html("닉네임을 입력해주세요");
                  $("#SerchPwdForm").each(function(){
                	 this.reset(); 
                  });
                  $("#memberjoinForm").each(function(){
                 	 this.reset(); 
                   });
                 
              }
              // When the user clicks anywhere outside of the modal, close it
/*               window.onclick = function(event) {
                  if (event.target == modal) {
                      modal.style.display = "none";
                  }
              } */
              
              // 로그인 처리
              function loginCheck(){
                 
                 var loginId = $("#loginId");
                 var loginPwd = $("#loginPwd");
                 
                 if(loginId.val().length ==''){
                    alert("아이디 란이 비어있어요!");
                 }else{
                    if(loginPwd.val().length== 0){
                       alert("비밀번호 란이 비어있어요!");
                    }else{
                        $.ajax({
                            url:"mloginCheck.do",
                         data:{
                            user_id:loginId.val(),
                            user_pwd:loginPwd.val()
                            },
                      success:function(msg){
                         switch(msg){
                         case "0":{
                            alert("아이디를 확인해 주세요");
                            break;
                         }
                         case "1":{
                            alert("비밀번호를 확인해주세요");
                            break;
                            }
                         case "2":{
                            $("#loginviewform").submit();
                         }
                         }
                            
                      },
                      error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                     }
                   });  
                    }
                    
                 }

              }
              
              //비밀번호 찾기
              function serchPwdbtn(){
                 var serchId = $("#serchId");
                 
                 
                 if(serchId.val().length==''){
                    alert("아이디를 필수로 입력하셔야 겠죠?");
                 }else{
                       $.ajax({
                               url:"minsertIdCheck.do",
                            data:{
                               user_id:serchId.val(),
                               },
                         success:function(IDCheck){
                     if(IDCheck =="false"){
                        //임시 비밀번호
                  var text = "";
                  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?!";
                    for (var i = 0; i < 7; i++) {
                        text += possible.charAt(Math.floor(Math.random()* possible.length));
                     }
                    
                     var data = {
                            service_id: 'jang_jun_ha',
                            template_id: 'template_ruYgHWzb',
                            user_id: 'user_bcxE963izU0XoV5jKMmvq',
                            template_params: {
                                'username': 'JunHa',
                                'g-recaptcha-response': '03AHJ_ASjnLA214KSNKFJAK12sfKASfehbmfd...',
                                'user_Email' : serchId.val() ,
                                'message_html' : text
                            }
                        };
                         
                        $.ajax('https://api.emailjs.com/api/v1.0/email/send', {
                            type: 'POST',
                            data: JSON.stringify(data),
                            contentType: 'application/json'
                        }).done(function() {
                            alert('임시비밀번호가 전송이 되었습니다.');
                            $("#findPwd").val(text);
                            
                            $("#SerchPwdForm").submit();
                        }).fail(function(error) {
                            alert('죄송합니다. 보내지 못하였습니다.');
                        }); 

                     }else{
                        alert("가입이 되지 않은 아이디네요!");
                     }
                               
                         },
                         error:function(request, status, errorData){
                           alert("error code: " + request.status + "\n"
                                 +"message: " + request.responseText
                                 +"error: " + errorData);
                        }
                      });
                 } 
              }
              
            //버튼 검사
            var moviebl = false;
            var singbl = false;
            var gamebl = false;
            var jmtbl = false;
            var petbl = false;
            var cafebl = false;
            var workingbl = false;
            var potobl = false;
            var travelbl = false;
            function hobbybtn(a, e){
            	switch (e) {
				case 1:
					if(moviebl == false){
						$("#moviediv").css("background","#A3A0ED");
						$("#movie").prop("checked",true);
	                 	Hobbycount = Hobbycount +1;
	                 	$("#movie").val('Y');
	            		moviebl = !moviebl;
					}else{
						$("#moviediv").css("background","#A6A6A6");
						$("#movie").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#movie").val('N');
	                	alert($("#movie").val());
	            		moviebl = !moviebl;
					}
					break;
				case 2:
					if(singbl == false){
						$("#singdiv").css("background","#A3A0ED");
						$("#sing").prop("checked",true);
	                 	Hobbycount = Hobbycount +1;
	                 	$("#sing").val('Y');
						singbl = !singbl;
					}else{
						$("#singdiv").css("background","#A6A6A6");
						$("#sing").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#sing").val('N');
						singbl = !singbl;
					}
					break;
				case 3:
					if(gamebl == false){
						$("#gamediv").css("background","#A3A0ED");
						$("#game").prop("checked",true);
	                 	Hobbycount = Hobbycount +1;
	                 	$("#game").val('Y');
						gamebl = !gamebl;
					}else{
						$("#gamediv").css("background","#A6A6A6");
						$("#game").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#game").val('N');
						gamebl = !gamebl;
					}
					break;
				case 4:
					if(jmtbl == false){
						$("#jmtdiv").css("background","#A3A0ED");
						$("#jmt").prop("checked",true);
	                 	Hobbycount = Hobbycount +1;
	                 	$("#jmt").val('Y');
						jmtbl = !jmtbl;
					}else{
						$("#jmtdiv").css("background","#A6A6A6");
						$("#jmt").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#jmt").val('N');
						jmtbl = !jmtbl;
					}
					break;
				case 5:
					if(petbl == false){
						$("#petdiv").css("background","#A3A0ED");
						$("#pet").prop("checked",true);
					  	Hobbycount = Hobbycount +1;
		                $("#pet").val('Y');
						petbl = !petbl;
					}else{
						$("#petdiv").css("background","#A6A6A6");
						$("#pet").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#pet").val('N');
						petbl = !petbl;
					}
					break;
				case 6:
					if(cafebl == false){
						$("#cafediv").css("background","#A3A0ED");
						$("#cafe").prop("checked",true);
					  	Hobbycount = Hobbycount +1;
		                $("#cafe").val('Y');
						cafebl = !cafebl;
					}else{
						$("#cafediv").css("background","#A6A6A6");
						$("#cafe").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#cafe").val('N');
						cafebl = !cafebl;
					}
					break;
				case 7:
					if(workingbl == false){
						$("#workingdiv").css("background","#A3A0ED");
						$("#working").prop("checked",true);
					  	Hobbycount = Hobbycount +1;
		                $("#working").val('Y');
						workingbl = !workingbl;
					}else{
						$("#workingdiv").css("background","#A6A6A6");
						$("#working").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#working").val('N');
						workingbl = !workingbl;
					}
					break;
				case 8:
					if(potobl == false){
						$("#potodiv").css("background","#A3A0ED");
						$("#poto").prop("checked",true);
					  	Hobbycount = Hobbycount +1;
		                $("#poto").val('Y');
						potobl = !potobl;
					}else{
						$("#potodiv").css("background","#A6A6A6");
						$("#poto").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#poto").val('N');
						potobl = !potobl;
					}
					break;
				case 9:
					if(travelbl == false){
						$("#traveldiv").css("background","#A3A0ED");
						$("#travel").prop("checked",true);
					  	Hobbycount = Hobbycount +1;
		                $("#travel").val('Y');
						travelbl = !travelbl;
					}else{
						$("#traveldiv").css("background","#A6A6A6");
						$("#travel").prop("checked",false);
					  	Hobbycount = Hobbycount -1;
		                $("#travel").val('N');
						travelbl = !travelbl;
					}
					break;
				}
            }
          
              
              //div로 이미지 등록 하는 법
               $(function(LoadImg){
                  $("#fileArea").hide(); 
                  
                  $("#first").click(function(){
                     $("#thumbnailImg1").click();
                  });
            
                  $("#second").click(function(){
                  $("#thumbnailImg2").click();
                  });
               
                  $("#third").click(function(){
                  $("#thumbnailImg3").click();
                  });
               
               });
                  // 이미지 업로드 
		
               function LoadImg(value, num) {
                  if (value.files[0] != undefined) {
                     var reader = new FileReader();
                     reader.onload = function(e) {
                        switch (num) {
                        case 1:
                           var formData = new FormData();
                           formData.append("imgtest",$("#thumbnailImg1")[0].files[0]); 
                           $.ajax({
                              url: "imgCheckTest.do",
                              data : formData,
                              processData:false,
                              contentType:false,
                              type:'POST',
                              dataType:'JSON',
                              success: function(data){
                            	  imgcheck1 = data;
                                 var jsonObj = JSON.parse(data);
                                 var faceCount = jsonObj.info.faceCount;
                                 /* var landmark = jsonObj.faces[0].landmark; */
                                 if(faceCount == '0' ){
                                    alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                    $("#firstImg").attr("src", "resources/images/image.png");
                                    imgtitle = false;
                                 }else{
                                    if(jsonObj.faces[0].landmark == null){
                                       alert("눈 코 입이 제대로 보이질 않아요 ");
                                       $("#firstImg").attr("src", "resources/images/image.png");
                                       imgtitle = false;
                                    }else{
                                      	if(imgcheck1 == imgcheck2 || imgcheck1 == imgcheck3){
                                     		alert("중복사진 금지 입니다.");
                                     		$("#firstImg").attr("src", "resources/images/image.png");
                                     		imgtitle = false;
                                      	}else{
                                     		alert("첫번째 사진 등록 완료");
                                             $("#firstImg").attr("src", e.target.result);
                                             imgtitle = true;
                                     	}
                                    }   
                              }
                              },
                              error:function(request, status, errorData){
                                 alert("error code: " + request.status + "\n"
                                       +"message: " + request.responseText
                                       +"error: " + errorData);
                              }
                           });
                           break;
                        case 2:
                           var formData = new FormData();
                           formData.append("imgtest",$("#thumbnailImg2")[0].files[0]); 
                           $.ajax({
                              url: "imgCheckTest.do",
                              data : formData,
                              processData:false,
                              contentType:false,
                              type:'POST',
                              dataType:'JSON',
                              success: function(data){
                            	  imgcheck2 = data;
                                 var jsonObj = JSON.parse(data);
                                 var faceCount = jsonObj.info.faceCount;
                                 /* var landmark = jsonObj.faces[0].landmark; */
                                 if(faceCount == '0' ){
                                    alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                    $("#secondImg").attr("src", "resources/images/image.png");
                                    imgsub = false;
                                 }else{
                                    if(jsonObj.faces[0].landmark == null){
                                       $("#secondImg").attr("src", "resources/images/image.png");
                                       alert("눈 코 입이 제대로 보이질 않아요 ");
                                       imgsub = false;
                                    }else{
                                    	if(imgcheck2 == imgcheck1 || imgcheck2 == imgcheck3){
                                    		alert("중복사진 금지 입니다.");
                                    		$("#secondImg").attr("src", "resources/images/image.png");
                                    		imgsub = false;
                                    	}else{
                                    		alert("두번째 사진 등록 완료");
                                            $("#secondImg").attr("src", e.target.result);
                                            imgsub = true;	
                                    	}
                                    
                                    }   
                              }
                              },
                              error:function(request, status, errorData){
                                 alert("error code: " + request.status + "\n"
                                       +"message: " + request.responseText
                                       +"error: " + errorData);
                              }
                           });
                           break;
                        case 3:
                           var formData = new FormData();
                           formData.append("imgtest",$("#thumbnailImg3")[0].files[0]); 
                           $.ajax({
                              url: "imgCheckTest.do",
                              data : formData,
                              processData:false,
                              contentType:false,
                              type:'POST',
                              dataType:'JSON',
                              success: function(data){
                            	  imgcheck3 = data;
                                 var jsonObj = JSON.parse(data);
                                 var faceCount = jsonObj.info.faceCount;
                                 /* var landmark = jsonObj.faces[0].landmark; */
                                 if(faceCount == '0' ){
                                    alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                    $("#thirdImg").attr("src", "resources/images/image.png");
                                    imgsp = false;
                                 }else{
                                    if(jsonObj.faces[0].landmark == null){
                                       $("#thirdImg").attr("src", "resources/images/image.png");
                                       alert("눈 코 입이 제대로 보이질 않아요 ");
                                       imgsp = false;
                                    }else{
                                    	if(imgcheck3 == imgcheck1 || imgcheck3 == imgcheck2){
                                    		alert("중복사진은 안되요");
                                    		$("#thirdImg").attr("src", "resources/images/image.png");
                                    		imgsp = false;
                                    	}else{
                                    		alert("사람임");
                                            $("#thirdImg").attr("src", e.target.result);
                                            imgsp = true;	
                                    	}
                                       
                                    }   
                              }
                              },
                              error:function(request, status, errorData){
                                 alert("error code: " + request.status + "\n"
                                       +"message: " + request.responseText
                                       +"error: " + errorData);
                              }
                           });
                           break;
                        }
                     }
                     reader.readAsDataURL(value.files[0]);
                  }
               }
                  
   
            $(function() {
                  $("#Imglist").sortable(); // id가 "sortable" 인 태그의 내부에 포함된 태그를 사용해서 드래그 가능한 리스트를 만듦
                  $("#Imglist").disableSelection(); // 상자 선택만 하도록 함 텍스트를 선택 취소 할 수있게하려는 경우 유용합니다.
                  $("#Imglist").suffer();
               });
            //이메일 변경 및 전체 유효성 검사
            function toEnabled() {
               $("#user_email").attr("disabled",false);   // 메일주소 제대로 넘어가게
               }

            
            $(function(){
                $("#user_email").val($("#email option").eq(0).val());
             });
            
            $('#email').change(function(){
                $("#email option:selected").each(function () {
                  if($(this).parent().val()== "1"){ // 직접입력일 경우
                     $("#user_email").val(""); // 값 초기화
                     $("#user_email").attr("disabled",false); // 활성화
                     checkId();
                  }else{ // 직접입력이 아닐경우
                     $("#user_email").val($(this).parent().val()); // 선택값 입력
                     $("#user_email").attr("disabled",true); // 비활성화
                     checkId();
                  }
               }); 
            });
            
            //유효성 검사 실행 하자
             
             var engCheck = /^[a-zA-Z0-9]*$/;
             function checkId(){
               var user_id = $("#user_id");
            var checkIdtext = $("#checkIdtext");
               
                  if(!engCheck.test(user_id.val())){
                     alert("영어 및 숫자만 입력가능합니다.");
                       user_id.val('');
                       $("#checkIdtext").css("color","rgb(255,0,0)");
                       checkIdtext.html('다시 입력 해주세요!')
                       idUsable = false;
                     }else{
                        if(user_id.val().length==0){
                         $("#checkId").css('background','');
                         $("#checkIdtext").css("color","rgb(0,0,0)");
                         checkIdtext.html('아이디를 입력 해주세요');
                         idUsable = false;
                        }
                        else{
                         $('#checkId').focusout(function() {
                              var user_id = $("#user_id");
                              var user_email = $("#user_email");
                              $.ajax({
                                  url:"minsertIdCheck.do",
                               data:{
                                  user_id:user_id.val(),
                                  user_email:user_email.val()},
                            success:function(IDCheck){
                                  if(IDCheck == "true"){
                                   if(user_id.val().length==0){
                                	 $("#checkIdtext").css("color","rgb(0,0,0)");
                                     $("#checkId").css('background','');
                                     checkIdtext.html('아이디를 입력 해주세요');
                                     idUsable = false;
                                    }else{

                                 $("#checkIdtext").css("color","#00cc66");
                                 checkIdtext.html('가입 가능한 아이디 입니다.');
                                 idUsable = true;
                                    }
                                  }
                                  else{
                                   user_id.focus();
                                   $("#checkIdtext").css("color","rgb(255,0,0)");
                                   checkIdtext.html('이미 가입된 아이디 입니다.');
                                   idUsable = false;
                                  }
                            },
                            error:function(request, status, errorData){
                              alert("error code: " + request.status + "\n"
                                    +"message: " + request.responseText
                                    +"error: " + errorData);
                           }
                         }); 
                           });
                        }
                     }
                  
                  }; 
                  
   //비밀번호 부분

$(function() {
	
	$("#hobby").hide();
	
         $('#user_pwd').keyup(function() {
            var pwdCheck = /^[a-zA-Z0-9]*$/;
            
            if(!pwdCheck.test($("#user_pwd").val())){
             	 $("#checkPwdtext").css("color","rgb(255,0,0)");
                 $("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
                 $("#user_pwd").val('');
                 pwdUsable = false;
            }else{
               if($("#user_pwd").val().length==0){
                 $("#checkPwd").css('background','');
                 	$("#checkPwdtext").css("color","rgb(255,0,0)");
                    $("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
                   pwdUsable = false;
               }else{
            	   $("#checkPwdtext").css("color","#ff3399");
                   $("#checkPwdtext").html("잘 입력 되고 있어요");    
               }
            }
         });
      $('#user_pwd').focusout(function(){
         if($("#user_pwd").val().length==0){
        	 $("#checkPwdtext").css("color","rgb(255,0,0)");
                   $("#checkPwdtext").html("비밀번호칸이 비어있어요");
              pwdUsable = false;
         }else{
         if($("#user_pwd").val() != $("#user_pwdC").val()){
        	 $("#checkPwdtext").css("color","#ff3399");
                   $("#checkPwdtext").html("비밀번호 확인란을 작성해 주세요");    
              pwdUsable = false;
         }else{
        	 $("#checkPwdtext").css("color","#00cc66");
                   $("#checkPwdtext").html("비밀번호 일치 합니다.");
               pwdUsable = true;
         }
         }
      });
      $('#user_pwdC').keyup(function() {
           var pwdCheck = /^[a-zA-Z0-9]*$/;
           
           if(!pwdCheck.test($("#user_pwdC").val())){
        	   $("#checkPwdtext").css("color","rgb(255,0,0)");
                 $("#checkPwdtext").html("특수문자 및 공백을 쓰시면 안되요!");
                 $("#user_pwdC").val('');
                 pwdUsable = false;
           }else{
              if($("#user_pwdC").val().length==0){
                $("#checkPwd").css('background','');
                $("#checkPwdtext").css("color","rgb(255,0,0)");
                      $("#checkPwdtext").html("비밀번호를 입력 해 주세요!");
                   pwdUsable = false;
              }else{
            	  $("#checkPwdtext").css("color","#ff3399");
                      $("#checkPwdtext").html("잘 입력 되고 있어요");    
              }
           }
        });
      
      $('#user_pwdC').focusout(function(){
         if($("#user_pwdC").val().length==0){
        	 $("#checkPwdtext").css("color","rgb(255,0,0)");
                   $("#checkPwdtext").html("비밀번호 확인란이 비어있어요");
               pwdUsable = false;
         }else{
         if($("#user_pwd").val() != $("#user_pwdC").val()){
        	 $("#checkPwdtext").css("color","rgb(0,0,255)");
                   $("#checkPwdtext").html("비밀번호를 일치시켜주세요");    
               pwdUsable = false;
         }else{
        	 $("#checkPwdtext").css("color","#00cc66");
                   $("#checkPwdtext").html("비밀번호 일치 합니다.");
               pwdUsable = true;
         }
         }
      });
      });
      
      
      //닉네임
      
      
      $(function(){
         $("#user_nick").focusout(function(){
            var user_nick = $("#user_nick");
            if(user_nick.val().length == 0){
            	$("#checkNicktext").css("color","rgb(255,0,0)");
                  $("#checkNicktext").html("닉네임 창이 비어있어요");
               nickUsable = false;
            }else{
               $.ajax({
                  url:"minsertNickCheck.do",
                  data:{user_nick:user_nick.val()},
                  success:function(NickCheck){
                     if(NickCheck == "true"){
                             if(user_nick.val().length==0){
                               $("#checkNick").css('background','');
                               $("#checkNicktext").css("color","rgb(0,0,0)");
                               $("#checkNicktext").html("닉네임 창이 비어있어요");
                               nickUsable = false;
                              }else{
                            	  $("#checkNicktext").css("color","#00cc66");
                           $("#checkNicktext").html("사용가능한 닉네임이에요");
                           nickUsable = true;
                              }
                            }else{
                            	$("#checkNicktext").css("color","rgb(255,0,0)");
                          
                              user_nick.focus();
                             $("#checkNicktext").html("이미 사용된 닉네임이에요");
                             nickUsable = false;
                            }
                  },
                  error:function(request, status, errorData){
                     alert("error code: " + request.status + "\n"
                           +"message: " + request.responseText
                           +"error: " + errorData);
                  }
               });
            }
         });
      });
      
      //휴대폰 유효성 검사
      
      $(function(){
        var phone2 = $("#phone2");
        var phone3 = $("#phone3");
        var intCheck = /^[0-9]*$/;
        
        phone2.keyup(function(){
           if(!intCheck.test(phone2.val())){
              alert("숫자만입력하세요");
              phone2.val('');
              phoneUsable = false;
           }else if(phone2.val().length==4){
              phone3.focus();
            }else{
               
            }    
           
        });
        
        phone3.keyup(function(){
           if(phone3.val().length <4  && !intCheck.test(phone3.val())){
              alert("숫자만입력하세요");
              phone3.val('');
              phoneUsable = false;
           }else if(phone3.val().length==4){
              $("#nextpage1").focus();
              phoneUsable = true;
            }
        });
      });
      
      //키 / 나이 / 주소 입력 유효성 검사
      
      $(function(){
        var height = $("#height");
        
        var age = $("#age");
        var address = $("#address");
        
        var intCheck = /^[0-9]*$/;
        var korCheck = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]*$/;
        height.keyup(function(){
           if(height.val().length <3  && !intCheck.test(height.val())){
              alert("숫자만입력하세요");
              height.val('');
              heightUsable = false;
           }else if(height.val().length==3){
              age.focus();
              heightUsable = true;
              
            }
        });
        
        age.keyup(function(){
           if(age.val().length <2  && !intCheck.test(age.val())){
              alert("숫자만입력하세요");
              age.val('');
              ageUsable = false;
           }else if(age.val().length==2){
              address.focus();
              ageUsable = true;
            }
        });
        
        address.keyup(function(){
           if(!korCheck.test(address.val())){
              alert("문자 및 영문만 됩니다.");
              address.val('');
              addressUsable = false;
           }else{
              addressUsable = true;
           }
        });
      });
      
      //체크 박스 유효성 검사
      $(function(){
    	  
         $("#movie").change(function(){
             if($("#movie").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#movie").val('Y');

            }else{
               Hobbycount = Hobbycount -1;
               $("#movie").val('N');
            }  
         });
         
         $("#sing").change(function(){
             if($("#sing").is(":checked")){
                $("#sing").val('Y');
                Hobbycount = Hobbycount +1;
            }else{
               Hobbycount = Hobbycount -1;
               $("#sing").val('N');
            }  
         });
         
         $("#game").change(function(){
             if($("#game").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#game").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#game").val('N');
            }  
         });
         
         $("#jmt").change(function(){
             if($("#jmt").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#jmt").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#jmt").val('N');
            }  
         });
         
         $("#pet").change(function(){
             if($("#pet").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#pet").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#pet").val('N');
            }  
         });
         
         $("#cafe").change(function(){
             if($("#cafe").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#cafe").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#cafe").val('Y');
            }  
         });
         
         $("#working").change(function(){
             if($("#working").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#working").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#working").val('N');
            }  
         });
         
         $("#poto").change(function(){
             if($("#poto").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#poto").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#poto").val('N');
            }  
         });
         
         $("#travel").change(function(){
             if($("#travel").is(":checked")){
                Hobbycount = Hobbycount +1;
                $("#travel").val('Y');
            }else{
               Hobbycount = Hobbycount -1;
               $("#travel").val('N');
            }  
         });
         
         
                
      });

/*       $(function(){
         
         $('#memberjoinForm').submit(function() {


              
           });
         
         
      }); */
      
      
      // 버튼 minsertbtn gkatn
      function abc(){
                      if (imgtitle == false) {
                        alert("첫 사진 확인 해주세요");
                        return false;
                     }
                     if (imgsub == false) {
                        alert("두번째 사진 확인 해주세요");
                        return false;
                     }
                     if (imgsp == false) {
                        alert("세번째 사진 확인");
                        return false;
                     }
                      
                      alert("회원가입 완료");
                     $("#memberjoinForm").submit();
                                          
      };
      

                  </script>   
   </div>
            
      <div class="btn_scroll">
         <a href="#service" class="scroll">
         <img src="resources/images/btn_scroll_down.png" alt="스크롤다운" /></a>
      </div>
   </div>

    <div class="section service" id="service"  style="background: white;">
       <div style="margin-top: 5%;
                   text-align-last: center;
				   font-size: 32px;
				   font-weight: 900;">
		WHAT IS AMANDA?<br>
		<p style="opacity: 0.5; font-size: 25px; font-weight: 400">Premium Service for people who wants to meet random people</p>
								
								
								
						<div id="intro1" 
					         style="display: inline-block;
					                margin-left: 0%;
					                text-align-last: right;
					                font-size: 15px;">
					     	<div id="introBtnWrapper">
						       <div style="display: inline-block;">
						        <p><h5>신입심사</h5></p><br>
							    <p style="opacity: 0.5; font-weight: 500;">내가 직접 신입회원을 심사하고,<br> 괜찮은 이성에겐 호감을 표시해요</p>
						       </div>
						       <button class="introBtns" id="introBtns2" style=" margin-left: 30px;"><img src="resources/images/file1.png" onmouseover="this.src='resources/images/file.png'" onmouseout="this.src='resources/images/file1.png'" style="z-index: 100; width: 30px; height: 30px; padding: 3px; margin-right: 3px;"></button>
					     	</div>
						    <div id="introBtnWrapper">
						       <div style="display: inline-block;">
						        <p><h5>소개팅</h5></p><br>
							    <p style="opacity: 0.5; font-weight: 500;">하루에 2명, 내 이상형에 맞춘<br> 소개팅을 무료로 받아요</p>
						       </div>
						       <button class="introBtns" id="introBtns2" style=" margin-left: 30px;"><img src="resources/images/couple1.png" onmouseover="this.src='resources/images/couple2.png'" onmouseout="this.src='resources/images/couple1.png'" style="z-index: 100; width: 30px; height: 30px; padding: 3px; margin-right: 3px;"></button>
						    </div>
						    <div id="introBtnWrapper">
						       <div style="display: inline-block;">
						        <p><h5>카드리스트</h5></p><br>
							    <p style="opacity: 0.5; font-weight: 500;">앱에서 만난 모든 이성은 <br>카드리스트에서 확인해요</p>
						       </div>
						       <button class="introBtns" style=" margin-left: 30px;"><img src="resources/images/introHeart.png" onmouseover="this.src='resources/images/introHeart2.png'" onmouseout="this.src='resources/images/introHeart.png'" style="z-index: 100; width: 30px; height: 30px; padding: 3px; margin-right: 3px;"></button>
						    </div>
					    </div>	
					    
					    	
					    <img  src="resources/images/aman.png" 
									         style="width: 500px;
									                height: 400px;
									                margin-bottom: 13%;
						                            margin-top: 8%;
						                            margin-left: 3%;">
												                            
						<div id="intro2" 
					         style="display: inline-block;
					                margin-left: 3%;
					                font-size: 15px;
					                text-align-last: auto;">
					     	<div id="introBtnWrapper">
							<button class="introBtns" style=" margin-right: 30px;"><img src="resources/images/introChat.png" onmouseover="this.src='resources/images/introChat2.png'" onmouseout="this.src='resources/images/introChat.png'" style="z-index: 100; width: 30px; height: 30px; padding: 3px; margin-right: 3px;"></button>
						       <div style="display: inline-block;">
						        <p><h5>채팅</h5></p><br>
							    <p style="opacity: 0.5; font-weight: 500;">부담스런 연락처 공개 No!<br> 서로 연결되면 대화방이 열려요</p>
						       </div>
					     	</div>
						    <div id="introBtnWrapper">
					        <button class="introBtns" style=" margin-right: 30px;"><img src="resources/images/infor1.png" onmouseover="this.src='resources/images/infor2.png'" onmouseout="this.src='resources/images/infor1.png'" style="z-index: 100; width: 30px; height: 30px; padding: 3px; margin-right: 3px;"></button>
						       <div style="display: inline-block;">
						        <p><h5>상세프로필</h5></p><br>
							   <p style="opacity: 0.5; font-weight: 500;">이성의 자세한 소개와 사진을 <br>보고 마음에 들면 호감을 표시해요</p>
						       </div>
						    </div>
						    <div id="introBtnWrapper">
						    <button class="introBtns" style=" margin-right: 30px;"><img src="resources/images/teamwork1.png" onmouseover="this.src='resources/images/teamwork2.png'" onmouseout="this.src='resources/images/teamwork1.png'" style="z-index: 100; width: 35px; height: 35px; padding: 3px; margin-right: 3px;"></button>
						       <div style="display: inline-block;">
						        <p><h5>미팅</h5></p><br>
							   <p style="opacity: 0.5; font-weight: 500;">아만다의 다른 이성들을<br> 친구와 함께 만나요</p>
						       </div>
						    </div>
					    </div>	
								
	    </div>
    </div>
    <!--//section-->
<!-- <style>

#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>



출처: https://woodstar.tistory.com/58 [MOUSE world] -->
		<!-- 	<video id="video" preload="auto" autoplay="true" loop="loop"
				muted="muted" volume="0">
				<source src="resources/video/Welcome.mp4">
			</video>
			<div class="content">
				<p class="title_st1 eng">INTERVIEW</p>
				<a href="/career#interview">
					<p class="cont">
						만족스런 주문 경험을 제공할 수 있는<br />서비스를 기획합니다. <span class="team">기술연구소,
							Consumer Product팀</span> <span class="name">박소희</span>
					</p>
				</a>
				<div class="slider_ar">
					<a href="javascript:;" class="prev"></a> <a href="javascript:;"
						class="next"></a>
					<div class="count">
						<span class="idx">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</span> <span
							class="dash"><img
							src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
							class="length">6</span>
					</div>
				</div>
			</div> -->
			<!--content-->
			<div class="section interview" id="interview" style="">
            <ul class="slider">
               <li>
                  <div class="slider_img">
                  <img src="resources/face/G.jpg"/>
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                    아무나 만나는 당신 지금 당장 여기로 !<br />
                           <span class="team">이제 더이상 현실에서 찾지마세요!<br><br>
									당신이 바라던만남 바로 여기서!<br><br>
									아만다가 당신의 짝을 찾아드립니다!</span>
                            <span class="name">안상재</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>
                        <div class="count">
                           <span class="idx">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
                              class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               <li>
                  <div class="slider_img">
                  	<img src="resources/face/t2.JPG"/>
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                    아무나 만나는 당신 지금 당장 여기로 !<br />
                           <span class="team">이제 더이상 현실에서 찾지마세요!<br><br>
									당신이 바라던만남 바로 여기서!<br><br>
									아만다가 당신의 짝을 찾아드립니다!</span>
                            <span class="name">박상훈</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>

                        <div class="count">
                           <span class="idx"> 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ </span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> 
                              <span class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               <li>
                  <div class="slider_img">
                     <img src="resources/face/O.jpg" />
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                   운명처럼 당신에게 다가올것입니다<br />
                           <span class="team">
							당신이 아만다에 첫발을 디디는 순간<br><br>
							당신은 더 이상 혼자가 아닙니다.<br><br>
							아만다와 함께 하세요!
									</span>
                            <span class="name">임재윤</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>

                        <div class="count">
                           <span class="idx"> 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ </span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
                              class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               <li>
                  <div class="slider_img">
                     <img
                        src="resources/face/O.jpg" />
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                    당신의 운명을 테스트하세요<br />
                           <span class="team">
								더이상의 커플지옥 솔로천국은 그만!<br><br>
								당신도 커플이될수있습니다<br><br>
								바로 여기 아만다에서
									</span>
                            <span class="name">박진형</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>

                        <div class="count">
                           <span class="idx"> 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ </span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
                              class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               <li>
                  <div class="slider_img">
                     <img
                        src="resources/face/O.jpg" />
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                    아무나 만나는 당신 지금 당장 여기로 !<br />
                           <span class="team">
                           			이제 더이상 현실에서 찾지마세요!<br><br>
									당신이 바라던만남 바로 여기서!<br><br>
									아만다가 당신의 짝을 찾아드립니다!</span>
                            <span class="name">장준하</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>

                        <div class="count">
                           <span class="idx"> 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ </span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
                              class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               <li>
                  <div class="slider_img">
                     <img
                        src="resources/face/O.jpg" />
                  </div>
                  <div class="content">
                     <p class="title_st1 eng">INTERVIEW</p>
                     <a href="">
                        <p class="cont">
                                                    AMANDA는 항상 당신을 응원 합니다.<br />
                           <span class="team">
                           
                           </span>
                            <span class="name">AMANDA</span>
                        </p>
                     </a>
                     <div class="slider_ar">
                        <a href="javascript:;" class="prev"></a> <a href="javascript:;"
                           class="next"></a>

                        <div class="count">
                           <span class="idx"> 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ </span> <span class="dash"><img
                              src="/public/images/slide_count_bar_g.png" alt="" /></span> <span
                              class="length">6</span>
                        </div>
                     </div>
                  </div> <!--content-->
               </li>
               
            </ul>
         </div>
         <!--//section-->
         
         
         
         
         
    <!-- 마지막 페이지(footer)  -->    
	<div class="section notice" id="notice">
        <div class="content">
        sdfsdf
            <!-- 왼쪽 컨텐츠 -->
			<div class="left" id="introFooter" style="width: 600px;height: 585px; background: none; margin-left: -12%; color: black;">
				<div style="width:100%; height:100%; background: none; color: black; font-size: 20px;">
					<div>
						<img id="introLogo" src="resources/images/introAMANDA.png" style="width: 200px; height: 80px; margin-left: 9%; margin-top: 15%; margin-bottom: 10%;" alt="사진없음">
					</div>		
					<div style="margin-left: 10%;">
						<h3>AMANDA</h3><br>
						<p>
							KH정보교육원<br>
							팀장 : 장준하  <br>
							팀원 : 박상훈, 박진형, 안상재, 임재1윤  <br>
							대표자 : 김용승  <br>
							책임자 : 김용승  <br>
							주소 : 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층  <br><br>
							
							<p style="font-weight: 500;">Copyright © 1998-2019 <br>KH Information Educational Institute All Right Reserved</p>
						</p>
					</div>
				</div>
			</div>
			
			<!-- 가운데 컨텐츠 -->
			<div class="center" id="introFooter" style="width: 300px;height: 585px; background: white;">
				<div style="width:100%; height:100%; background: none; color: black; font-size: 20px;">
					<div>
						<img id="introLogo" src="resources/images/grad.png" style="width: 70px; height: 70px;" alt="사진없음">
					</div>		
					<div style="margin-left: 8%;">
						<h3>VISION OF KH STUDENTS</h3><br>
						<p style="text-align: -webkit-left;">
							KH Institute of Information and Communication
							has developed technology to improve international 
							competitiveness to solve the youth unemployment problem.
							Lifelong education system to be realistic
							The virtuous cycle of individuals, companies, and nations
						</p>
					</div>
				</div>
			</div>
			<!-- 오른쪽 컨텐츠 -->
			<div class="right" id="introFooter" style="width: 300px;height: 585px; background: white;">
				<div style="width:100%; height:100%; background: none; color: black; font-size: 20px;">
					<div>
						<img id="introLogo" src="resources/images/mindmap.png" style="width: 60px; height: 60px; " alt="사진없음">
					</div>		
					<div style="margin-left: 10%;">
						<h3>PARTNER COMPANY</h3><br>
						<ul id="pt">
							<li id="pt1"><a href="https://tinder.com/?lang=koz" target='_blank'>TINDER</a></li><br>
							<li id="pt2"><a href="https://ko-kr.facebook.com/meeffkorea/" target="_blank">MEEFF</a></li><br>
							<li id="pt3"><a href="https://www.iei.or.kr/main/main.kh" target="_blank">KH 정보교육원</a></li>
						</ul>
				</div>
			</div>
        </div>
        <!--content-->
    </div>
    <!--//section-->
</div>
</div>

    <script>
    $(document).ready(function() {
        scrollNav();
        $(window).scroll(function() {
            scrollNav();
        });
    });

    function scrollNav() {

        win_top = $(window).scrollTop();
        part1 = $("#visual").offset().top;
        part2 = $("#service").offset().top;
        part3 = $("#interview").offset().top;
        part4 = $("#notice").offset().top;

        if (win_top < part2) {
            $(".nav li").removeClass('active');
            $(".nav1").addClass('active');
        } else if (win_top >= part2 && win_top < part3) {
            $(".nav li").removeClass('active');
            $(".nav2").addClass('active');
        } else if (win_top >= part3 && win_top < part4) {
            $(".nav li").removeClass('active');
            $(".nav3").addClass('active');
        } else if (win_top >= part4) {
            $(".nav li").removeClass('active');
            $(".nav4").addClass('active');
        }
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            $(".nav li").removeClass('active');
            $(".nav4").addClass('active');
        }
    }
</script>