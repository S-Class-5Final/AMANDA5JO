<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- modal start -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- modal end -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style>
*{margin:0; padding:0;}
/* 메인 DIV */
.myUpdateMemberBody{width:1000px; height:1400px; margin-top:50px; margin-left:600px; font-size:15px; bold:1px solid}
/* 각각의 lavel div 포함한 DIV  */

.myUpdateMemberDiv{width:100%; height:80px;line-height:20px; margin-top:15px; padding-left:150px; border-bottom:1px dotted; }
.myUpdateMemberDiv label{margin-left:20px; font-weight:bold; color:#424242; }
.myUpdateMemberDiv input{margin-left:12px;  }
.myUpdateMemberDiv select{margin-left:50px;}
.myHobbyDiv{padding: 10px;  margin-left:60px; margin-top:10px;}
.myHobbyDiv label{font-size:18px;}


/* 수정하기 버튼 효과 */
.myUpdateBtnClass {
margin-left:370px; 
	margin-top:40px;
  width: 200px;
  height: 60px;
  font-family: 'Roboto', sans-serif;
  font-size: 23px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.myUpdateBtnClass:hover {
  background-color: #424242;
  color: #fff;
  transform: translateY(-7px);
}







.myUpdateMemberDiv input[type="text"], input[type="number"], input[type="password"]{ border-radius: 10px;border: 2px solid #fd6584; padding: 20px; width: 200px; height:15px; }

/*  .myHobbyCheck { display: none;}   /* input 체크박스 hidden */ 

.myUpdateMemberImg{
	width:220px; 
	height:250px; 
	border:1px solid ;
	
}

#myUpdateMemberImgDiv{height:350px; margin-top:20px;}

#myfileList{padding-top:30px;display:flex;height:350px;width:1000px;}

.myFileListDiv{
padding-top:50px;
margin-left:80px;
width:250px;
height:250px;
}


/* 모달 checkbox div 클릭시 컬러  */
.myAddClassColor{color:black;}
.myRemoveClassColor{border-color: rgb(255, 0, 125);
    color: rgb(255, 0, 125);}


/* 위 회원정보수정 글자 효과 */
h1 {
  cursor: default;
  width: 100%;
  height: 100px;
  display: block;
  text-align: center;
}

h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  -webkit-animation: bounce 0.3s ease infinite alternate;
  font-size: 50px;
  color: pink;
  text-shadow: 0 1px 0 #ccc, 0 2px 0 #ccc, 0 3px 0 #ccc, 0 4px 0 #ccc,
    0 5px 0 #ccc, 0 6px 0 transparent, 0 7px 0 transparent, 0 8px 0 transparent,
    0 9px 0 transparent, 0 10px 10px rgba(0, 0, 0, 0.4);
}

h1 span:nth-child(2) {
  -webkit-animation-delay: 0.1s;
}

h1 span:nth-child(3) {
  -webkit-animation-delay: 0.2s;
}

h1 span:nth-child(4) {
  -webkit-animation-delay: 0.3s;
}

h1 span:nth-child(5) {
  -webkit-animation-delay: 0.4s;
}

h1 span:nth-child(6) {
  -webkit-animation-delay: 0.5s;
}

h1 span:nth-child(7) {
  -webkit-animation-delay: 0.6s;
}

h1 span:nth-child(8) {
  -webkit-animation-delay: 0.2s;
}

h1 span:nth-child(9) {
  -webkit-animation-delay: 0.3s;
}

h1 span:nth-child(10) {
  -webkit-animation-delay: 0.4s;
}

h1 span:nth-child(11) {
  -webkit-animation-delay: 0.5s;
}

h1 span:nth-child(12) {
  -webkit-animation-delay: 0.6s;
}

h1 span:nth-child(13) {
  -webkit-animation-delay: 0.7s;
}

h1 span:nth-child(14) {
  -webkit-animation-delay: 0.8s;
}

/* ANIMATION */
@-webkit-keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #ccc, 0 2px 0 #ccc, 0 3px 0 #ccc, 0 4px 0 #ccc,
      0 5px 0 #ccc, 0 6px 0 #ccc, 0 7px 0 #ccc, 0 8px 0 #ccc, 0 9px 0 #ccc,
      0 50px 25px rgba(0, 0, 0, 0.2);
  }
}


/* radio 효과 */
@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 1.5;
    position: relative;
    
  }
  100% {
    height: 150px;
    width: 150px;
    opacity: 0;
    margin-bottom:100px;
    margin-left:-30px;
    
  }
}

.option-input {
  -webkit-appearance: none;
  appearance: none;
  position: relative;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #40e0d0;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

/* 취미수정버튼 효솨 */
#myHobbyListBtn {
  width:120px;
  font-family: myHobbyListBtn;
  color: #FB4264;
  font-size: 15px;

}

@font-face {
  font-family: myHobbyListBtn;
  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
}


#myHobbyListBtn{
  animation: myHobbyListBtn 1s ease infinite;
  -webkit-animation: myHobbyListBtn 1s ease infinite;
}

@keyframes myHobbyListBtn {
  0%,
  100% {
    text: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #fd6584;
  }
  50% {
    text: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}





/* 사진 */
.slide-placeholder {
    position: relative;
}







</style>


</head>
<body>
<jsp:include page="../common/matchingMenu.jsp"/>
   <!-- 메인 DIV -->
   

<div id="myUpdateMainDiv">

	<form action="myupdate.do" onsubmit="return myUpdateBtn();" id="myMemberUpdateForm" method="post" enctype="multipart/form-data">
   <div class="myUpdateMemberBody" >
<h1><span>회</span><span>원</span><span>정</span><span>보</span><span>수</span><span>정</span></h1>
   
 
 <div id="myUpdateMemberImgDiv" >
   
   <!-- 파일  -->
   <div id="myfileList">
   <div id="myFileListDiv1" class="myFileListDiv">
   <img class="myUpdateMemberImg" id="mytitleImg"    src="resources/userface/${loginImg[0].renameFileName}">
   <input type="file" style="display:none" id="mythumbnailImg1" class="mythumbnailImg" multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,1)">
   <input type="hidden" name = "imgorginname" value="${loginImg[0].originalFileName}">
   <input type="hidden" name = "imgrename" value="${loginImg[0].renameFileName}">
   </div>
   
    <div id="myFileListDiv2" class="myFileListDiv" >
     <img  class="myUpdateMemberImg" id="mytitleImg1"    src="resources/userface/${loginImg[1].renameFileName}">
   <input type="file"  style="display:none" id="mythumbnailImg2"  class="mythumbnailImg"  multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,2)">
   <input type="hidden" name = "imgorginname" value="${loginImg[1].originalFileName}">
   <input type="hidden" name = "imgrename" value="${loginImg[1].renameFileName}">
    </div>
    <div id="myFileListDiv3" class="myFileListDiv">
    <img  class="myUpdateMemberImg"  id="mytitleImg2" src="resources/userface/${loginImg[2].renameFileName}">
   <input type="file" style="display:none"  id="mythumbnailImg3"  class="mythumbnailImg"  multiple="multiple" name="mythumbnailImg" onchange="LoadImg(this,3)" >
   <input type="hidden" name = "imgorginname" value="${loginImg[2].originalFileName}">
   <input type="hidden" name = "imgrename" value="${loginImg[2].renameFileName}">
   </div>
  </div>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="color:green">※ 이미지를 클릭하시고 좌우로 움직일 수 있습니다.</label><br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="color:green">※ 2번 클릭하시면 사진 변경이 가능합니다.</label>  
   
   <!-- 이미지 삭제 버튼 -->
 <!--    <div id="myImagefileDelete">
    <button type="button" id="myUpdateMemberImgDelete">삭제합니다</button>
    <button type="button" id="myUpdateMemberImgDelete2">삭제합니다</button>
    <button type="button" id="myUpdateMemberImgDelete3">삭제합니다</button>
    </div> -->

   

   
   <!-- 아이디 DIV  휴대폰DIV-->
   
	<br>  
   <div class="myUpdateMemberDiv" style="float:left; width:100%;">   
	   <label>핸드폰 번호</label>
      <div id="myUpdateMemberPhone">
       <c:forTokens var="myPhoneTokens" items="${myMember.phone }" delims="-" varStatus="status">
		<c:if test="${status.index eq 0 }">
      <input type="text" id="myphone1" name ="phone1" value="${myPhoneTokens}">-
      </c:if>
      
      <c:if test="${status.index eq 1 }"><input type="text" name= "phone2" id="myphone2" value="${myPhoneTokens}">-</c:if>
	  
	  <c:if test="${status.index eq 2 }"><input type="text" name = "phone3" id="myphone3" value="${myPhoneTokens}"></c:if>
	  
      </c:forTokens>
	  </div>
	</div>
   
   <div  class="myUpdateMemberDiv" style="float:left; width:100%; " >
     <label>아이디 </label>
      <div id="myUpdateMemberId"><input type="text" id="myid" name="user_id" style="background:#ebebeb" value="${myMember.user_id }" readonly></div>
  </div>
   
   <!-- 비밀번호 DIV 비밀번호 확인 DIV -->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>비밀번호</label>
      
      <div id="myUpdateMemberPwd"><input type="password" name="user_pwd" id="mypw1"></div>
     </div>
     
 	   <div class="myUpdateMemberDiv" style="float:left; width:55%;"> 
      <label>비밀번호 확인</label>
      <div id="myUpdateMemberPwdCheck" ><input type="password" name="user_pwd2"  id="mypw2"></div>
      </div>
      
    
   
   
   <!-- 별명 DIV 키 DIV-->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">    
      <label >별명</label><br>
      <div id="myUpdateMemberNick" ><input type="text" id="mynick" name="user_nick" value="${myMember.user_nick }"></div>
      </div>
   <div class="myUpdateMemberDiv" style="float:left; width:55%;" > 
      <label >키</label><br>
      <div id="myUpdateMemberHeight" ><input type="text" id="myheight" name="height" value="${myMember.height }">cm</div>
   </div>
   
   
   <!-- 성별 DIV 동성매칭 여부 DIV -->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>성별</label>
      <div id="myUpdateMemberGender" >
      <c:if test="${myMember.gender eq 'M' }">
      <label style="margin-bottom:30px">남자
      <input type="radio" name = "gender" class = "option-input radio" value = "M" checked>&nbsp; 
	  </label>
	  <label style="margin-bottom:30px">여자
	  <input type = "radio" name = "gender" class = "option-input radio" value="F"><br>
	  </label>
	</c:if>
	   <c:if test="${myMember.gender eq 'F' }">
	   <label style="margin-bottom:30px">남자
       <input type="radio" name = "gender" class = "option-input radio" value = "M" >&nbsp; 
		</label>
		<label style="margin-bottom:30px">여자
	   <input type = "radio" name = "gender" class = "option-input radio" value="F" checked><br>
		</label>
	</c:if>
      </div>
    </div>
    <div class="myUpdateMemberDiv" style="float:left; width:55%;">   
      <label>동성매칭여부</label>
      <div id="myUpdateMemberGay">
      <c:if test="${myMember.gay eq 'Y' }">
      <label style="margin-bottom:30px">네
     <input type="radio" name = "gay" class="option-input radio" id="yes" value = "Y" checked>
 	  </label>
 	  <label style="margin-bottom:30px">아니오
		<input type = "radio" name = "gay" class="option-input radio" id="no" value="N">
	</label>
	</c:if>	
	<c:if test="${myMember.gay eq 'N' }">
	<label style="margin-bottom:30px">네
     	 <input type="radio" name = "gay"  class="option-input radio"  value = "Y" >
 	</label>
 	<label style="margin-bottom:30px">아니오
		<input type = "radio" name = "gay" class="option-input radio"  value="N" checked>
	</label>
	</c:if>
	 </div>
   </div>
   


   
   <!-- 나이 DIV  주소 DIV-->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>나이</label>
      <div id="myUpdateMemberAge" ><input type="number" min="20" max="100" name="age" id="myage" value="${myMember.age }"></div>
   </div>
   <div class="myUpdateMemberDiv" style="float:left; width:55%;"> 
    <label>사는 곳</label>
    <div id="myUpdateMemberAddress"><input type="text" name="address" id = "myaddress" value="${myMember.address }"></div>
   </div>
   
   

   
   <!-- 한줄 소개 DIV -->
   <div class="myUpdateMemberDiv" style="float:left; width:45%;">   
      <label>한줄 소개</label>
      <div id="myUpdateMemberInto" ><input type="text" name="user_into" value="${myMember.user_into }"></div>
   </div>
	
	
	
	

	 <div class="myUpdateMemberDiv" style="float:left; width:55%;">   
      <label>취미</label>
      <div id="myUpdateMemberHobby" ><input type="text" id="myHobbyinput" style="background:#ebebeb" readonly >
        <button type="button" id="myHobbyListBtn" class="btn" data-toggle="modal" data-target="#myModal">
		취미 수정
        </div>
 
   </div>
   
  <!-- Button to Open the Modal -->


  <!-- The Modal -->
  <div class="modal myWindow" id="myModal">
    <div class="modal-dialog modal-dialog-scrollable mydialog">
      <div class="modal-content myMain">
      
        <!-- Modal Header -->
        <div class="modal-header myHeader" >
          <h1 class="modal-title #myHobbyListBtn" id="myHobbyListBtn" style="width:450px;margin-top:40px; margint-left:250px; font-size:40px;">취미를 선택해주세요</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body mybody">
        	<div id="myModalBody">
    
        		<div class="myHobbyDiv" style="display:inline-block" ><label class="${myHobby.movie == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">영화</label>
        			<input type="checkbox" id="myMovie" name="movie" class="myHobbyCheck"  value="Y" ${myHobby.movie == "Y" ? "CHECKED" : ""}>
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.sing == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">노래</label>
        		<input type="checkbox" id="mySing" name="sing" class="myHobbyCheck"  value="Y" ${myHobby.sing == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.game == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">게임</label>
        		<input type="checkbox" id="myGame" name="game" class="myHobbyCheck"  value="Y" ${myHobby.game == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<br>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.jmt == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">jMT</label>
        		<input type="checkbox" id="myJmt" name="jmt" class="myHobbyCheck" value="Y" ${myHobby.jmt == "Y" ? "CHECKED" : ""}> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.pet == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">동물</label>
        		 <input type="checkbox" id="myPet" name="pet" class="myHobbyCheck" value="Y" ${myHobby.pet == "Y" ? "CHECKED" : ""}>
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.cafe == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">카페</label>
        		 <input type="checkbox" id="myCafe" name="cafe" class="myHobbyCheck" value="Y" ${myHobby.cafe == "Y" ? "CHECKED" : ""}>
        		</div>
        		<br>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.working == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">산책</label>
        		<input type="checkbox" id="myWorking" name="working" class="myHobbyCheck" value="Y" ${myHobby.working == "Y" ? "CHECKED" : "" }> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.poto == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">사진</label>
        		<input type="checkbox" id="myPoto" name="poto" class="myHobbyCheck" value="Y" ${myHobby.poto == "Y" ? "CHECKED" : "" }> 
        		</div>
        		<div class="myHobbyDiv" style="display:inline-block"><label class="${myHobby.travel == 'Y' ? 'myRemoveClassColor' : 'myAddClassColor' }">여행</label>
        		<input type="checkbox" id="myTravel" name="travel" class="myHobbyCheck" value="Y" ${myHobby.travel == "Y" ? "CHECKED" : "" }> 
        		</div>
        		<br>
        	</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer myFooter">
       
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="myModalMemberUpdate" class="btn btn-primary" data-dismiss="modal">확인</button>
        </div>
        
      </div>
    </div>
  </div>
        
         <div id="myUpdateBtn">
         <button type="submit" class="myUpdateBtnClass">수정완료</button>
        </div>
        
   </div>
</form>          
</div>


<!--   <script>
  $(".myfileList").sortable({
	axis: "x, y",
	update: function (event, ui) {
		var order = $(this).sortable('toArray', {
			attribute: '.myUpdateMemberImg'
		});
		console.log(order);
		console.log(".myUpdateMemberImg");
	}
});  

</script>  -->

<script>

 var myimgcheck1;
 var myimgcheck2;
 var myimgcheck3;
 	/* 모달창 안의 버튼 클릭시 이벤트 */
 	
 	/* function 일어나고 자동으로 $()가 클릭이벤트를 실행함 */
 	$(function(){
 		 $(".myHobbyCheck").hide(); 
 		$("#myModalMemberUpdate").click();
 	});

 	
 	$(document).on('click','.myHobbyDiv', function(){
 		if($(this).children('input').attr('checked') == 'checked'){
 			$(this).children('input').attr('checked', false);
 			 $(this).children('label').removeClass('myRemoveClassColor'); 
 			$(this).children('label').addClass('myAddClassColor');
 		}else{
 			$(this).children('input').attr('checked', true);
 	 		$(this).children('label').removeClass('myAddClassColor'); 
 			$(this).children('label').addClass('myRemoveClassColor');
 		}
 	});

 	// input 태그는 val   label document형식의  html
 	// 모달창안의 데이터 값 출력
 	$(document).on("click","#myModalMemberUpdate", function(){
 		var labelArray=[];
 		$('label[class="myRemoveClassColor"]').each(function(){
 			labelArray.push($(this).html());
 		});
 		 var labelArrayTmp = labelArray.join(",");
 		  $("#myHobbyinput").val(labelArrayTmp);
 	});

</script>

<script>
          /* 
            change : function(e) {
        	  var files = e.target.files;
        	  var filesArr = Array.prototype.slice.call(files);
        	  var form = document.getElementsByClassName("myUpdateMemberImg")
			  var formData = new FormData(form);
        	  for(var i in)
     
           } */
           
           /* 사진 순서 바꾸는 코드 */
     /*       $(function() {
                $("#myfileList").sortable(); 
             $("#myfileList").disableSelection();  // 상자 선택만 하도록 함 텍스트를 선택 취소 할 수있게하려는 경우 유용합니다.
         
         });   */
       
        $("#myfileList").disableSelection();
         $("#myfileList").sortable({
        	    axis: 'x',
        	    placeholder: 'slide-placeholder',
        	    revert: 250
         });
     
</script>

   <script>
   // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 부분
       $(function(){
   $(".mythumbnailImg").hide();   
                   
    $("#mytitleImg").dblclick(function(){
   		$("#mythumbnailImg1").click();
   		});
   $("#mytitleImg1").dblclick(function(){
      $("#mythumbnailImg2").click();
      });
   $("#mytitleImg2").dblclick(function(){
      $("#mythumbnailImg3").click();
      });
    
    }); 
   // 이미지 업로드 
   function LoadImg(value,num){
                  if(value.files[0]!=undefined){   
                     // value는 함수를 발동시킨 객체(file타입 input태그)이고
                     // value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined다.
                     var reader = new FileReader();
                     reader.onload = function(e){
                        switch(num){
                        case 1:
                            var formData = new FormData();
                            formData.append("imgtest",$("#mythumbnailImg1")[0].files[0]); 
                            $.ajax({
                               url: "imgCheckTest.do",
                               data : formData,
                               processData:false,
                               contentType:false,
                               type:'POST',
                               dataType:'JSON',
                               success: function(data){
                            	   myimgcheck1 = data;
                                  var jsonObj = JSON.parse(data);
                                  var faceCount = jsonObj.info.faceCount;
                                  if(faceCount == '0' ){
                                     alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                     $("#mytitleImg").attr("src", "resources/images/image.png");
                                  }else{
                                     if(jsonObj.faces[0].landmark == null){
                                        alert("눈 코 입이 제대로 보이질 않아요 ");
                                        $("#mytitleImg").attr("src", "resources/images/image.png");
                                     }else{
                                      	if(myimgcheck1 == myimgcheck2 || myimgcheck1 == myimgcheck3){
                                     		alert("중복사진 금지 입니다.");
                                     		$("#mytitleImg").attr("src", "resources/images/image.png");
                                     	}else{
                                     		alert("첫번째 사진 등록 완료");
                                             $("#mytitleImg").attr("src", e.target.result);
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
                            formData.append("imgtest",$("#mythumbnailImg2")[0].files[0]); 
                            $.ajax({
                               url: "imgCheckTest.do",
                               data : formData,
                               processData:false,
                               contentType:false,
                               type:'POST',
                               dataType:'JSON',
                               success: function(data){
                            	   
                            	   myimgcheck2 = data;
                                  var jsonObj = JSON.parse(data);
                                  var faceCount = jsonObj.info.faceCount;
                                  if(faceCount == '0' ){
                                     alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                     $("#mytitleImg1").attr("src", "resources/images/image.png");
                                  }else{
                                     if(jsonObj.faces[0].landmark == null){
                                        $("#mytitleImg1").attr("src", "resources/images/image.png");
                                        alert("눈 코 입이 제대로 보이질 않아요 ");
                                     }else{
                                     	if(myimgcheck1 == myimgcheck2 || myimgcheck2 == myimgcheck3){
                                     		alert("중복사진 금지 입니다.");
                                     		$("#mytitleImg1").attr("src", "resources/images/image.png");
                                     	}else{
                                     		alert("두번째 사진 등록 완료");
                                             $("#mytitleImg1").attr("src", e.target.result);
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
                            formData.append("imgtest",$("#mythumbnailImg3")[0].files[0]); 
                            $.ajax({
                               url: "imgCheckTest.do",
                               data : formData,
                               processData:false,
                               contentType:false,
                               type:'POST',
                               dataType:'JSON',
                               success: function(data){
                            	   myimgcheck3 = data;
                                  var jsonObj = JSON.parse(data);
                                  var faceCount = jsonObj.info.faceCount;
                                  /* var landmark = jsonObj.faces[0].landmark; */
                                  if(faceCount == '0' ){
                                     alert("얼굴이 제대로 안나온 사진이네요 ㅠㅠ");
                                     $("#mytitleImg2").attr("src", "resources/images/image.png");
                                  }else{
                                     if(jsonObj.faces[0].landmark == null){
                                        $("#mytitleImg2").attr("src", "resources/images/image.png");
                                        alert("눈 코 입이 제대로 보이질 않아요 ");
                                     }else{
                                     	if(myimgcheck1 == myimgcheck2 || myimgcheck2 == myimgcheck3){
                                     		alert("중복사진은 안되요");
                                     		$("#mytitleImg2").attr("src", "resources/images/image.png");
                                     	}else{
                                     		alert("사람임");
                                             $("#mytitleImg2").attr("src", e.target.result);
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
   </script>

	<!-- 이미지 삭제 -->
<!-- 	<script type="text/javascript">
	$(document).on('click', "#myUpdateMemberImgDelete", function(){
		$("#mytitleImg").attr("src","resources/images/test.png");
		$("#mythumbnailImg1").val("");
	});
	$(document).on('click', "#myUpdateMemberImgDelete2", function(){
		$("#mytitleImg1").attr("src","resources/images/test.png");
		$("#mythumbnailImg2").val("");
	});
	$(document).on('click', "#myUpdateMemberImgDelete3", function(){
		$("#mytitleImg2").attr("src","resources/images/test.png");
		$("#mythumbnailImg3").val("");
	});
	</script> -->


            <!-- 주소 api -->
         <!--    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            <script>
               // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
               $(function(){
                   $("#postcodify_search_button_myBtn").postcodifyPopUp(); 
               });
            </script> -->
		
		<!-- 정보 정규식  -->	
		 <script>
		  function myUpdateBtn(){
	          var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
	          var checkHeight = /^\d*[.]\d{1}$/;
	          var checknum= /[^0-9]/g;
	          // 특수문자 여부
	          var checkPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;  
	          var bool = confirm("수정 하시겠습니까?"); // confirm yes/no 팝업창
	        
	        /*    if($("#mythumbnailImg1").val() == "" && $("#mythumbnailImg2").val() == "" && $("#mythumbnailImg3").val() == ""  ){
	        	   
		            alert(" 사진 3장을 등록하셔야합니다.");
		        
		            return false;
		         }  */
	          		
		        if(checknum.test($("#myphone1").val())){
		        	alert("전화번호는 숫자만 입력하세요");
		        	$("#myphone1").focus();
		        	return false;
		        }
		        if(checknum.test($("#myphone1").val())){
		        	alert("전화번호는 숫자만 입력하세요");
		        	$("#myphone2").focus();
		        	return false;
		        }
		        if(checknum.test($("#myphone1").val())){
		        	alert("전화번호는 숫자만 입력하세요");
		        	$("#myphone3").focus();
		        	return false;
		        }
		         
		         if($("#myphone1").val() == "") {
			  		 alert("전화번로를 입력하세요");
			    	$("#myphone1").focus();
				     return false;
			      }  	
		         
		         if($("#myphone2").val() == "") {
			  		 alert("전화번로를 입력하세요");
			    	$("#myphone2").focus();
				     return false;
			      }  
			       
		         if($("#myphone3").val() == "") {
			  		 alert("전화번로를 입력하세요");
			    	$("#myphone3").focus();
				     return false;
			      }  
		    	  
	         if($("#mypw1").val() == ""){
	            alert("비밀번호를 입력해주세요");
	            $("#mypw1").focus();
	            return false;
	         }
	         if($("#myid").val() == ($("#mypw1").val())) {
	        	 alert("비밀번호가 ID와 똑같습니다!");
	        	 $("#mypw1").val("");
	        	 $("#mypw1").focus();
	        	 return false;
	         } 
	         
	     	
	         if($("#mypw1").val() != $("#mypw2").val()) {
	        	alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
	        	$("#mypw2").val("");
	        	$("#mypw2").focus();
	        	return false;
	         }
	         
	         
	         if($("#mynick").val() == "") {
	        	 alert("별명을 입력해주세요");
	        	 $("#mynick").focus();
	        	 return false;
	         }
	     	if(checkPattern.test($("#mynick").val())) { 
        		 alert("특수문자가 포함되었습니다. 별명을 다시 입력해주세요.");		         
        		 $("#mynick").val("");
        		 $("#mynick").focus();
         	 return false;
 	     	} 
	         
	     	  if($("#myheight").val() == "") {
		        	 alert("키를 입력해주세요");
		        	 $("#myheight").val("");
		        	 $("#myheight").focus();
		        	 return false;
		         }
	     	
	         if(checkHeight.test($("#myheight").val())){
	        	 alert("소수점을 제외하고 키를 입력해주세요");
	        	 $("#myheight").val("");
	        	 $("#myheight").focus("");
	        	 return false;
	         }
	          
	         
	         if($("#myage").val() == ""){
	            alert("나이 입력해주세요");
	            $("#myage").focus();
	            return false;
	         }
	        
	         if($("#detailAddress").val() == ""){
	            alert("주소를 입력해주세요");
	            $("#detailAddress").focus();
	            return false;
	         }
	         
	         if($("#myHobbyinput").val() == ""){
	        	 alert("취미를 골라주세요");
	        	 return false;
	        	 
	         }
	         
	         if(bool == false) {
	              
	               return false;
	            }else{
	               alert("수정되었습니다.");
	            }
		  }
		</script>

</body>
</html>